package com.pfe.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pfe.dao.BrevetDroitDao;
import com.pfe.dao.DaoFactory;
import com.pfe.dao.FormationDao;
import com.pfe.dao.LitteraireDao;
import com.pfe.dao.OuvrageDao;
import com.pfe.dao.UtilisateurDao;


@WebServlet("/DoctorantsEncadres")
public class DoctorantsEncadres extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UtilisateurDao utilisateurDao;
	private FormationDao formationDao;
	private BrevetDroitDao brevetdroitDao;
	private OuvrageDao ouvrageDao;
	private LitteraireDao litteraireDao;
	
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
		this.formationDao = daoFactory.getFormationDao();
		this.ouvrageDao = daoFactory.getOuvrageDao();
		this.brevetdroitDao = daoFactory.getBrevetDroitDao();
		this.litteraireDao = daoFactory.getLitteraireDao();
	}
    public DoctorantsEncadres() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(true);
	        Integer id_user = (Integer)session.getAttribute("login");
			if(id_user!=null) {
				request.setAttribute("doctorants",utilisateurDao.doctorants(id_user));
				
			}
		this.getServletContext().getRequestDispatcher("/WEB-INF/doctorantEncadre.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String cache=request.getParameter("cacher");
			if(cache.equals("afficher")) {
				int id=Integer.parseInt(request.getParameter("doctorantselect"));
	
		request.setAttribute("formationsvalide",formationDao.lister(id,"valide"));
		request.setAttribute("brevetsvalide",brevetdroitDao.lister(id,"valide"));
		request.setAttribute("ouvragesValiders",ouvrageDao.lister(id, "valider"));
		request.setAttribute("litterairesvalide",litteraireDao.lister(id,"valide"));
		request.setAttribute("litterairesparticipantvalide",litteraireDao.lister_participant(id,"valide"));
		
		
			}
		doGet(request,response);
	}

}
