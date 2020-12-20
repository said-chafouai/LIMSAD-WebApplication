package com.pfe.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pfe.beans.Directeur;
import com.pfe.beans.Utilisateur;
import com.pfe.dao.DaoFactory;
import com.pfe.dao.DirecteurDao;
import com.pfe.dao.UtilisateurDao;

@WebServlet("/Profil")
public class Profil extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	private DirecteurDao directeurDao;
    
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
		this.directeurDao = daoFactory.getDirecteurDao();
	}
	
    public Profil() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/profil.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Utilisateur utilisateur = new Utilisateur();
		HttpSession session = request.getSession();
		
		String grade = (String)session.getAttribute("grade");
		String cne = (String)session.getAttribute("cne");
		String mdp = request.getParameter("mdp");
		
		if(grade == null && cne == null) {
			Directeur directeur = new Directeur();
			directeur.setMdp(mdp);
			directeurDao.modifier(directeur);
		}else {
			Integer id_user = (Integer)session.getAttribute("login");
			utilisateur.setLogin(id_user);
			utilisateur.setMdp(mdp);
			utilisateurDao.modifier(utilisateur,"mdp");
			}
		
		boolean confirmation = true;
		request.setAttribute("confirmation", confirmation);
		this.getServletContext().getRequestDispatcher("/WEB-INF/profil.jsp").forward(request, response);
	}

}
