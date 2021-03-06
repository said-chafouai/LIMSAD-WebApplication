package com.pfe.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.pfe.beans.Ouvrage;

public class OuvrageDaoImpl implements OuvrageDao {
	private DaoFactory daoFactory;

	OuvrageDaoImpl(DaoFactory daoFactory) {
		this.daoFactory = daoFactory;
	}

	// ####### ajouter #######
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.pfe.dao.OuvrageDao#ajouter(int, com.pfe.beans.Ouvrage) void
	 * ajouter(int id_user , Ouvrage ouvrage) ajouter un ouvrage pour un utilisateur
	 * specifique id_user l'identifiant de l'utilisateur qui'a ajouter
	 *
	 */

	public void ajouter(int id_user, Ouvrage ouvrage) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("INSERT INTO ouvrages(intitule,maisonEdition,issn,isbn,dateOuvrage,acteurExterne,id_utilisateur,preuve) VALUES(?,?,?,?,?,?,?,?);");
			preparedStatement.setString(1, ouvrage.getIntitule());
			preparedStatement.setString(2, ouvrage.getMaisonEdition());
			preparedStatement.setString(3, ouvrage.getIssn());
			preparedStatement.setString(4, ouvrage.getIsbn());
			preparedStatement.setDate(5, ouvrage.getDateOuvrage());
			preparedStatement.setString(6, ouvrage.getActeurExterne());
			preparedStatement.setInt(7, id_user);
			preparedStatement.setString(8,ouvrage.getPreuve());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		}
	}

	// ##### END : ajouter #######################

	// #############" valider #########
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.pfe.dao.OuvrageDao#valider(int) public void valider(int id) valider
	 * une activite methode propre au directeur
	 * 
	 */

	public void valider(int id) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("UPDATE ouvrages SET validation=true where id_ouvrage=?");
			preparedStatement.setInt(1, id);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}

	}

	// ############# END : valider ##################################"#
	
	
	// #############   lister(int id)  ##################################"#
	/*
	 * prend l'argument d'un ouvrage en parametre return un ouvrage appeller pour la
	 * modification
	 */

	public Ouvrage lister(int id) {
		Ouvrage ouvrage = new Ouvrage();
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultat = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("select * from ouvrages where id_ouvrage=?;");
			preparedStatement.setInt(1, id);

			resultat = preparedStatement.executeQuery();

			resultat.next();

			ouvrage.setId(resultat.getInt("id_ouvrage"));
			ouvrage.setIntitule(resultat.getString("intitule"));
			ouvrage.setMaisonEdition(resultat.getString("maisonedition"));
			ouvrage.setIssn(resultat.getString("issn"));
			ouvrage.setIsbn(resultat.getString("isbn"));
			ouvrage.setDateOuvrage(resultat.getDate("dateouvrage"));
			ouvrage.setActeurExterne(resultat.getString("acteurExterne"));
			ouvrage.setValidation(resultat.getBoolean("validation"));

		} catch (SQLException e) {

		} finally {
			try {
				if (resultat != null)
					resultat.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connexion != null)
					connexion.close();
			} catch (SQLException ignore) {

			}
		}

		return ouvrage;
	}
	
	// #############   END : lister(int id)  ##################################"#


	// ############## lister etat(valider,attente) ###########################

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.pfe.dao.OuvrageDao#lister(java.lang.String) lister tous les ouvrages
	 * pour le directeur par ordre de la date valider ou en attente selon l'etat
	 * methode propre au directeur
	 * 
	 */

	public List<Ouvrage> lister(String etat) {
		List<Ouvrage> ouvrages = new ArrayList<Ouvrage>();
		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;
		
			try {
				connexion = daoFactory.getConnection();
				statement = connexion.createStatement();
				if(etat.equals("valider")) {
					resultat = statement.executeQuery(" SELECT o.*,nom,prenom from ouvrages o,utilisateurs u where o.id_utilisateur=u.id_utilisateur and validation=false order by dateouvrage desc;");
				}else if(etat.equals("attente")) {
					resultat = statement.executeQuery(" SELECT o.*,u.nom,u.prenom from ouvrages o,utilisateurs u where o.id_utilisateur=u.id_utilisateur and o.validation=false and u.cne IS NULL;");					
				}

				while (resultat.next()) {
					Ouvrage ouvrage = new Ouvrage();

					ouvrage.setId(resultat.getInt("id_ouvrage"));
					ouvrage.setIntitule(resultat.getString("intitule"));
					ouvrage.setMaisonEdition(resultat.getString("maisonedition"));
					ouvrage.setIssn(resultat.getString("issn"));
					ouvrage.setIsbn(resultat.getString("isbn"));
					ouvrage.setDateOuvrage(resultat.getDate("dateouvrage"));
					ouvrage.setActeurExterne(resultat.getString("acteurExterne"));
					ouvrage.setDeclarant(resultat.getString("nom")+" "+resultat.getString("prenom"));
					ouvrage.setValidation(resultat.getBoolean("validation"));
					ouvrage.setPreuve(resultat.getString("preuve"));

					ouvrages.add(ouvrage);

				}

			} catch (SQLException e) {
				e.printStackTrace();

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

		return ouvrages;

	}

	// #################" lister #####################
	/*
	 * 
	 * (non-Javadoc)
	 * 
	 * @see com.pfe.dao.OuvrageDao#lister(int, java.lang.String) public
	 * List<Ouvrage> lister(int id_user, String comportement) lister les ouvrages
	 * pour un utilisateur donne selon le comportement comportement (valider ou
	 * attente)
	 * 
	 */

	public List<Ouvrage> lister(int id_user, String comportement) {
		List<Ouvrage> ouvrages = new ArrayList<Ouvrage>();
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultat = null;

		try {
			connexion = daoFactory.getConnection();
			if (comportement.equals("valider")) {
				preparedStatement = connexion.prepareStatement(
						"select * from ouvrages where id_utilisateur=? and validation=true order by dateouvrage;");
			} else if (comportement.equals("attente")) {
				preparedStatement = connexion.prepareStatement(
						"select * from ouvrages where id_utilisateur=? and validation=false order by id_ouvrage desc;");
			}
			preparedStatement.setInt(1, id_user);

			resultat = preparedStatement.executeQuery();

			while (resultat.next()) {
				Ouvrage ouvrage = new Ouvrage();

				ouvrage.setId(resultat.getInt("id_ouvrage"));
				ouvrage.setIntitule(resultat.getString("intitule"));
				ouvrage.setMaisonEdition(resultat.getString("maisonedition"));
				ouvrage.setIssn(resultat.getString("issn"));
				ouvrage.setIsbn(resultat.getString("isbn"));
				ouvrage.setDateOuvrage(resultat.getDate("dateouvrage"));
				ouvrage.setActeurExterne(resultat.getString("acteurExterne"));
				ouvrage.setValidation(resultat.getBoolean("validation"));

				ouvrages.add(ouvrage);

			}
		} catch (SQLException e) {

		} finally {
			try {
				if (resultat != null)
					resultat.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connexion != null)
					connexion.close();
			} catch (SQLException ignore) {

			}
		}

		return ouvrages;
	}
	// ########### END : Lister #####################

	// ############## Modifier ########################
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.pfe.dao.OuvrageDao#modifier(com.pfe.beans.Ouvrage) public void
	 * modifier(Ouvrage ouvrage) modifier un ouvrage passe en argument
	 * 
	 */

	public void modifier(Ouvrage ouvrage) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement(
					"UPDATE ouvrages SET intitule=?,maisonEdition=?,issn=?,isbn=?,dateOuvrage=?,acteurExterne=? where id_ouvrage=?");
			preparedStatement.setString(1, ouvrage.getIntitule());
			preparedStatement.setString(2, ouvrage.getMaisonEdition());
			preparedStatement.setString(3, ouvrage.getIssn());
			preparedStatement.setString(4, ouvrage.getIsbn());
			preparedStatement.setDate(5, ouvrage.getDateOuvrage());
			preparedStatement.setString(6, ouvrage.getActeurExterne());
			preparedStatement.setInt(7, ouvrage.getId());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}
	}

	// ######## END : modifier ##################

	// #########" Supprimer ########################
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.pfe.dao.OuvrageDao#supprimer(int) supprime un ouvrage id_ouvrage
	 * passe en argument
	 * 
	 */

	public void supprimer(int id) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("DELETE FROM ouvrages where id_ouvrage=?;");
			preparedStatement.setInt(1, id);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}
	}

	// ####### END : Supprimer ########################

	// ####### dernierOuvrage ########################

	public int dernierOuvrage() {

		Connection connexion = null;

		ResultSet resultat = null;
		PreparedStatement preparedStatement = null;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("select max(id_ouvrage) from ouvrages;");
			resultat = preparedStatement.executeQuery();
			resultat.next();
			int maxOuvrage = resultat.getInt(1);

			return maxOuvrage;
		} catch (SQLException e) {

		}
		return 0;

	}

	// ####### END : dernierOuvrage ########################

	// ####### declarer_participant ########################

	public void declarer_participant(int id_ouvrage, int id_participant) {

		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion
					.prepareStatement("INSERT  INTO participationouvrage(id_ouvrage,id_utilisateur) value(?,?);");

			preparedStatement.setInt(1, id_ouvrage);
			preparedStatement.setInt(2, id_participant);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}
	}

	// ####### END : declarer_participant ########################

	// ####### lister_participant ########################

	public List<Ouvrage> lister_participant(int id_user, String etat) {
		List<Ouvrage> ouvrages = new ArrayList<Ouvrage>();
		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("select o.* from ouvrages o, participationouvrage p where p.id_ouvrage=o.id_ouvrage and p.id_utilisateur=? and o.validation=false;");
			
			preparedStatement.setInt(1, id_user);
			resultat = preparedStatement.executeQuery();

			while (resultat.next()) {

				Ouvrage ouvrage = new Ouvrage();
				ouvrage.setId(resultat.getInt("id_ouvrage"));
				ouvrage.setIntitule(resultat.getString("intitule"));
				ouvrage.setMaisonEdition(resultat.getString("maisonedition"));
				ouvrage.setIssn(resultat.getString("issn"));
				ouvrage.setIsbn(resultat.getString("isbn"));
				ouvrage.setDateOuvrage(resultat.getDate("dateouvrage"));
				ouvrage.setActeurExterne(resultat.getString("acteurExterne"));
				ouvrage.setValidation(resultat.getBoolean("validation"));

				ouvrages.add(ouvrage);
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
		return ouvrages;
	}

	// ####### END : lister_participant ########################
		
	// ####### supprimerparticipant ########################

	public void supprimerparticipant(int id_ouvrage) {

		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("DELETE  FROM participationouvrage  WHERE id_ouvrage=?");
			preparedStatement.setInt(1, id_ouvrage);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		}

	}
	
	// ####### END : supprimerparticipant ########################


}
