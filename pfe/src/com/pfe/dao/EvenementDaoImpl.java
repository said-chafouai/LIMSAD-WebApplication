package com.pfe.dao;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import com.pfe.beans.Evenement;


public class EvenementDaoImpl implements EvenementDao {
	private DaoFactory daoFactory;
	
	EvenementDaoImpl(DaoFactory daoFactory){
		this.daoFactory = daoFactory;
	}
		public void ajouter(Evenement evenement) {
			Connection connexion = null;
			PreparedStatement preparedStatement = null;
			
			try {
				connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement("INSERT  INTO evenements(titre,dateevenement,message,type) VALUES(?,?,?,?);"); 
				
				preparedStatement.setString(1, evenement.getTitre());
				preparedStatement.setDate(2, evenement.getDate());
				preparedStatement.setString(3, evenement.getMessage());
				preparedStatement.setString(4, evenement.getType());
				
				preparedStatement.executeUpdate();
				
			}catch(SQLException e) {
				
			}		
		}
		
		public List<Evenement> lister(){
			List<Evenement> evenements = new ArrayList<Evenement>();
			Connection connexion = null;
			Statement statement = null;
			ResultSet resultat = null;
			
			try {
				connexion = daoFactory.getConnection();
				statement = connexion.createStatement();
				resultat = statement.executeQuery("SELECT * from evenements order by dateevenement DESC;");
				
				while(resultat.next()) {
					int id_evenement=resultat.getInt(1);
					String titre = resultat.getString(2);
					String message = resultat.getString(3);
					Date date = resultat.getDate(4);
					String type = resultat.getString(6);
							
					
					Evenement evenement = new Evenement();
					evenement.setId_evenement(id_evenement);
					evenement.setTitre(titre);
					evenement.setMessage(message);
					evenement.setDate(date);
					evenement.setType(type);
					
					
					evenements.add(evenement);
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
			
			return evenements;
			
		}
		
		
		public void supprimer(int id) {
			Connection connexion = null;
			PreparedStatement preparedStatement = null;
			
			try {
				connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement("DELETE  FROM evenements  WHERE id_evenement=?"); 
				
				preparedStatement.setInt(1,id);
				
				
				preparedStatement.executeUpdate();
				
			}catch(SQLException e) {
				
			}		
			
			
			
		}
	
		public void modifier(Evenement evenement) {
			Connection connexion = null;
			PreparedStatement preparedStatement = null;
			
			try {
				connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement("update evenements SET titre=? , message=? , dateevenement=? , type=?  WHERE id_evenement=?"); 
				
				preparedStatement.setString(1,evenement.getTitre());
				preparedStatement.setString(2,evenement.getMessage());
				preparedStatement.setDate(3,evenement.getDate());
				preparedStatement.setString(4,evenement.getType());
			    preparedStatement.setInt(5,evenement.getId_evenement());
				
				
				preparedStatement.executeUpdate();
				
			}catch(SQLException e) {
				
			}		
			
			
			
		}
		public Evenement lister(int a){
			Evenement evenement=new Evenement();
			Connection connexion = null;
			Statement statement = null;
			ResultSet resultat = null;
			
			try {
				PreparedStatement preparedStatement = null;
				connexion = daoFactory.getConnection();
				statement = connexion.createStatement();
				preparedStatement=connexion.prepareStatement("SELECT * from evenements where id_evenement=?;");
                preparedStatement.setInt(1,a);
            	resultat =  preparedStatement.executeQuery();
				
				resultat.next();
					int id_evenement=resultat.getInt(1);
					String titre = resultat.getString(2);
					String message = resultat.getString(3);
					Date date = resultat.getDate(4);
					String type = resultat.getString(6);
							
					
					
					evenement.setId_evenement(id_evenement);
					evenement.setTitre(titre);
					evenement.setMessage(message);
					evenement.setDate(date);
					evenement.setType(type);
				
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
			
			return evenement;
			
		}

}
