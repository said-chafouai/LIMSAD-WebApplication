package com.pfe.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pfe.beans.BrevetDroit;
import com.pfe.beans.EmailBeans;
import com.pfe.beans.Ouvrage;
import com.pfe.beans.Utilisateur;
import com.pfe.dao.BrevetDroitDao;
import com.pfe.dao.DaoFactory;
import com.pfe.dao.EquipeDao;
import com.pfe.dao.OuvrageDao;
import com.pfe.dao.UtilisateurDao;

@WebServlet("/NotificationsDirecteur")
public class NotificationsDirecteur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OuvrageDao ouvrageDao;
	private UtilisateurDao utilisateurDao;
	private EquipeDao equipeDao;
	private BrevetDroitDao brevetdroitDao;
	
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.ouvrageDao = daoFactory.getOuvrageDao();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
		this.equipeDao = daoFactory.getEquipeDao();
		this.brevetdroitDao = daoFactory.getBrevetDroitDao();
	} 
       
    public NotificationsDirecteur() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Ouvrage> ouvrages = new ArrayList<Ouvrage>();
		ouvrages = ouvrageDao.lister("attente");
		if(ouvrages.size()> 0) {
			request.setAttribute("ouvrageExiste", true);
			request.setAttribute("ouvragesAttentes", ouvrages);
		}
		
		
		List<BrevetDroit> brevetsDroits = new ArrayList<BrevetDroit>();
		brevetsDroits = brevetdroitDao.lister("attente");
		if(brevetsDroits.size()> 0) {
			request.setAttribute("brevetExiste", true);
			request.setAttribute("brevetsDroitsAttentes", brevetsDroits);
		}
		
		request.setAttribute("utilisateurs", utilisateurDao.lister());
		request.setAttribute("equipes", equipeDao.lister());
		this.getServletContext().getRequestDispatcher("/WEB-INF/notificationDirecteur.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String form = request.getParameter("form");
		String choix = request.getParameter("choix");

		if(form.equals("ouvrage")){
			String activiteChoisit[] = request.getParameterValues("activiteChoisit");
			if(activiteChoisit != null) {
				if(choix.equals("valider")) {
					for(int i=0; i < activiteChoisit.length; i++)
						ouvrageDao.valider(Integer.parseInt(activiteChoisit[i]));
				}else if(choix.equals("rejeter")) {
					for(int i=0; i < activiteChoisit.length; i++) {
						ouvrageDao.supprimerparticipant(Integer.parseInt(activiteChoisit[i]));
						ouvrageDao.supprimer(Integer.parseInt(activiteChoisit[i]));
					}
				}
			}
		}else if(form.equals("brevetDroit")) {
			String activiteChoisit[] = request.getParameterValues("activiteChoisit");
			if(activiteChoisit != null) {
				if(choix.equals("valider")) {
					for(int i=0; i < activiteChoisit.length; i++)
						brevetdroitDao.valider(Integer.parseInt(activiteChoisit[i]));
				}else if(choix.equals("rejeter")) {
					for(int i=0; i < activiteChoisit.length; i++)
						brevetdroitDao.supprimer(Integer.parseInt(activiteChoisit[i]));
				}
			}
			
		}else if(form.equals("doctorant")) {
			Integer login = Integer.parseInt(request.getParameter("user"));
			if(choix.equals("valider")) {
				// recuperer les info
				// l'envoie de l'email
				String encadrant = request.getParameter("encadrant");
				String these = request.getParameter("these");
				String equipe = request.getParameter("equipe");
				if(login != null && !"".equals(encadrant) && !"".equals(these) && !"".equals(equipe)) {
					List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
					utilisateurs = utilisateurDao.lister();
					int i=0 , taille = utilisateurs.size();
					while(i < taille && utilisateurs.get(i).getLogin() != login ) i++;
					if(i<taille) {
						// creer les nouveau changement de doctorant
						Utilisateur doc = new Utilisateur();
						doc.setNom(utilisateurs.get(i).getNom());
						doc.setLogin(login);
						doc.setEncadrant(Integer.parseInt(encadrant));
						doc.setEquipe(Integer.parseInt(equipe));
						doc.setThese(these);
						doc.setEmail(utilisateurs.get(i).getEmail());
						doc.setMdp(NotificationsDirecteur.generateurMdp());
						
						
						// outgoing message information
				        String mailTo = doc.getEmail();
				        String subject = "Laboratoire d'Informatique Mathématique et Aide à la Decision";
				        String message = "Bonjour Mr/Mme "+doc.getNom()+" Votre demande d'intégrer LIMSAD est acceptée\n\n"+
				        "\tVotre Identifiant : "+mailTo+"\n"+
				        "\tVotre Mot de passe: "+doc.getMdp()+"\n"+
				        "\n\n A bientot \n"+
				        "Directeur de Limsad"; 
				        

				        // l'envoie de l'email
				        EmailBeans mailer = new EmailBeans();
				        try {
				            mailer.sendPlainTextEmail(mailTo,subject, message);
				            request.setAttribute("etat", true);
				            utilisateurDao.modifier(doc,"doctorant");
				            System.out.println("mdp : "+doc.getMdp());
				            
				        } catch (Exception ex) {
				            request.setAttribute("etat",false);
				            ex.printStackTrace();
				        }
						
						// envoie de l'email
					}
				}
			}else if(choix.equals("rejeter")) {
				// suppression du compte
				if(login != null)
					utilisateurDao.supprimer(login);
			}
		}else if(form.equals("enseignant")) {
			Integer login = Integer.parseInt(request.getParameter("user"));
			if(choix.equals("valider")) {
				// recuperer les info
				// l'envoie de l'email
				String equipe = request.getParameter("equipe");
				if(login != null && !"".equals(equipe)) {
					List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
					utilisateurs = utilisateurDao.lister();
					int i=0 , taille = utilisateurs.size();
					while(i < taille && utilisateurs.get(i).getLogin() != login ) i++;
					if(i<taille) {
						// creer les nouveau changement de doctorant
						Utilisateur enseignant = new Utilisateur();
						enseignant.setNom(utilisateurs.get(i).getNom());
						enseignant.setLogin(login);
						enseignant.setEquipe(Integer.parseInt(equipe));
						enseignant.setEmail(utilisateurs.get(i).getEmail());
						enseignant.setMdp(NotificationsDirecteur.generateurMdp());
						
						
						// outgoing message information
				        String mailTo = enseignant.getEmail();
				        String subject = "Laboratoire d'Informatique Mathématique et Aide à la Decision";
				        String message = "Bonjour Mr/Mme "+enseignant.getNom()+" Votre demande d'intégrer LIMSAD est acceptée\n\n"+
				        "\tVotre Identifiant : "+mailTo+"\n"+
				        "\tVotre Mot de passe: "+enseignant.getMdp()+"\n"+
				        "\n\n A bientot \n"+
				        "Directeur de Limsad"; 
				        

				        // l'envoie de l'email
				        EmailBeans mailer = new EmailBeans();
				        try {
				            mailer.sendPlainTextEmail(mailTo,subject, message);
				            utilisateurDao.modifier(enseignant,"ensiegnant");
				            System.out.println("mdp : "+enseignant.getMdp());
				            request.setAttribute("etat", true);
				        } catch (Exception ex) {
				            request.setAttribute("etat",false);
				            ex.printStackTrace();
				        }
						
					}
				}
			}else if(choix.equals("rejeter")) {
				// suppression du compte
				if(login != null)
					utilisateurDao.supprimer(login);
			}
		}
		doGet(request,response);
	
	}
	
	
	public static String generateurMdp() {
		String chaine="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_-";
		String mdp="";
		
		for(int i=0; i < 8; i++)
			mdp+=chaine.charAt((int)Math.floor(Math.random()*64));	
			
		return mdp;
		
	}

	
	
	
}
