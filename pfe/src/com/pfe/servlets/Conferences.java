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

import com.pfe.beans.Conference;
import com.pfe.beans.Journal;
import com.pfe.beans.Utilisateur;
import com.pfe.dao.ConferenceDao;
import com.pfe.dao.DaoFactory;
import com.pfe.dao.UtilisateurDao;

@WebServlet("/Conference")
public class Conferences extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	private ConferenceDao conferenceDao;
	
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
		this.conferenceDao = daoFactory.getConferenceDao();
	}
       
 
    public Conferences() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
		utilisateurs = utilisateurDao.lister();
		request.setAttribute("utilisateurs", utilisateurs);
HttpSession sessio = request.getSession(true);
		
		Integer id_user = (Integer)sessio.getAttribute("login");
		if(id_user!=null) {
		    request.setAttribute("conferences",conferenceDao.lister(id_user,"nonvalide","natio"));
			request.setAttribute("conferencesvalide",conferenceDao.lister(id_user,"valide","natio"));
			request.setAttribute("conferencesparticipant",conferenceDao.lister_participant(id_user,"nonvalide","nati"));
			request.setAttribute("conferencesvalideparticipant",conferenceDao.lister_participant(id_user,"valide","natio"));
			
			request.setAttribute("conferencesn",conferenceDao.lister(id_user,"nonvalide","inter"));
			request.setAttribute("conferencesvaliden",conferenceDao.lister(id_user,"valide","inter"));
			request.setAttribute("conferancesparticipantn",conferenceDao.lister_participant(id_user,"nonvalide","inter"));
			request.setAttribute("conferencesvalideparticipantn",conferenceDao.lister_participant(id_user,"valide","inter"));
			
		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/conference.jsp").forward( request,response ) ;

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cache=request.getParameter("cacher");
		if(cache.equals("ajouter")) {
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
	        String datesaisie=request.getParameter("dateConference");
	        java.util.Date dateutil=null;
	        
				try {
					
					dateutil  =  sdf.parse(datesaisie);
				} catch (ParseException e) {
					
					e.printStackTrace();
				}
				HttpSession sessio = request.getSession(true);
				
				Integer id_user = (Integer)sessio.getAttribute("login");
				java.sql.Date datesql=new java.sql.Date(dateutil.getTime());
				Conference conference  =new Conference();
				conference.setIntitule(request.getParameter("intitule"));
				conference.setDateConference(datesql);
				conference.setId_utilisateur(id_user);
				conference.setManifestation(request.getParameter("manifestation"));
				conference.setVille(request.getParameter("ville"));
				conference.setPays(request.getParameter("pays"));
				
				conferenceDao.ajouter(conference);
				String[] participant=request.getParameterValues("participant");
				if(participant!=null) {
					for(int i=0;i<participant.length;i++) {
						
						int id=Integer.parseInt(participant[i]);
						
						conferenceDao.declarer_participant(conferenceDao.dernierConference(),id);
					}
					}
				
				}
		else if(cache.equals("supprimer")) 
		{
			   String[] conferencesSupprime=request.getParameterValues("conferencesSupprime");
			      if(conferencesSupprime!=null) 
			      {
			    	  for(int i=0;i<conferencesSupprime.length;i++) 
			    	  {
							int id=Integer.parseInt(conferencesSupprime[i]);
							conferenceDao.supprimerP(id);
							conferenceDao.supprimer(id);
						
				      }
				
			     }
			     else 
			     {
				     System.out.println("");
			       
			     }
			
		   }else if(cache.equals("modifier")) {
				
			   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			   	
				
		        String datesaisie=request.getParameter("dateConference");
		        java.util.Date dateutil=null;
		        
					try {
						
						dateutil  =  sdf.parse(datesaisie);
					} catch (ParseException e) {
						
						e.printStackTrace();
					}
					HttpSession sessio = request.getSession(true);
					int idlit=Integer.parseInt(request.getParameter("idconference"));
					
					Integer id_user = (Integer)sessio.getAttribute("login");
					java.sql.Date datesql=new java.sql.Date(dateutil.getTime());
					Conference conference  =new Conference();
					conference.setId_conference(idlit);
					conference.setIntitule(request.getParameter("intitule"));
					conference.setDateConference(datesql);
					conference.setId_utilisateur(id_user);
					conference.setManifestation(request.getParameter("manifestation"));
					conference.setVille(request.getParameter("ville"));
					conference.setPays(request.getParameter("pays"));
			   				conferenceDao.modifier(conference);
			   				conferenceDao.supprimerP(idlit);
			   				String[] conferencesModifier=request.getParameterValues("participantsM");
			   			      if(conferencesModifier!=null) 
			   			      {
			   			    	  for(int i=0;i<conferencesModifier.length;i++) 
			   			    	  {
			   							int id=Integer.parseInt(conferencesModifier[i]);
			   							conferenceDao.declarer_participant(idlit,id);
			   							
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
