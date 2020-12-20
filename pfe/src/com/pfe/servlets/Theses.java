

package com.pfe.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pfe.beans.These;
import com.pfe.dao.DaoFactory;
import com.pfe.dao.TheseDao;
import com.pfe.dao.UtilisateurDao;

@WebServlet("/Theses")
public class Theses extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	private TheseDao theseDao;
	
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
		this.theseDao = daoFactory.getTheseDao();

	}   
    public Theses() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Integer id_user = (Integer)session.getAttribute("login");
		if(id_user!=null) {
			request.setAttribute("thesesoutenu",theseDao.lister(id_user, "soutenu"));
			request.setAttribute("theseencours",theseDao.lister(id_user, "encours"));
			request.setAttribute("doctorants",utilisateurDao.doctorants(id_user));
		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/these.jsp").forward( request,response ) ;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cache=request.getParameter("cacher");
		HttpSession session = request.getSession(true);
        Integer id_user = (Integer)session.getAttribute("login");
        
		if(cache.equals("supprimer")) 
		{
			   String[]thesesSupprime=request.getParameterValues("thesesSupprime");
			      if(thesesSupprime!=null) 
			      {
			    	  for(int i=0;i<thesesSupprime.length;i++) 
			    	  {
							int id=Integer.parseInt(thesesSupprime[i]);
							theseDao.supprimer(id);
						
				      }
				
			     }
			     else 
			     {
				     System.out.println("");
			       
			     }
			
		}
		else if(cache.equals("ajouter")) {
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
	        String datesaisiesoutenance=request.getParameter("dateSoutenance");
	        java.util.Date dateutilsoutenance=null;
	       
				try {
					
					dateutilsoutenance  =  sdf.parse(datesaisiesoutenance);
				} catch (ParseException e) {
					
					e.printStackTrace();
				}java.sql.Date datesqlsoutenance=new java.sql.Date(dateutilsoutenance.getTime());
				 String datesaisieinscription=request.getParameter("dateInscription");
			        java.util.Date dateutilinscription=null;
			        
						try {
							
							dateutilinscription  =  sdf.parse(datesaisieinscription);
						} catch (ParseException e) {
							
							e.printStackTrace();
						}java.sql.Date datesqlinscription=new java.sql.Date(dateutilinscription.getTime());
				
						These these =new These();
						these.setSujet(request.getParameter("sujetThese"));
						int id_doctorant=Integer.parseInt(request.getParameter("doctorant"));
						these.setId_doctorant(id_doctorant);
						these.setId_directeurThese(id_user);
						these.setDateSoutenance(datesqlsoutenance);
						these.setDatePremierInscription(datesqlinscription);
						these.setEtablissement(request.getParameter("etablissementCotutelle"));
						these.setTheseCotutelle(request.getParameter("theseCotutelle"));
						theseDao.ajouter(these);
		
		}
		else if(cache.equals("ajouterencours")) {
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				 String datesaisieinscription=request.getParameter("dateInscription");
			        java.util.Date dateutilinscription=null;
			        
						try {
							
							dateutilinscription  =  sdf.parse(datesaisieinscription);
						} catch (ParseException e) {
							
							e.printStackTrace();
						}java.sql.Date datesqlinscription=new java.sql.Date(dateutilinscription.getTime());
				
						These these =new These();
						these.setSujet(request.getParameter("sujetThese"));
						int id_doctorant=Integer.parseInt(request.getParameter("doctorant"));
						these.setId_doctorant(id_doctorant);
						
						these.setId_directeurThese(id_user);
						these.setDatePremierInscription(datesqlinscription);
						these.setEtablissement(request.getParameter("etablissementCotutelle"));
						these.setTheseCotutelle(request.getParameter("theseCotutelle"));
						theseDao.ajouter(these);
		
		}
		else if(cache.equals("modifierSoutenu")) {
			
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
	        String datesaisiesoutenance=request.getParameter("dateSoutenance");
	        java.util.Date dateutilsoutenance=null;
	       
				try {
					
					dateutilsoutenance  =  sdf.parse(datesaisiesoutenance);
				} catch (ParseException e) {
					
					e.printStackTrace();
				}java.sql.Date datesqlsoutenance=new java.sql.Date(dateutilsoutenance.getTime());
				 String datesaisieinscription=request.getParameter("dateInscription");
			        java.util.Date dateutilinscription=null;
			        
						try {
							
							dateutilinscription  =  sdf.parse(datesaisieinscription);
						} catch (ParseException e) {
							
							e.printStackTrace();
						}java.sql.Date datesqlinscription=new java.sql.Date(dateutilinscription.getTime());
				
						These these =new These();
						int id=Integer.parseInt(request.getParameter("idthese"));
						these.setId_these(id);
						these.setSujet(request.getParameter("sujetThese"));
						int id_doctorant=Integer.parseInt(request.getParameter("doctorant"));
						these.setId_doctorant(id_doctorant);
						these.setId_directeurThese(id_user);
						these.setDateSoutenance(datesqlsoutenance);
						these.setDatePremierInscription(datesqlinscription);
						these.setEtablissement(request.getParameter("etablissementCotutelle"));
						these.setTheseCotutelle(request.getParameter("theseCotutelle"));
						theseDao.modifier(these);
						boolean reussitmodication = true;
						request.setAttribute("reussitmodification",reussitmodication);
							
		}
		
		else if(cache.equals("modifierencours")) {
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
							 String datesaisieinscription=request.getParameter("dateInscription");
						        java.util.Date dateutilinscription=null;
						        
									try {
										
										dateutilinscription  =  sdf.parse(datesaisieinscription);
									} catch (ParseException e) {
										
										e.printStackTrace();
									}java.sql.Date datesqlinscription=new java.sql.Date(dateutilinscription.getTime());
							
									These these =new These();
									int id=Integer.parseInt(request.getParameter("idthese"));
									these.setId_these(id);
									these.setSujet(request.getParameter("sujetThese"));
									int id_doctorant=Integer.parseInt(request.getParameter("doctorant"));
									these.setId_doctorant(id_doctorant);
									these.setId_directeurThese(id_user);
									these.setDatePremierInscription(datesqlinscription);
									these.setEtablissement(request.getParameter("etablissementCotutelle"));
									these.setTheseCotutelle(request.getParameter("theseCotutelle"));
									theseDao.modifier(these);
									boolean reussitmodication = true;
									request.setAttribute("reussitmodification",reussitmodication);
										
					}
		
		doGet(request,response);
	}

}
