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

import com.pfe.beans.DistinctionPrix;
import com.pfe.beans.Journal;
import com.pfe.beans.Utilisateur;
import com.pfe.dao.DaoFactory;
import com.pfe.dao.JournalDao;
import com.pfe.dao.UtilisateurDao;


@WebServlet("/Journals")
public class Journals extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	private JournalDao journalDao;
	
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
		this.journalDao = daoFactory.getJournalDao();
		
	}
       

    public Journals() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
		utilisateurs = utilisateurDao.lister();
		request.setAttribute("utilisateurs", utilisateurs);
       HttpSession sessio = request.getSession(true);
		
		Integer id_user = (Integer)sessio.getAttribute("login");
		if(id_user!=null) {
		    request.setAttribute("journals",journalDao.lister(id_user,"nonvalide","index"));
			request.setAttribute("journalsvalide",journalDao.lister(id_user,"valide","index"));
			request.setAttribute("journalsparticipant",journalDao.lister_participant(id_user,"nonvalide","index"));
			request.setAttribute("journalsvalideparticipant",journalDao.lister_participant(id_user,"valide","index"));
			
			request.setAttribute("journalsn",journalDao.lister(id_user,"nonvalide","nonindex"));
			request.setAttribute("journalsvaliden",journalDao.lister(id_user,"valide","nonindex"));
			request.setAttribute("journalsparticipantn",journalDao.lister_participant(id_user,"nonvalide","nonindex"));
			request.setAttribute("journalsvalideparticipantn",journalDao.lister_participant(id_user,"valide","nonindex"));
			
		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/journal.jsp").forward( request,response ) ;

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cache=request.getParameter("cacher");
		if(cache.equals("ajouter")) {
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
	        String datesaisie=request.getParameter("datePublication");
	        java.util.Date dateutil=null;
	        
				try {
					
					dateutil  =  sdf.parse(datesaisie);
				} catch (ParseException e) {
					
					e.printStackTrace();
				}
				HttpSession sessio = request.getSession(true);
				
				Integer id_user = (Integer)sessio.getAttribute("login");
				java.sql.Date datesql=new java.sql.Date(dateutil.getTime());
				Journal journal =new Journal();
				journal.setIntitule(request.getParameter("intitule"));
				journal.setDatePublication(datesql);
				journal.setId_utilisateur(id_user);
				journal.setJournal(request.getParameter("journal"));
				String base=request.getParameter("baseIndexation");
				if(base.equals("autre")) {
					journal.setBaseIndexation(request.getParameter("autre"));
					
				}
				else {
					journal.setBaseIndexation(base);
					
				}
				
				
				
				
				journalDao.ajouter(journal,"index");
				String[] participant=request.getParameterValues("participant");
				if(participant!=null) {
					for(int i=0;i<participant.length;i++) {
						
						int id=Integer.parseInt(participant[i]);
						
						journalDao.declarer_participant(journalDao.dernierJournal(),id);
					}
					}
				
				}
if(cache.equals("ajoutern")) {
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
	        String datesaisie=request.getParameter("datePublication");
	        java.util.Date dateutil=null;
	        
				try {
					
					dateutil  =  sdf.parse(datesaisie);
				} catch (ParseException e) {
					
					e.printStackTrace();
				}
				HttpSession sessio = request.getSession(true);
				
				Integer id_user = (Integer)sessio.getAttribute("login");
				java.sql.Date datesql=new java.sql.Date(dateutil.getTime());
				Journal journal =new Journal();
				journal.setIntitule(request.getParameter("intitule"));
				journal.setDatePublication(datesql);
				journal.setId_utilisateur(id_user);
				journal.setJournal(request.getParameter("journal"));
				String base=request.getParameter("baseIndexation");
				if(base.equals("autre")) {
					journal.setBaseIndexation(request.getParameter("autre"));
					
				}
				else {
					journal.setBaseIndexation(base);
					
				}
				
				
				
				
				journalDao.ajouter(journal,"nonindex");
				String[] participant=request.getParameterValues("participant");
				if(participant!=null) {
					for(int i=0;i<participant.length;i++) {
						
						int id=Integer.parseInt(participant[i]);
						
						journalDao.declarer_participant(journalDao.dernierJournal(),id);
					}
					}
				
				}
		else if(cache.equals("supprimer")) 
		{
			   String[] journalsSupprime=request.getParameterValues("journalsSupprime");
			      if(journalsSupprime!=null) 
			      {
			    	  for(int i=0;i<journalsSupprime.length;i++) 
			    	  {
							int id=Integer.parseInt(journalsSupprime[i]);
							journalDao.supprimerP(id);
							journalDao.supprimer(id);
						
				      }
				
			     }
			     else 
			     {
				     System.out.println("");
			       
			     }
			
		   }
		else if(cache.equals("modifier")) {
			
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
	        String datesaisie=request.getParameter("datePublication");
	        java.util.Date dateutil=null;
	        
				try {
					
					dateutil  =  sdf.parse(datesaisie);
				} catch (ParseException e) {
					
					e.printStackTrace();
				}
				HttpSession sessio = request.getSession(true);
				
				Integer id_user = (Integer)sessio.getAttribute("login");
				java.sql.Date datesql=new java.sql.Date(dateutil.getTime());
				Journal journal =new Journal();
				journal.setIntitule(request.getParameter("intitule"));
				journal.setDatePublication(datesql);
				journal.setId_utilisateur(id_user);
				
				int idlit=Integer.parseInt(request.getParameter("idjournal"));
				journal.setId_journal(idlit);
				journal.setJournal(request.getParameter("journal"));
				String base=request.getParameter("baseIndexation");
				if(base.equals("autre")) {
					journal.setBaseIndexation(request.getParameter("autre"));
					
				}
				else {
					journal.setBaseIndexation(base);
					
				}
				
				
				

				journalDao.modifier(journal);
				journalDao.supprimerP(idlit);
				String[] distinctionsModifier=request.getParameterValues("participantsM");
			      if(distinctionsModifier!=null) 
			      {
			    	  for(int i=0;i<distinctionsModifier.length;i++) 
			    	  {
							int id=Integer.parseInt(distinctionsModifier[i]);
							journalDao.declarer_participant(idlit,id);
							
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
