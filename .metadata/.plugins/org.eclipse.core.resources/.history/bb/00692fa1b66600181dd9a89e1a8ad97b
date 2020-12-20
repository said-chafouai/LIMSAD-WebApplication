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

import com.pfe.beans.BrevetDroit;
import com.pfe.beans.Utilisateur;
import com.pfe.dao.BrevetDroitDao;
import com.pfe.dao.DaoFactory;
import com.pfe.dao.UtilisateurDao;
import com.pfe.form.Fichier;
import com.pfe.form.UploadForm;


@WebServlet("/BrevetsDroits")
public class BrevetsDroits extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String CHEMIN = "chemin";
	public static final String ATT_FICHIER = "fichier";
	public static final String ATT_FORM = "form";
	public static final String VUE = "/WEB-INF/brevetDroit.jsp";
	
	private UtilisateurDao utilisateurDao;
	private BrevetDroitDao brevetdroitDao;
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.utilisateurDao = daoFactory.getUtilisateurDao();
	
		this.brevetdroitDao = daoFactory.getBrevetDroitDao();

       
	}
    public BrevetsDroits() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
		utilisateurs = utilisateurDao.lister();
		request.setAttribute("utilisateurs", utilisateurs);
		HttpSession sessio = request.getSession(true);
		
		Integer id_user = (Integer)sessio.getAttribute("login");
		if(id_user!=null) {
		    request.setAttribute("brevets",brevetdroitDao.lister(id_user,"nonvalide"));
			request.setAttribute("brevetsvalide",brevetdroitDao.lister(id_user,"valide"));
			request.setAttribute("brevetsparticipant",brevetdroitDao.lister_participant(id_user,"nonvalide"));
			request.setAttribute("brevetsparticipantvalide",brevetdroitDao.lister_participant(id_user,"valide"));
		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/brevetDroit.jsp").forward( request,response ) ;

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cache = request.getParameter("cacher");
		if (cache.equals("ajouter")) {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			String datesaisie = request.getParameter("dateDepot");
			java.util.Date dateutil = null;

			try {

				dateutil = sdf.parse(datesaisie);
			} catch (ParseException e) {

				e.printStackTrace();
			}
			HttpSession sessio = request.getSession(true);
			// Enregistrer le fichier
			String chemin = this.getServletConfig().getInitParameter(CHEMIN );
			UploadForm form = new UploadForm();
			Fichier fichier = form.enregistrerFichier(request, chemin);
			//#############################################################
			
			Integer id_user = (Integer) sessio.getAttribute("login");
			java.sql.Date datesql = new java.sql.Date(dateutil.getTime());
			BrevetDroit brevetDroit = new BrevetDroit();
			brevetDroit.setIntitule(request.getParameter("intitule"));
			brevetDroit.setType(request.getParameter("type"));
			brevetDroit.setNumeroDepot(Integer.parseInt(request.getParameter("numeroDepot")));
			brevetDroit.setNumeroEnregistrement(Integer.parseInt(request.getParameter("numeroEnregistrement")));
			brevetDroit.setDateDepot(datesql);
			brevetDroit.setChampApplication(request.getParameter("champApplication"));
			brevetDroit.setActeurexterne(request.getParameter("auteur"));
			brevetDroit.setId_utilisateur(id_user);
			brevetDroit.setPreuve(fichier.getNom());

			brevetdroitDao.ajouter(brevetDroit);
			String[] participant = request.getParameterValues("participant");
			if (participant != null) {
				for (int i = 0; i < participant.length; i++) {

					int id = Integer.parseInt(participant[i]);

					brevetdroitDao.declarer_participant(brevetdroitDao.dernierBrevet(), id);
				}
			}

			boolean reussit = true;
			request.setAttribute("reussit", reussit);

		} else if (cache.equals("supprimer")) {
			String[] brevetsSupprime = request.getParameterValues("brevetsSupprime");
			if (brevetsSupprime != null) {
				for (int i = 0; i < brevetsSupprime.length; i++) {
					int id = Integer.parseInt(brevetsSupprime[i]);
					brevetdroitDao.supprimer(id);
				}
			} else {
				System.out.println("");
			}

		} else if (cache.equals("modifier")) {

			String brevetModifier = request.getParameter("brevetModifier");
			if (brevetModifier != null) {
				int id = Integer.parseInt(brevetModifier);
				request.setAttribute("IDBREVET", id);
				request.setAttribute("brevetdroit", brevetdroitDao.listerbrevet(id));

			}

		} else if (cache.equals("enregistrermodification")) {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			String datesaisie = request.getParameter("dateDepot");
			java.util.Date dateutil = null;

			try {

				dateutil = sdf.parse(datesaisie);
			} catch (ParseException e) {

				e.printStackTrace();
			}
			HttpSession sessio = request.getSession(true);

			Integer id_user = (Integer) sessio.getAttribute("login");
			java.sql.Date datesql = new java.sql.Date(dateutil.getTime());
			BrevetDroit brevetDroit = new BrevetDroit();
			brevetDroit.setIntitule(request.getParameter("intitule"));
			brevetDroit.setType(request.getParameter("type"));
			brevetDroit.setNumeroDepot(Integer.parseInt(request.getParameter("numeroDepot")));
			brevetDroit.setNumeroEnregistrement(Integer.parseInt(request.getParameter("numeroEnregistrement")));
			brevetDroit.setDateDepot(datesql);
			brevetDroit.setChampApplication(request.getParameter("champApplication"));
			brevetDroit.setActeurexterne(request.getParameter("auteur"));

			brevetDroit.setId_utilisateur(id_user);
			String IDBREVET = request.getParameter("IDBREVET");
			int idbrevetacc = Integer.parseInt(IDBREVET);
			brevetDroit.setId_brevet(idbrevetacc);
			brevetdroitDao.supprimerparticipant(idbrevetacc);
			String[] participant = request.getParameterValues("participant");
			if (participant != null) {
				for (int i = 0; i < participant.length; i++) {

					int id = Integer.parseInt(participant[i]);

					brevetdroitDao.declarer_participant(idbrevetacc, id);
				}
			}
			brevetdroitDao.modifier(brevetDroit);
			boolean reussitmodication = true;
			request.setAttribute("reussitmodification", reussitmodication);

		}

		doGet(request, response);

	}

}
