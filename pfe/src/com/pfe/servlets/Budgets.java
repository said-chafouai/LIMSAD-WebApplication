package com.pfe.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pfe.beans.Budget;
import com.pfe.dao.BudgetDao;
import com.pfe.dao.DaoFactory;

@WebServlet("/Budgets")
public class Budgets extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BudgetDao budgetDao;
	
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.budgetDao = daoFactory.getBudgetDao();
	}

    public Budgets() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Budget> budgets = new ArrayList<Budget>();
    	PrintWriter out=response.getWriter();
		Gson gson=new Gson();
		
		budgets =  budgetDao.lister();
		
			out.print(gson.toJson(budgets));
			out.flush();
			out.close();
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	this.getServletContext().getRequestDispatcher("/WEB-INF/bilan.jsp").forward(request, response);	
	}

}
