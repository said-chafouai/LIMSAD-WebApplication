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

import com.pfe.beans.Litteraire;
import com.pfe.beans.Utilisateur;
import com.pfe.dao.DaoFactory;
import com.pfe.dao.LitteraireDao;
import com.pfe.dao.UtilisateurDao;


@WebServlet("/CreativitesLitteraires")
public class CreativitesLitteraires extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	private LitteraireDao litteraireDao;
	
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
		this.litteraireDao = daoFactory.getLitteraireDao();
	}
       

    public CreativitesLitteraires() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
		utilisateurs = utilisateurDao.lister();
		request.setAttribute("utilisateurs", utilisateurs);
HttpSession sessio = request.getSession(true);
		
		Integer id_user = (Integer)sessio.getAttribute("login");
		if(id_user!=null) {
			 request.setAttribute("litteraires",litteraireDao.lister(id_user,"nonvalide"));
				request.setAttribute("litterairesvalide",litteraireDao.lister(id_user,"valide"));
				request.setAttribute("litterairesparticipant",litteraireDao.lister_participant(id_user,"nonvalide"));
				request.setAttribute("litterairesparticipantvalide",litteraireDao.lister_participant(id_user,"valide"));
			
		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/creativiteLitteraire.jsp").forward( request,response ) ;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String cache=request.getParameter("cacher");
          if(cache.equals("ajouter")) {
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
	        String datesaisie=request.getParameter("datelitteraire");
	        java.util.Date dateutil=null;
	        
				try {
					
					dateutil  =  sdf.parse(datesaisie);
				} catch (ParseException e) {
					
					e.printStackTrace();
				}
				HttpSession sessio = request.getSession(true);
				
				Integer id_user = (Integer)sessio.getAttribute("login");
				java.sql.Date datesql=new java.sql.Date(dateutil.getTime());
				Litteraire litteraire =new Litteraire();
				litteraire.setIntitule(request.getParameter("intitule"));
				litteraire.setDatelitteraire(datesql);
				litteraire.setActeurexterne(request.getParameter("auteur"));
				litteraire.setId_utilisateur(id_user);


				litteraireDao.ajouter(litteraire);
				String[] participant=request.getParameterValues("participant");
				if(participant!=null) {
					for(int i=0;i<participant.length;i++) {
						
						int id=Integer.parseInt(participant[i]);
						
						litteraireDao.declarer_participant(litteraireDao.dernierLitteraire(),id);
					}
				}
				
				
				
				boolean reussit = true;
				request.setAttribute("reussit",reussit);
				
			
		}else if(cache.equals("supprimer")) 
		{
			   String[] litterairesSupprime=request.getParameterValues("litterairesSupprime");
			      if(litterairesSupprime!=null) 
			      {
			    	  for(int i=0;i<litterairesSupprime.length;i++) 
			    	  {
							int id=Integer.parseInt(litterairesSupprime[i]);
							litteraireDao.supprimerP(id);
							litteraireDao.supprimer(id);
						
				      }
				
			     }
			     else 
			     {
				     System.out.println("");
			       
			     }
			
		   }
		else if(cache.equals("modifier")) {
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
	        String datesaisie=request.getParameter("datelitteraire");
	        java.util.Date dateutil=null;
	        
				try {
					
					dateutil  =  sdf.parse(datesaisie);
				} catch (ParseException e) {
					
					e.printStackTrace();
				}
				HttpSession sessio = request.getSession(true);
				int idlit=Integer.parseInt(request.getParameter("idlitteraire"));
				Integer id_user = (Integer)sessio.getAttribute("login");
				java.sql.Date datesql=new java.sql.Date(dateutil.getTime());
				Litteraire litteraire =new Litteraire();
				litteraire.setIntitule(request.getParameter("intitule"));
				litteraire.setDatelitteraire(datesql);
				litteraire.setActeurexterne(request.getParameter("auteur"));
				litteraire.setId_utilisateur(id_user);
				litteraire.setId_litteraire(idlit);



				litteraireDao.modifier(litteraire);
				litteraireDao.supprimerP(idlit);
				String[] litterairesModifier=request.getParameterValues("participantsM");
			      if(litterairesModifier!=null) 
			      {
			    	  for(int i=0;i<litterairesModifier.length;i++) 
			    	  {
							int id=Integer.parseInt(litterairesModifier[i]);
							litteraireDao.declarer_participant(idlit,id);
							
				      }
				
			     }
			     else 
			     {
				     System.out.println("");
			       
			     }
			
				boolean reussit = true;
				request.setAttribute("reussit",reussit);
				
			
		}
		
		
		
		
		 doGet(request,response);
		 }

}
