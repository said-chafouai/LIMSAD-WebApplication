package com.pfe.dao;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pfe.beans.Budget;

public class BudgetDaoImpl implements BudgetDao{
	private DaoFactory daoFactory;
	
	BudgetDaoImpl(DaoFactory daoFactory){
		this.daoFactory = daoFactory;
	}
	
	public void ajouter(Budget budget) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		 
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("INSERT budgets(datebudget,somme,id_directeur) VALUES(?,?,?);"); 
			preparedStatement.setDate(1, budget.getDateBudget());
			preparedStatement.setInt(2, budget.getSomme());
			preparedStatement.setString(3, "directeur");
			
			preparedStatement.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}		
	}
	
	public List<Budget> lister(){
		List<Budget> budgets = new ArrayList<Budget>();
		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;

			try {
			connexion = daoFactory.getConnection();
			statement = connexion.createStatement();
			resultat = statement.executeQuery("SELECT * from Budgets order by datebudget;");
			
			while(resultat.next()) {
				Budget budget = new Budget();
				
				budget.setSomme(resultat.getInt("somme"));
				budget.setDateBudget(resultat.getDate("datebudget"));
				
				budgets.add(budget);
				
			}

			}catch(SQLException e) {
			
			}finally {
				try {
					if(resultat != null)
						resultat.close();
					if(statement != null)
						statement.close();
					if(connexion != null)
						connexion.close();
				}catch(SQLException ignore) {
				
			}
		}

		
		return budgets;
		
	}
	
	

}
