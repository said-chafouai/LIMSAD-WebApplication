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

import com.pfe.beans.Formation;
import com.pfe.beans.Utilisateur;
import com.pfe.dao.DaoFactory;
import com.pfe.dao.FormationDao;
import com.pfe.dao.UtilisateurDao;

@WebServlet("/FormationsPersonnelles")
public class FormationsPersonnelles extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	private FormationDao formationDao;
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
	
		this.formationDao = daoFactory.getFormationDao();

       
	}
    public FormationsPersonnelles() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
		utilisateurs = utilisateurDao.lister();
		request.setAttribute("utilisateurs", utilisateurs);
		HttpSession sessio = request.getSession(true);
		
		Integer id_user = (Integer)sessio.getAttribute("login");
		if(id_user!=null) {
		    request.setAttribute("formations",formationDao.lister(id_user,"nonvalide"));
			request.setAttribute("formationsvalide",formationDao.lister(id_user,"valide"));
			
		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/formationPersonnelle.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String cache=request.getParameter("cacher");
			if(cache.equals("ajouter")) {
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				
		        String datesaisie=request.getParameter("dateFormation");
		        java.util.Date dateutil=null;
		        
					try {
						
						dateutil  =  sdf.parse(datesaisie);
					} catch (ParseException e) {
						
						e.printStackTrace();
					}
					HttpSession sessio = request.getSession(true);
					
					Integer id_user = (Integer)sessio.getAttribute("login");
					java.sql.Date datesql=new java.sql.Date(dateutil.getTime());
					Formation formation =new Formation();
					formation.setIntitule(request.getParameter("intitule"));
					formation.setDateformation(datesql);
					formation.setId_utilisateur(id_user);
					
					formationDao.ajouter(formation);
					}
			else if(cache.equals("supprimer")) 
			{
				   String[] formationsSupprime=request.getParameterValues("formationsSupprime");
				      if(formationsSupprime!=null) 
				      {
				    	  for(int i=0;i<formationsSupprime.length;i++) 
				    	  {
								int id=Integer.parseInt(formationsSupprime[i]);
								formationDao.supprimer(id);
							
					      }
					
				     }
				     else 
				     {
					     System.out.println("");
				       
				     }
				
			   }
			else if(cache.equals("modifier")) 
			{

				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				
		        String datesaisie=request.getParameter("dateformation");
		        java.util.Date dateutil=null;
		        
					try {
						
						dateutil  =  sdf.parse(datesaisie);
					} catch (ParseException e) {
						
						e.printStackTrace();
					}
					HttpSession sessio = request.getSession(true);
					
					Integer id_user = (Integer)sessio.getAttribute("login");
					java.sql.Date datesql=new java.sql.Date(dateutil.getTime());
					Formation formation =new Formation();
					formation.setIntitule(request.getParameter("intitule"));
					formation.setDateformation(datesql);
					formation.setId_utilisateur(id_user);
					int id=Integer.parseInt(request.getParameter("idformation"));
					formation.setId_formation(id);
					
					formationDao.modifier(formation);
				
			   }
			
			
			
			
		doGet(request,response);
	}

}
