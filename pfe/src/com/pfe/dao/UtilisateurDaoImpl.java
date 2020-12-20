package com.pfe.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.pfe.beans.Utilisateur;

public class UtilisateurDaoImpl implements UtilisateurDao{
	private DaoFactory daoFactory;
	
	UtilisateurDaoImpl(DaoFactory daoFactory){
		this.daoFactory = daoFactory;
	}
		
		public void ajouter(Utilisateur utilisateur) {
			Connection connexion = null;
			PreparedStatement preparedStatement = null;
			 
			try {
				connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement("INSERT into utilisateurs(etat,nom,prenom,email,mdp,grade,cne,gsm,adresse) VALUES(?,?,?,?,?,?,?,?,?);"); 
				preparedStatement.setBoolean(1, utilisateur.isEtat());
				preparedStatement.setString(2, utilisateur.getNom());
				preparedStatement.setString(3, utilisateur.getPrenom());
				preparedStatement.setString(4, utilisateur.getEmail());
				preparedStatement.setString(5,"");
				preparedStatement.setString(6, utilisateur.getGrade());
				preparedStatement.setString(7, utilisateur.getCne());
				preparedStatement.setString(8, utilisateur.getGsm());
				preparedStatement.setString(9, utilisateur.getAdresse());
				
				preparedStatement.executeUpdate();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}		
		}
		
		public List<Utilisateur> lister(){
			List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
			Connection connexion = null;
			Statement statement = null;
			ResultSet resultat = null;
			
			try {
				connexion = daoFactory.getConnection();
				statement = connexion.createStatement();
				resultat = statement.executeQuery("SELECT * from utilisateurs;");
				
				while(resultat.next()) {
					Utilisateur utilisateur = new Utilisateur();
					
					utilisateur.setEtat(resultat.getBoolean("etat"));
					utilisateur.setLogin(resultat.getInt("id_utilisateur"));
					utilisateur.setNom(resultat.getString("nom"));
					utilisateur.setPrenom(resultat.getString("prenom"));
					utilisateur.setEmail(resultat.getString("email"));
					utilisateur.setMdp(resultat.getString("mdp"));
					utilisateur.setGrade(resultat.getString("grade"));
					utilisateur.setCne(resultat.getString("cne"));
					utilisateur.setGsm(resultat.getString("gsm"));
					utilisateur.setAdresse(resultat.getString("adresse"));
					utilisateur.setThese(resultat.getString("these"));
					utilisateur.setEncadrant(resultat.getInt("id_encadrant"));
					utilisateur.setEquipe(resultat.getInt("id_equipe"));
					
					utilisateurs.add(utilisateur);
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
			
			return utilisateurs;
			
		}
		
		//############## Modifier ########################
		/*
		 * (non-Javadoc)
		 * @see com.pfe.dao.UtilisateurDao#modifier(com.pfe.beans.Utilisateur)
		 * public void modifier(Utilisateur utilisateur)
		 * modifier le mode de passe d'un user
		 * 
		 */
		
		public void modifier(Utilisateur utilisateur, String changement ) {
			Connection connexion = null;
			PreparedStatement preparedStatement = null;
			 
			try {
				connexion = daoFactory.getConnection();
				if(changement.equals("mdp")) {
					preparedStatement = connexion.prepareStatement("UPDATE utilisateurs SET mdp=? where id_utilisateur=?;"); 
					preparedStatement.setString(1, utilisateur.getMdp());
					preparedStatement.setInt(2, utilisateur.getLogin());
				}else if(changement.equals("doctorant")) {
					preparedStatement = connexion.prepareStatement("UPDATE utilisateurs SET etat=true,id_encadrant=?,these=?,id_equipe=?, mdp=? where id_utilisateur=?;"); 
					preparedStatement.setInt(1, utilisateur.getEncadrant());
					preparedStatement.setString(2, utilisateur.getThese());
					preparedStatement.setInt(3, utilisateur.getEquipe());
					preparedStatement.setString(4, utilisateur.getMdp());
					preparedStatement.setInt(5, utilisateur.getLogin());
				}else if(changement.equals("ensiegnant")) {
					preparedStatement = connexion.prepareStatement("UPDATE utilisateurs SET etat=true,id_equipe=?,mdp=? where id_utilisateur=?;"); 
					preparedStatement.setInt(1, utilisateur.getEquipe());
					preparedStatement.setString(2, utilisateur.getMdp());
					preparedStatement.setInt(3, utilisateur.getLogin());
				}else if(changement.equals("equipe")) {
					preparedStatement = connexion.prepareStatement("UPDATE utilisateurs SET id_equipe=? where id_utilisateur=?;"); 
					preparedStatement.setInt(1, utilisateur.getEquipe());
					preparedStatement.setInt(2, utilisateur.getLogin());
				}
				preparedStatement.executeUpdate();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}		
		}
		
		//######## END : modifier ##################
		
		// ############## session : etat(activer,desactiver) ########################
		/*
		 * (non-Javadoc)
		 * 
		 * @see com.pfe.dao.UtilisateurDao#session(com.pfe.beans.Utilisateur) public
		 * void session(int id_user,String etat) activer ou desactiver une session
		 * 
		 */
	
		public void session(int id_user, String etat) {
			Connection connexion = null;
			PreparedStatement preparedStatement = null;
	
			try {
				connexion = daoFactory.getConnection();
				if (etat.equals("activer")) {
					preparedStatement = connexion.prepareStatement("UPDATE utilisateurs SET etat=true where id_utilisateur=?;");
				} else if (etat.equals("desactiver")) {
					preparedStatement = connexion.prepareStatement("UPDATE utilisateurs SET etat=false where id_utilisateur=?;");
				}
				preparedStatement.setInt(1, id_user);
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
	
			}
		}
	
		// ######## END : session ##################
		
		// ############## supprimer : login ########################
		
		public void supprimer(int login) {
			Connection connexion = null;
			PreparedStatement preparedStatement = null;

			try {
				connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement("DELETE FROM utilisateurs where id_utilisateur=?;");
				preparedStatement.setInt(1, login);

				preparedStatement.executeUpdate();

			} catch (SQLException e) {

			}
		}
		
		//######## END : supprimer ##################
		
		
		public List<Utilisateur> doctorants(int id){
			List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
			Connection connexion = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultat = null;

			try {
				connexion = daoFactory.getConnection();
				
				preparedStatement = connexion.prepareStatement("select id_utilisateur,email,nom,prenom from utilisateurs where id_encadrant=?;");
				
				preparedStatement.setInt(1, id);

				resultat = preparedStatement.executeQuery();
				while(resultat.next()) {
					int login = resultat.getInt("id_utilisateur");
					String email = resultat.getString("email");
					String nom = resultat.getString("nom");
					String prenom = resultat.getString("prenom");
					
					Utilisateur utilisateur = new Utilisateur();
					
					utilisateur.setLogin(login);
					utilisateur.setNom(nom);
					utilisateur.setPrenom(prenom);
					utilisateur.setEmail(email);
					
					
					utilisateurs.add(utilisateur);
				}
			}catch(SQLException e) {
				
			}finally {
				try {
					if(resultat != null)
						resultat.close();
					if (preparedStatement != null)
						preparedStatement.close();
					if(connexion != null)
						connexion.close();
				}catch(SQLException ignore) {
					
				}
			}
			
			return utilisateurs;
			
		}



}
