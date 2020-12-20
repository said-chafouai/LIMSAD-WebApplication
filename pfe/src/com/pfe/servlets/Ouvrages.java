package com.pfe.servlets;

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

import com.pfe.beans.Ouvrage;
import com.pfe.beans.Utilisateur;
import com.pfe.dao.DaoFactory;
import com.pfe.dao.OuvrageDao;
import com.pfe.dao.UtilisateurDao;

@WebServlet("/Ouvrages")
public class Ouvrages extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	private OuvrageDao ouvrageDao;
	
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
		this.ouvrageDao = daoFactory.getOuvrageDao();

	}   

    public Ouvrages() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
		utilisateurs = utilisateurDao.lister();
		request.setAttribute("utilisateurs", utilisateurs);
		
		HttpSession session = request.getSession(true);
		
		Integer id_user = (Integer)session.getAttribute("login");
		if(id_user!=null) {
			request.setAttribute("ouvragesAttentes",ouvrageDao.lister(id_user, "attente"));
			request.setAttribute("ouvragesValiders",ouvrageDao.lister(id_user, "valider"));
		}
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/ouvrage.jsp").forward( request,response ) ;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String form = request.getParameter("formOuvrage");
		Ouvrage ouvrage = new Ouvrage();
		
		HttpSession session = request.getSession(true);
		Integer id_user = (Integer)session.getAttribute("login");
		
		if(form.equals("ajouter")) {
			
			ouvrage.setIntitule(request.getParameter("intitule"));
			ouvrage.setMaisonEdition(request.getParameter("maisonEdition"));
			ouvrage.setIssn(request.getParameter("issn"));
			ouvrage.setIsbn(request.getParameter("isbn"));
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
			
		}
		else if(form.equals("modifierChoix")) {
			
			String idS = request.getParameter("ouvrageModifier");
			if(idS != null) {
				int id = Integer.parseInt(idS);
				request.setAttribute("ouvrageChoisit",ouvrageDao.lister(id));
			}
			
		}else if(form.equals("modifier")) {
			
			int id = Integer.parseInt(request.getParameter("idOuvrage"));
			ouvrage.setId(id);
			ouvrage.setIntitule(request.getParameter("intitule"));
			ouvrage.setMaisonEdition(request.getParameter("maisonEdition"));
			ouvrage.setIssn(request.getParameter("issn"));
			ouvrage.setIsbn(request.getParameter("isbn"));
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
			ouvrageDao.modifier(ouvrage);
			
		}else if(form.equals("supprimer")) {
			
			String idS = request.getParameter("ouvrageSupprimer");
			if(idS != null) {
				int id = Integer.parseInt(idS);
				ouvrageDao.supprimerparticipant(id);
				ouvrageDao.supprimer(id);
			}
			
		}
		
		doGet(request,response);
		
	}

}
