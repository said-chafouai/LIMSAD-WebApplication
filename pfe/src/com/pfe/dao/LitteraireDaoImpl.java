package com.pfe.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.pfe.beans.Litteraire;

public class LitteraireDaoImpl implements LitteraireDao {
	private DaoFactory daoFactory;

	LitteraireDaoImpl(DaoFactory daoFactory) {
		this.daoFactory = daoFactory;
	}
	public void ajouter(Litteraire litteraire) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement(
					"INSERT  INTO litteraires(intitule,acteurexterne,id_Utilisateur,datelitteraire) VALUES(?,?,?,?);");

			preparedStatement.setString(1,litteraire.getIntitule());
			preparedStatement.setString(2, litteraire.getActeurexterne());
			preparedStatement.setInt(3, litteraire.getId_utilisateur());
			preparedStatement.setDate(4, litteraire.getDatelitteraire());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}
	}
	public void declarer_participant(int id_litteraire, int id_participant) {

		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement(
					"INSERT  INTO participationlitteraire(id_litteraire,id_utilisateur) value(?,?)");

			preparedStatement.setInt(1, id_litteraire);
			preparedStatement.setInt(2, id_participant);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}
	}
	public int dernierLitteraire() {

		Connection connexion = null;

		ResultSet resultat = null;
		PreparedStatement preparedStatement = null;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("select max(id_litteraire) from litteraires  ;");
			resultat = preparedStatement.executeQuery();
			resultat.next();
			int max_litteraire = resultat.getInt(1);

			return max_litteraire;
		} catch (SQLException e) {

		}
		return 0;

	}
	public List<Litteraire> lister(int id_user, String etat) {
		List<Litteraire> litteraires = new ArrayList<Litteraire>();
		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;
		PreparedStatement preparedStatement = null;

		if (etat.equals("valide")) {
			try {
				connexion = daoFactory.getConnection();
				preparedStatement = connexion
						.prepareStatement("select * from litteraires where id_utilisateur=? and  validation=true ;");
				preparedStatement.setInt(1, id_user);

				resultat = preparedStatement.executeQuery();
				while (resultat.next()) {
					int id_litteraire = resultat.getInt(1);
					String intitule = resultat.getString(2);
					String acteurExterne = resultat.getString(5);
					int id_utilisateur = resultat.getInt(4);

					Date datelitteraire = resultat.getDate(3);

					Litteraire litteraire = new Litteraire();
					litteraire.setId_litteraire(id_litteraire);
					litteraire.setIntitule(intitule);
					litteraire.setActeurexterne(acteurExterne);
					litteraire.setId_utilisateur(id_utilisateur);
					litteraire.setDatelitteraire(datelitteraire);

					litteraires.add(litteraire);
				}
			} catch (SQLException e) {

			} finally {
				try {
					if (resultat != null)
						resultat.close();
					if (statement != null)
						statement.close();
					if (connexion != null)
						connexion.close();
				} catch (SQLException ignore) {

				}
			}

		} else if (etat.equals("nonvalide")) {
			try {
				connexion = daoFactory.getConnection();
				preparedStatement = connexion
						.prepareStatement("select * from litteraires where id_utilisateur=? and validation=false ;");
				preparedStatement.setInt(1, id_user);

				resultat = preparedStatement.executeQuery();
				while (resultat.next()) {
					
						int id_litteraire = resultat.getInt(1);
						String intitule = resultat.getString(2);
						String acteurExterne = resultat.getString(5);
						int id_utilisateur = resultat.getInt(4);

						Date datelitteraire = resultat.getDate(3);

						Litteraire litteraire = new Litteraire();
						litteraire.setId_litteraire(id_litteraire);
						litteraire.setIntitule(intitule);
						litteraire.setActeurexterne(acteurExterne);
						litteraire.setId_utilisateur(id_utilisateur);
						litteraire.setDatelitteraire(datelitteraire);

						litteraires.add(litteraire);
					}
			}catch (SQLException e) {

			} finally {
				try {
					if (resultat != null)
						resultat.close();
					if (statement != null)
						statement.close();
					if (connexion != null)
						connexion.close();
				} catch (SQLException ignore) {

				}
			}

		}
		return litteraires;
	}
	public List<Litteraire> lister_participant(int id_user, String etat) {
		List<Litteraire> litteraires = new ArrayList<Litteraire>();
		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;
		PreparedStatement preparedStatement = null;

		if (etat.equals("valide")) {
			try {
				connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement(
						"select b.* from litteraires b join participationlitteraire p where p.id_litteraire=b.id_litteraire and p.id_utilisateur=? and b.validation=true;");
				preparedStatement.setInt(1, id_user);

				resultat = preparedStatement.executeQuery();
				while (resultat.next()) {
					int id_litteraire = resultat.getInt(1);
					String intitule = resultat.getString(2);
					String acteurExterne = resultat.getString(5);
					int id_utilisateur = resultat.getInt(4);

					Date datelitteraire = resultat.getDate(3);

					Litteraire litteraire = new Litteraire();
					litteraire.setId_litteraire(id_litteraire);
					litteraire.setIntitule(intitule);
					litteraire.setActeurexterne(acteurExterne);
					litteraire.setId_utilisateur(id_utilisateur);
					litteraire.setDatelitteraire(datelitteraire);

					litteraires.add(litteraire);
				}
			} catch (SQLException e) {

			} finally {
				try {
					if (resultat != null)
						resultat.close();
					if (statement != null)
						statement.close();
					if (connexion != null)
						connexion.close();
				} catch (SQLException ignore) {

				}
			}

		} else if (etat.equals("nonvalide")) {
			try {
				connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement(
						"select b.* from litteraires b join participationlitteraire p where p.id_litteraire=b.id_litteraire and p.id_utilisateur=? and b.validation=false;");
				preparedStatement.setInt(1, id_user);

				resultat = preparedStatement.executeQuery();
				while (resultat.next()) {
					int id_litteraire = resultat.getInt(1);
					String intitule = resultat.getString(2);
					String acteurExterne = resultat.getString(5);
					int id_utilisateur = resultat.getInt(4);

					Date datelitteraire = resultat.getDate(3);

					Litteraire litteraire = new Litteraire();
					litteraire.setId_litteraire(id_litteraire);
					litteraire.setIntitule(intitule);
					litteraire.setActeurexterne(acteurExterne);
					litteraire.setId_utilisateur(id_utilisateur);
					litteraire.setDatelitteraire(datelitteraire);

					litteraires.add(litteraire);
				}
			} catch (SQLException e) {

			} finally {
				try {
					if (resultat != null)
						resultat.close();
					if (statement != null)
						statement.close();
					if (connexion != null)
						connexion.close();
				} catch (SQLException ignore) {

				}
			}

		}
		return litteraires;
	}
	public void supprimer(int id) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("DELETE  FROM litteraires  WHERE id_litteraire=?");

			preparedStatement.setInt(1, id);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}

	}
	public void supprimerP(int id) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("DELETE  FROM participationlitteraire  WHERE id_litteraire=?");

			preparedStatement.setInt(1, id);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}

	}
	public void modifier(Litteraire litteraire) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("update litteraires SET datelitteraire=?,intitule=?,acteurexterne=? WHERE id_litteraire=?");

			preparedStatement.setDate(1, litteraire.getDatelitteraire());
			preparedStatement.setString(2, litteraire.getIntitule());
			preparedStatement.setString(3,litteraire.getActeurexterne());
			preparedStatement.setInt(4,litteraire.getId_litteraire());
			
			
			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}


	
	
}
	public List<Litteraire> lister(int id_user) {
		List<Litteraire> litteraires = new ArrayList<Litteraire>();
		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;
		PreparedStatement preparedStatement = null;

		
			try {
				connexion = daoFactory.getConnection();
				preparedStatement = connexion
						.prepareStatement("select u.nom,u.prenom,f.id_litteraire,f.intitule,f.datelitteraire from litteraires f,utilisateurs u where u.id_encadrant=? and u.id_utilisateur=f.id_utilisateur and f.validation=false ;");
				preparedStatement.setInt(1, id_user);

				resultat = preparedStatement.executeQuery();
				while (resultat.next()) {
					String nom=resultat.getString(1)+" "+ resultat.getString(2);
					int id_litteraire= resultat.getInt(3);
					String intitule = resultat.getString(4);
					Date datelitteraire = resultat.getDate(5);
		

		

					Litteraire litteraire= new Litteraire();
					litteraire.setId_litteraire(id_litteraire);
					litteraire.setIntitule(intitule);
					litteraire.setDatelitteraire(datelitteraire);
					
					litteraire.setNom(nom);
					litteraires.add(litteraire);
				}
			} catch (SQLException e) {

			} finally {
				try {
					if (resultat != null)
						resultat.close();
					if (statement != null)
						statement.close();
					if (connexion != null)
						connexion.close();
				} catch (SQLException ignore) {

				}
			}

		
		return litteraires;
	}
	public void valide(int id) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("update litteraires SET validation=true WHERE id_litteraire=?");

			
			preparedStatement.setInt(1,id);
			
			
			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}


	
	
}
	
	
	}
