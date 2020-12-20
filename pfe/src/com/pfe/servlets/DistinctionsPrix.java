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


@WebServlet("/DistinctionsPrix")
public class DistinctionsPrix extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
	}
       

    public DistinctionsPrix() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
		utilisateurs = utilisateurDao.lister();
		request.setAttribute("utilisateurs", utilisateurs);
		this.getServletContext().getRequestDispatcher("/WEB-INF/distinctionPrix.jsp").forward( request,response ) ;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/distinctionPrix.jsp").forward( request,response ) ;
	}

}
