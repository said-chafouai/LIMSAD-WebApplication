package com.pfe.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pfe.beans.Utilisateur;
import com.pfe.dao.DaoFactory;
import com.pfe.dao.UtilisateurDao;

@WebServlet("/Inscription")
public class Inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
	}
       
    
    public Inscription() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/inscription.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Utilisateur utilisateur = new Utilisateur();
		List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
		utilisateurs = utilisateurDao.lister();
		int taille = utilisateurs.size(), i;
		boolean etat = false;
		
		utilisateur.setEtat(false);
		utilisateur.setNom(request.getParameter("nom").toUpperCase());
		utilisateur.setPrenom(request.getParameter("prenom").toLowerCase());
		utilisateur.setEmail(request.getParameter("email").toLowerCase());
		utilisateur.setGsm(request.getParameter("gsm"));
		utilisateur.setAdresse(request.getParameter("adresse"));
		utilisateur.setGrade(request.getParameter("grade"));
		utilisateur.setCne(request.getParameter("cne"));

		
		for(i = 0; i < taille; i++) {
			if(utilisateurs.get(i).getEmail().equalsIgnoreCase(utilisateur.getEmail()) || utilisateurs.get(i).getGsm().equals(utilisateur.getGsm()) || (utilisateurs.get(i).getCne() != null && utilisateurs.get(i).getCne().equals(utilisateur.getCne()))) {
		 		etat = true;
		 		break;
		 	}	
		}
		
		if(etat == true){
			String echec = "informations incorrect merci de vérifier votre email,cne,gsm";
			request.setAttribute("echec",echec);
			this.getServletContext().getRequestDispatcher("/WEB-INF/inscription.jsp").forward(request, response);
		}
		else {
	        utilisateurDao.ajouter(utilisateur);
			this.getServletContext().getRequestDispatcher("/WEB-INF/inscriptionReussit.jsp").forward(request, response);
			
		}
	}

}