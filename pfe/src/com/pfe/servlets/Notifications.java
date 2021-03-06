package com.pfe.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pfe.beans.Utilisateur;
import com.pfe.dao.DaoFactory;
import com.pfe.dao.FormationDao;
import com.pfe.dao.LitteraireDao;
import com.pfe.dao.PartenariatDao;
import com.pfe.dao.UtilisateurDao;


@WebServlet("/Notifications")
public class Notifications extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	private FormationDao formationDao;
	private LitteraireDao litteraireDao;
	private PartenariatDao partenariatDao;
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
	    this.litteraireDao = daoFactory.getLitteraireDao();
		this.formationDao = daoFactory.getFormationDao();
		this.partenariatDao=daoFactory.getPartenariatDao();

       
	}
    
    public Notifications() {
        super();

    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
		utilisateurs = utilisateurDao.lister();
		request.setAttribute("utilisateurs", utilisateurs);
		HttpSession sessio = request.getSession(true);
		
		Integer id_user = (Integer)sessio.getAttribute("login");
		if(id_user!=null) {
		    request.setAttribute("formations",formationDao.lister(id_user));
		    request.setAttribute("litteraires",litteraireDao.lister(id_user));
		    request.setAttribute("partenariats",partenariatDao.lister(id_user));
			
			
		}
		
		
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/notification.jsp").forward( request,response ) ;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cache=request.getParameter("cacher");
		if(cache.equals("formation")) {
			String choix=request.getParameter("choix");
			if(choix.equals("rejeterFormation")){
				String[] activiteChoisit=request.getParameterValues("activiteChoisit");
			      if(activiteChoisit!=null) 
			      {
			    	  for(int i=0;i<activiteChoisit.length;i++) 
			    	  {
							int id=Integer.parseInt(activiteChoisit[i]);
							formationDao.supprimer(id);
						
				      }
				
			     }
			     else 
			     {
				     System.out.println("");
			       
			     }}
			else if(choix.equals("validerFormaation")){
						String[] activiteChoisit=request.getParameterValues("activiteChoisit");
					      if(activiteChoisit!=null) 
					      {
					    	  for(int i=0;i<activiteChoisit.length;i++) 
					    	  {
									int id=Integer.parseInt(activiteChoisit[i]);
									formationDao.valide(id);
								
						      }
						
					     }
					     else 
					     {
						     System.out.println("");
					       
					     }
				
			}
			
			
			
		}
		
		else if(cache.equals("litteraire")) {
			String choix=request.getParameter("choix");
			if(choix.equals("rejeterlitteraire")){
				String[] activiteChoisit=request.getParameterValues("activiteChoisit");
			      if(activiteChoisit!=null) 
			      {
			    	  for(int i=0;i<activiteChoisit.length;i++) 
			    	  {
							int id=Integer.parseInt(activiteChoisit[i]);
							litteraireDao.supprimer(id);
						
				      }
				
			     }
			     else 
			     {
				     System.out.println("");
			       
			     }}
			else if(choix.equals("validerlitteraire")){
						String[] activiteChoisit=request.getParameterValues("activiteChoisit");
					      if(activiteChoisit!=null) 
					      {
					    	  for(int i=0;i<activiteChoisit.length;i++) 
					    	  {
									int id=Integer.parseInt(activiteChoisit[i]);
									litteraireDao.valide(id);
								
						      }
						
					     }
					     else 
					     {
						     System.out.println("");
					       
					     }
				
			}
			
			
			
		}
		else if(cache.equals("partenariat")) {
			String choix=request.getParameter("choix");
			if(choix.equals("rejeterpartenariat")){
				String[] activiteChoisit=request.getParameterValues("activiteChoisit");
			      if(activiteChoisit!=null) 
			      {
			    	  for(int i=0;i<activiteChoisit.length;i++) 
			    	  {
							int id=Integer.parseInt(activiteChoisit[i]);
							partenariatDao.supprimer(id);
						
				      }
				
			     }
			     else 
			     {
				     System.out.println("");
			       
			     }}
			else if(choix.equals("validerpartenariat")){
						String[] activiteChoisit=request.getParameterValues("activiteChoisit");
					      if(activiteChoisit!=null) 
					      {
					    	  for(int i=0;i<activiteChoisit.length;i++) 
					    	  {
									int id=Integer.parseInt(activiteChoisit[i]);
									partenariatDao.valide(id);
								
						      }
						
					     }
					     else 
					     {
						     System.out.println("");
					       
					     }
				
			}
			
			
			
		}
		
		
		
		
		
		
		doGet(request,response);
	}

}
