package com.pfe.servlets;



import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pfe.beans.Evenement;
import com.pfe.dao.DaoFactory;
import com.pfe.dao.EvenementDao;




@WebServlet("/Evenements")
public class Evenements extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EvenementDao evenementDao;
	
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.evenementDao = daoFactory.getEvenementDao();
	}
	      
    
    public Evenements() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
		request.setAttribute("evenements", evenementDao.lister());
		
		String sou="Soutenance";
		request.setAttribute("Soutenance",sou);
		String aut="Autre";
		request.setAttribute("Autre",aut);
		String con="Conference";
		request.setAttribute("Conference",con);
		String reu="Reunion";
		request.setAttribute("Reunion",reu);
		String foru="Forum";
		request.setAttribute("Forum",foru);
		String ent="Entretien";
		request.setAttribute("Entretien",ent);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/evenement.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String cache=request.getParameter("cacher");
		if(cache.equals("ajouter"))
		{
		String typeEvenement=request.getParameter("type");
	     String autre="Autre";
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
        String datesaisie=request.getParameter("dateEvenement");
        java.util.Date dateutil=null;
        
			try {
				
				dateutil  =  sdf.parse(datesaisie);
			} catch (ParseException e) {
				
				e.printStackTrace();
			}
		
      java.sql.Date datesql=new java.sql.Date(dateutil.getTime());
     
      
		
      Evenement evenement =new Evenement();
		evenement.setTitre(request.getParameter("titre"));
		evenement.setMessage(request.getParameter("message"));
		evenement.setDate(datesql);
		if(typeEvenement.equals(autre) != true) {
		evenement.setType(request.getParameter("type"));
		}
		else {
			evenement.setType(request.getParameter("autre"));
		}
		evenementDao.ajouter(evenement);
		
		boolean reussit = true;
		request.setAttribute("reussit",reussit);
		}
		else if(cache.equals("supprimer")) 
		{
		   String[] evenementSupprime=request.getParameterValues("evenementSupprime");
		      if(evenementSupprime!=null) 
		      {
		    	  for(int i=0;i<evenementSupprime.length;i++) 
		    	  {
						int id=Integer.parseInt(evenementSupprime[i]);
						evenementDao.supprimer(id);
					
			      }
			
		     }
		     else 
		     {
			     System.out.println("");
		       
		     }
		
	   }
	   else if(cache.equals("modifier"))
		{
			String evenementModifier=request.getParameter("evenementModifier");
			if(evenementModifier!=null) {
				int id=Integer.parseInt(evenementModifier);
				request.setAttribute("evenement", evenementDao.lister(id));
				
				
				
			}
			
		}
		
	   else if(cache.equals("enregistrerModification")) {
		   
		   
		   
		   String typeEvenement=request.getParameter("type");
		     String autre="Autre";
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
	        String datesaisie=request.getParameter("dateEvenement");
	        java.util.Date dateutil=null;
	        
				try {
					
					dateutil  =  sdf.parse(datesaisie);
				} catch (ParseException e) {
					
					e.printStackTrace();
				}
			
	      java.sql.Date datesql=new java.sql.Date(dateutil.getTime());
	     
	      
			
	      Evenement evenement =new Evenement();
		    String id_evenement=request.getParameter("idEvenement");
		    int id=Integer.parseInt(id_evenement);
		    evenement.setId_evenement(id);
		    evenement.setTitre(request.getParameter("titre"));
			evenement.setMessage(request.getParameter("message"));
			evenement.setDate(datesql);
			if(typeEvenement.equals(autre) != true) {
			evenement.setType(request.getParameter("type"));
			}
			else {
				evenement.setType(request.getParameter("autre"));
			}
			evenementDao.modifier(evenement);
			
			boolean modificationreussit = true;
			request.setAttribute("modificationreussit",modificationreussit);
		   
		   
		   
	   }
		
      doGet(request,response);
	

	}


	


	

}