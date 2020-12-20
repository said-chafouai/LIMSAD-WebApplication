package com.pfe.form;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pfe.beans.BrevetDroit;
import com.pfe.beans.Ouvrage;
import com.pfe.beans.Utilisateur;
import com.pfe.dao.BrevetDroitDao;
import com.pfe.dao.DaoFactory;
import com.pfe.dao.OuvrageDao;
import com.pfe.dao.UtilisateurDao;


@WebServlet("/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String CHEMIN = "chemin";
	public static final String ATT_FICHIER = "fichier";
	public static final String ATT_FORM = "form";
	public static final String VUE = "/WEB-INF/upload.jsp";
	private BrevetDroitDao brevetdroitDao;
	private UtilisateurDao utilisateurDao;
	private OuvrageDao ouvrageDao;
	
	
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();	
		this.brevetdroitDao = daoFactory.getBrevetDroitDao();
		this.ouvrageDao = daoFactory.getOuvrageDao();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
		this.brevetdroitDao = daoFactory.getBrevetDroitDao();

       
	}
       
  
    public Upload() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* Affichage de la page d'upload */
		
		request.setAttribute("bd",brevetdroitDao.listerbrevet(5));
		this.getServletContext().getRequestDispatcher(VUE).forward( request, response );
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		String chemin = this.getServletConfig().getInitParameter(CHEMIN);
		//Préparation de l'objet formulaire
		UploadForm form = new UploadForm();
		// Traitement de la requête et récupération du bean en résultant
		Fichier fichier = form.enregistrerFichier(request, chemin);
		// Stockage du formulaire et du bean dans l'objet request
		request.setAttribute(ATT_FORM, form);
		request.setAttribute(ATT_FICHIER, fichier);
		this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
		*/
		
		String choix = request.getParameter("choix");
		
		if (choix.equals("brevetDroit")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String datesaisie = request.getParameter("dateDepot");
			java.util.Date dateutil = null;
			try {
				dateutil = sdf.parse(datesaisie);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			HttpSession session = request.getSession(true);
			
			//Lecture du paramètre 'chemin' passé à la servlet via la déclaration dans le web.xml
			String chemin = this.getServletConfig().getInitParameter(CHEMIN );
			// Préparation de l'objet formulaire 
			UploadForm form = new UploadForm();
			//Traitement de la requête et récupération du bean en résultant
			Fichier fichier = form.enregistrerFichier(request, chemin);
			
			Integer id_user = (Integer) session.getAttribute("login");
			java.sql.Date datesql = new java.sql.Date(dateutil.getTime());
			BrevetDroit brevetDroit = new BrevetDroit();
			brevetDroit.setIntitule(request.getParameter("intitule"));
			brevetDroit.setType(request.getParameter("type"));
			brevetDroit.setNumeroDepot(Integer.parseInt(request.getParameter("numeroDepot")));
			brevetDroit.setNumeroEnregistrement(Integer.parseInt(request.getParameter("numeroEnregistrement")));
			brevetDroit.setDateDepot(datesql);
			brevetDroit.setChampApplication(request.getParameter("champApplication"));
			brevetDroit.setActeurexterne(request.getParameter("auteur"));
			brevetDroit.setId_utilisateur(id_user);
			brevetDroit.setPreuve(fichier.getNom());

			brevetdroitDao.ajouter(brevetDroit);
			String[] participant = request.getParameterValues("participant");
			if (participant != null) {
				for (int i = 0; i < participant.length; i++) {
					int id = Integer.parseInt(participant[i]);
					brevetdroitDao.declarer_participant(brevetdroitDao.dernierBrevet(), id);
				}
			}
			boolean reussit = true;
			request.setAttribute("reussit", reussit);
			List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
			utilisateurs = utilisateurDao.lister();
			request.setAttribute("utilisateurs", utilisateurs);
			
			if(id_user!=null) {
			    request.setAttribute("brevets",brevetdroitDao.lister(id_user,"nonvalide"));
				request.setAttribute("brevetsvalide",brevetdroitDao.lister(id_user,"valide"));
				request.setAttribute("brevetsparticipant",brevetdroitDao.lister_participant(id_user,"nonvalide"));
				request.setAttribute("brevetsparticipantvalide",brevetdroitDao.lister_participant(id_user,"valide"));
			}
			this.getServletContext().getRequestDispatcher("/WEB-INF/brevetDroit.jsp").forward( request,response ) ;
		}else if(choix.equals("ouvrage")) {
			
			//Lecture du paramètre 'chemin' passé à la servlet via la déclaration dans le web.xml
			String chemin = this.getServletConfig().getInitParameter(CHEMIN );
			// Préparation de l'objet formulaire 
			UploadForm form = new UploadForm();
			//Traitement de la requête et récupération du bean en résultant
			Fichier fichier = form.enregistrerFichier(request, chemin);
			
			HttpSession session = request.getSession(true);
			Integer id_user = (Integer)session.getAttribute("login");
			Ouvrage ouvrage = new Ouvrage();
			ouvrage.setIntitule(request.getParameter("intitule"));
			ouvrage.setMaisonEdition(request.getParameter("maisonEdition"));
			ouvrage.setIssn(request.getParameter("issn"));
			ouvrage.setIsbn(request.getParameter("isbn"));
			ouvrage.setPreuve(fichier.getNom());
			String dateSaisie = request.getParameter("date");
				
			//### traitement de la date ####
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date dateJava = null;
				try {
					dateJava = sdf.parse(dateSaisie);
				}catch(ParseException e) {
				}
					
				java.sql.Date dateOuvrage = new java.sql.Date(dateJava.getTime());
			//### END : traitement de date ####
					
				ouvrage.setDateOuvrage(dateOuvrage);
				ouvrage.setActeurExterne(request.getParameter("auteur"));
				ouvrageDao.ajouter(id_user, ouvrage);
				
				
				String[] participant = request.getParameterValues("participant");
				if(participant!=null) {
					for(int i=0;i<participant.length;i++) {
						int id=Integer.parseInt(participant[i]);
						ouvrageDao.declarer_participant(ouvrageDao.dernierOuvrage(),id);
					}
				}
				
				List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
				utilisateurs = utilisateurDao.lister();
				request.setAttribute("utilisateurs", utilisateurs);
				if(id_user!=null) {
					request.setAttribute("ouvragesAttentes",ouvrageDao.lister(id_user, "attente"));
					request.setAttribute("ouvragesValiders",ouvrageDao.lister(id_user, "valider"));
				}
				
				this.getServletContext().getRequestDispatcher("/WEB-INF/ouvrage.jsp").forward( request,response ) ;
				
			}			
		
	}

}
