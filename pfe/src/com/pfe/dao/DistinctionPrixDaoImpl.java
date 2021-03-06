package com.pfe.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.pfe.beans.DistinctionPrix;

public class DistinctionPrixDaoImpl implements DistinctionPrixDao {
          
	private DaoFactory daoFactory;

	DistinctionPrixDaoImpl(DaoFactory daoFactory) {
		this.daoFactory = daoFactory;
	}
	public void ajouter(DistinctionPrix distinction) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement(
					"INSERT INTO distinctionsPrix ( intitule,evenement, organisme, dateDistinctionPrix, id_utilisateur) VALUES(?,?,?,?,?);");

			preparedStatement.setString(1, distinction.getIntitule());
			preparedStatement.setString(2, distinction.getEvenement());
			preparedStatement.setString(3, distinction.getOrganisme());
			preparedStatement.setDate(4, distinction.getDateDistinction());
			preparedStatement.setInt(5, distinction.getId_utilisateur());
			
			
			
			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}
	
	}
	public void declarer_participant(int id_distinction, int id_participant) {

		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement(
					"INSERT  INTO participationdistinctionprix(id_distinctionPrix,id_utilisateur) value(?,?)");

			preparedStatement.setInt(1, id_distinction);
			preparedStatement.setInt(2, id_participant);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}
	}
	public int dernierDistinctionPrix() {

		Connection connexion = null;

		ResultSet resultat = null;
		PreparedStatement preparedStatement = null;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("select max(id_distinctionprix) from distinctionsprix  ;");
			resultat = preparedStatement.executeQuery();
			resultat.next();
			int max_distinction = resultat.getInt(1);

			return max_distinction;
		} catch (SQLException e) {

		}
		return 0;

	}
	public List<DistinctionPrix> lister(int id_user, String etat) {
		List<DistinctionPrix> distinctionsPrix = new ArrayList<DistinctionPrix>();
		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;
		PreparedStatement preparedStatement = null;

		if (etat.equals("valide")) {
			try {
				connexion = daoFactory.getConnection();
				preparedStatement = connexion
						.prepareStatement("select * from distinctionsPrix where id_utilisateur=? and  validation=true ;");
				preparedStatement.setInt(1, id_user);

				resultat = preparedStatement.executeQuery();
				while (resultat.next()) {
					int id_distinction = resultat.getInt(1);
					String intitule = resultat.getString(2);
					String evenement = resultat.getString(3);
					int id_utilisateur = resultat.getInt(6);
					String organisme = resultat.getString(4);
					Date datedistinction = resultat.getDate(5);

					DistinctionPrix distinctionPrix = new DistinctionPrix();
					distinctionPrix.setId_distinctionPrix(id_distinction);
					distinctionPrix.setIntitule(intitule);
					distinctionPrix.setEvenement(evenement);
					distinctionPrix.setOrganisme(organisme);
					distinctionPrix.setId_utilisateur(id_utilisateur);
					distinctionPrix.setDateDistinction(datedistinction);

					distinctionsPrix.add(distinctionPrix);
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
						.prepareStatement("select * from distinctionsPrix where id_utilisateur=? and validation=false ;");
				preparedStatement.setInt(1, id_user);

				resultat = preparedStatement.executeQuery();
				while (resultat.next()) {
					int id_distinction = resultat.getInt(1);
					String intitule = resultat.getString(2);
					String evenement = resultat.getString(3);
					int id_utilisateur = resultat.getInt(6);
					String organisme = resultat.getString(4);
					Date datedistinction = resultat.getDate(5);

					DistinctionPrix distinctionPrix = new DistinctionPrix();
					distinctionPrix.setId_distinctionPrix(id_distinction);
					distinctionPrix.setIntitule(intitule);
					distinctionPrix.setEvenement(evenement);
					distinctionPrix.setOrganisme(organisme);
					distinctionPrix.setId_utilisateur(id_utilisateur);
					distinctionPrix.setDateDistinction(datedistinction);

					distinctionsPrix.add(distinctionPrix);
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
		return distinctionsPrix;
	}
	public List<DistinctionPrix> lister_participant(int id_user, String etat) {
		List<DistinctionPrix> distinctionsprix = new ArrayList<DistinctionPrix>();
		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;
		PreparedStatement preparedStatement = null;

		if (etat.equals("valide")) {
			try {
				connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement(
						"select b.* from distinctionsPrix b join participationdistinctionprix p where p.id_distinctionPrix=b.id_distinctionPrix and p.id_utilisateur=? and b.validation=true;");
				preparedStatement.setInt(1, id_user);

				resultat = preparedStatement.executeQuery();
				while (resultat.next()) {
					int id_distinction = resultat.getInt(1);
					String intitule = resultat.getString(2);
					String evenement = resultat.getString(3);
					int id_utilisateur = resultat.getInt(6);
					String organisme = resultat.getString(4);
					Date datedistinction = resultat.getDate(5);

					DistinctionPrix distinctionPrix = new DistinctionPrix();
					distinctionPrix.setId_distinctionPrix(id_distinction);
					distinctionPrix.setIntitule(intitule);
					distinctionPrix.setEvenement(evenement);
					distinctionPrix.setOrganisme(organisme);
					distinctionPrix.setId_utilisateur(id_utilisateur);
					distinctionPrix.setDateDistinction(datedistinction);

					distinctionsprix.add(distinctionPrix);
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
						"select b.* from distinctionsPrix b join participationdistinctionprix p where p.id_distinctionPrix=b.id_distinctionPrix and p.id_utilisateur=? and b.validation=false;");
				preparedStatement.setInt(1, id_user);

				resultat = preparedStatement.executeQuery();
				while (resultat.next()) {
					int id_distinction = resultat.getInt(1);
					String intitule = resultat.getString(2);
					String evenement = resultat.getString(3);
					int id_utilisateur = resultat.getInt(6);
					String organisme = resultat.getString(4);
					Date datedistinction = resultat.getDate(5);

					DistinctionPrix distinctionPrix = new DistinctionPrix();
					distinctionPrix.setId_distinctionPrix(id_distinction);
					distinctionPrix.setIntitule(intitule);
					distinctionPrix.setEvenement(evenement);
					distinctionPrix.setOrganisme(organisme);
					distinctionPrix.setId_utilisateur(id_utilisateur);
					distinctionPrix.setDateDistinction(datedistinction);

					distinctionsprix.add(distinctionPrix);
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
		return distinctionsprix;
	}
    public void supprimer(int id) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("DELETE  FROM distinctionsprix  WHERE id_distinctionPrix=?");

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
			preparedStatement = connexion.prepareStatement("DELETE  FROM participationdistinctionprix  WHERE id_distinctionPrix=?");

			preparedStatement.setInt(1, id);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}

	}
    public void modifier(DistinctionPrix distinction) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("update distinctionsPrix SET datedistinctionprix=?,intitule=?,organisme=?,evenement=? WHERE id_distinctionPrix=?");

			preparedStatement.setDate(1, distinction.getDateDistinction());
			preparedStatement.setString(2, distinction.getIntitule());
			preparedStatement.setString(3,distinction.getOrganisme());
			preparedStatement.setString(4,distinction.getEvenement());
			
			preparedStatement.setInt(5,distinction.getId_distinctionPrix());
			
			
			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}


	
	
}
	
}
