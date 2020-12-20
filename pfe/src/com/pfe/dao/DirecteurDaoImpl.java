package com.pfe.dao;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import com.pfe.beans.Directeur;


public class DirecteurDaoImpl implements DirecteurDao {
	private DaoFactory daoFactory;
	
	DirecteurDaoImpl(DaoFactory daoFactory){
		this.daoFactory = daoFactory;
	}	
	public List<Directeur> lister(){
		List<Directeur> directeurs = new ArrayList<Directeur>();
		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;
		
		try {
			connexion = daoFactory.getConnection();
			statement = connexion.createStatement();
			resultat = statement.executeQuery("SELECT * from directeurs;");
			
			while(resultat.next()) {
				
				Directeur directeur = new Directeur();
				
				directeur.setNom(resultat.getString("nom"));
				directeur.setPrenom(resultat.getString("prenom"));
				directeur.setEmail(resultat.getString("email"));
				directeur.setMdp(resultat.getString("mdp"));
				
				directeurs.add(directeur);
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
		
		return directeurs;	
	}
	
	
	//############## Modifier ########################
			/*
			 * (non-Javadoc)
			 * @see com.pfe.dao.DirecteurDao#modifier(com.pfe.beans.Directeur)
			 * public void modifier(Directeur directeur)
			 * modifier le mode de passe d'un directeur
			 * 
			 */
			
			public void modifier(Directeur directeur) {
				Connection connexion = null;
				PreparedStatement preparedStatement = null;
				 
				try {
					connexion = daoFactory.getConnection();
					preparedStatement = connexion.prepareStatement("UPDATE directeurs SET mdp=? where id_directeur='directeur';"); 
					preparedStatement.setString(1, directeur.getMdp());
					
					preparedStatement.executeUpdate();
					
				}catch(SQLException e) {
					
				}		
			}
			
			//######## END : modifier ##################


}

