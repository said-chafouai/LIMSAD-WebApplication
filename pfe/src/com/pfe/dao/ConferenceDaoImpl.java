package com.pfe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.pfe.beans.Conference;


public class ConferenceDaoImpl implements ConferenceDao {

	private DaoFactory daoFactory;

	ConferenceDaoImpl(DaoFactory daoFactory) {
		this.daoFactory = daoFactory;
	}
	
	public void ajouter(Conference conference) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			
					
		   preparedStatement = connexion.prepareStatement("INSERT INTO conferences ( intitule,manifestation, ville, dateConference,acteurexterne, id_utilisateur,pays) VALUES(?,?,?,?,?,?,?);");
					
					
			preparedStatement.setString(1, conference.getIntitule());
			preparedStatement.setString(2, conference.getManifestation());
			preparedStatement.setString(3, conference.getVille());
			preparedStatement.setDate(4, conference.getDateConference());
			preparedStatement.setInt(6, conference.getId_utilisateur());
			preparedStatement.setString(5, conference.getActeurexterne());
			preparedStatement.setString(7, conference.getPays());
			
			
			
			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}
	
	}
	public void declarer_participant(int id_conference, int id_participant) {

		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement(
					"INSERT  INTO participationconference(id_conference,id_utilisateur) value(?,?)");

			preparedStatement.setInt(1, id_conference);
			preparedStatement.setInt(2, id_participant);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}
	}
	public int dernierConference() {

		Connection connexion = null;

		ResultSet resultat = null;
		PreparedStatement preparedStatement = null;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("select max(id_conference) from conferences  ;");
			resultat = preparedStatement.executeQuery();
			resultat.next();
			int max_conference = resultat.getInt(1);

			return max_conference;
		} catch (SQLException e) {

		}
		return 0;

	}
	public List<Conference> lister(int id_user, String etat,String type) {
		List<Conference> conferences = new ArrayList<Conference>();
		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;
		PreparedStatement preparedStatement = null;

		if (etat.equals("valide")) {
			try {
				connexion = daoFactory.getConnection();
				if(type.equals("inter")) {
				preparedStatement = connexion
		                .prepareStatement("select * from conferences where id_utilisateur=? and  validation=true and pays is not null ;");
				}
				else {preparedStatement = connexion
		                .prepareStatement("select * from conferences where id_utilisateur=? and  validation=true and pays is null ;");
				
					
				}
				preparedStatement.setInt(1, id_user);
				
				resultat = preparedStatement.executeQuery();
				while (resultat.next()) {
				
					

					Conference conference = new Conference();
					conference.setId_conference(resultat.getInt(1));
					conference.setIntitule(resultat.getString(2));
					conference.setManifestation(resultat.getString(3));
					conference.setPays(resultat.getString(4));
					conference.setVille(resultat.getString(5));
					conference.setActeurexterne(resultat.getString(8));
					conference.setId_utilisateur(resultat.getInt(7));
					conference.setDateConference(resultat.getDate(6));

					conferences.add(conference);
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
				if(type.equals("inter")) {
					preparedStatement = connexion
			                .prepareStatement("select * from conferences where id_utilisateur=? and  validation=false and pays is not null ;");
					}
					else {preparedStatement = connexion
			                .prepareStatement("select * from conferences where id_utilisateur=? and  validation=false and pays is null ;");
					
						
					}
					preparedStatement.setInt(1, id_user);
					
					resultat = preparedStatement.executeQuery();
				while (resultat.next()) {

					Conference conference = new Conference();
					conference.setId_conference(resultat.getInt(1));
					conference.setIntitule(resultat.getString(2));
					conference.setManifestation(resultat.getString(3));
					conference.setPays(resultat.getString(4));
					conference.setVille(resultat.getString(5));
					conference.setActeurexterne(resultat.getString(8));
					conference.setId_utilisateur(resultat.getInt(7));
					conference.setDateConference(resultat.getDate(6));

					conferences.add(conference);
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
		return conferences;
	}
	
	
	public List<Conference> lister_participant(int id_user, String etat,String pays) {
		List<Conference> conferences = new ArrayList<Conference>();
		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;
		PreparedStatement preparedStatement = null;

		if (etat.equals("valide")) {
			try {
				connexion = daoFactory.getConnection();
				if(pays.equals("inter")) {
				preparedStatement = connexion.prepareStatement(
						"select b.* from conferences b join participationconference p where p.id_conference=b.id_conference and p.id_utilisateur=? and b.validation=true and b.pays is not null;");
				}
				else {preparedStatement = connexion.prepareStatement(
						"select b.* from conferences b join participationconference p where p.id_conference=b.id_conference and p.id_utilisateur=? and b.validation=true and b.pays is null;");
				}
				preparedStatement.setInt(1, id_user);
				
				resultat = preparedStatement.executeQuery();
				while (resultat.next()) {

					Conference conference = new Conference();
					conference.setId_conference(resultat.getInt(1));
					conference.setIntitule(resultat.getString(2));
					conference.setManifestation(resultat.getString(3));
					conference.setPays(resultat.getString(4));
					conference.setVille(resultat.getString(5));
					conference.setActeurexterne(resultat.getString(8));
					conference.setId_utilisateur(resultat.getInt(7));
					conference.setDateConference(resultat.getDate(6));

					conferences.add(conference);
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
				if(pays.equals("inter")) {
				preparedStatement = connexion.prepareStatement(
						"select b.* from conferences b join participationconference p where p.id_conference=b.id_conference and p.id_utilisateur=? and b.validation=false and b.pays is not null;");
				}
				else {preparedStatement = connexion.prepareStatement(
						"select b.* from conferences b join participationconference p where p.id_conference=b.id_conference and p.id_utilisateur=? and b.validation=false and b.pays is null");
				}
				preparedStatement.setInt(1, id_user);
				

				resultat = preparedStatement.executeQuery();
				while (resultat.next()) {

					Conference conference = new Conference();
					conference.setId_conference(resultat.getInt(1));
					conference.setIntitule(resultat.getString(2));
					conference.setManifestation(resultat.getString(3));
					conference.setPays(resultat.getString(4));
					conference.setVille(resultat.getString(5));
					conference.setActeurexterne(resultat.getString(8));
					conference.setId_utilisateur(resultat.getInt(7));
					conference.setDateConference(resultat.getDate(6));

					conferences.add(conference);
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
		return conferences;
	}
	public void supprimer(int id) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("DELETE  FROM conferences  WHERE id_conference=?");

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
			preparedStatement = connexion.prepareStatement("DELETE  FROM participationconference  WHERE id_conference=?");

			preparedStatement.setInt(1, id);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}

	}
    public void modifier(Conference conference) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("update conferences SET dateConference=?,intitule=?,manifestation=?,ville=? ,pays=?  WHERE id_conference=?");

			preparedStatement.setDate(1, conference.getDateConference());
			preparedStatement.setString(2, conference.getIntitule());
			preparedStatement.setString(3,conference.getManifestation());
			preparedStatement.setString(4,conference.getVille());
			preparedStatement.setString(5,conference.getPays());
			
			
			preparedStatement.setInt(6,conference.getId_conference());
			
			
			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}


	
	
}

	
}
