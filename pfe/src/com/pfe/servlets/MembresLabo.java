package com.pfe.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pfe.dao.DaoFactory;
import com.pfe.dao.UtilisateurDao;

@WebServlet("/MembresLabo")
public class MembresLabo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;

	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
	}
	
    public MembresLabo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("utilisateurs", utilisateurDao.lister());
		this.getServletContext().getRequestDispatcher("/WEB-INF/membreLabo.jsp").forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String choix = request.getParameter("choix");
		String users[] = request.getParameterValues("user");
		if(users != null) {
			int taille = users.length;
			if(choix.equals("activer")) {
				for(int i = 0; i < taille ; i++) {
					Integer id_user = Integer.parseInt(users[i]);
					utilisateurDao.session(id_user, "activer");
				}
			}else if(choix.equals("desactiver")){
				for(int i = 0; i < taille ; i++) {
					Integer id_user = Integer.parseInt(users[i]);
					utilisateurDao.session(id_user, "desactiver");
				}
			}
		}
		
		
		
		doGet(request,response);
	}

}
