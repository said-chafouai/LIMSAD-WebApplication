package com.pfe.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pfe.beans.Budget;
import com.pfe.dao.BudgetDao;
import com.pfe.dao.DaoFactory;


@WebServlet("/Bilans")
public class Bilans extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BudgetDao budgetDao;
	
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.budgetDao = daoFactory.getBudgetDao();
	}

    public Bilans() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/bilan.jsp").forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Budget budget = new Budget();
		
		
		int somme = Integer.parseInt((String)request.getParameter("budget"));
		String dateSaisie = request.getParameter("dateBudget");
		
		//### traitement de la date ####
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date dateJava = null;
			try {
				dateJava = sdf.parse(dateSaisie);
			}catch(ParseException e) {
			}
			
			java.sql.Date dateBudget = new java.sql.Date(dateJava.getTime());
		//### END : traitement de date ####
		
		budget.setDateBudget(dateBudget);
		budget.setSomme(somme);
		
		budgetDao.ajouter(budget);
		this.getServletContext().getRequestDispatcher("/WEB-INF/bilan.jsp").forward(request, response);
	}

}
