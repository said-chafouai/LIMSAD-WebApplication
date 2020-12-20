package com.pfe.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DaoFactory {
	private String url;
	private String username;
	private String password;
	
	DaoFactory(String url, String username, String password) {
		this.url = url;
		this.username = username;
		this.password = password;
	}
	
	public static DaoFactory getInstance() {
		try {
			Class.forName("com.mysql.jdbc.Driver");			
		}catch(ClassNotFoundException e) {}
		
		DaoFactory instance = new DaoFactory("jdbc:mysql://localhost:3306/limsad","root","");
		
		return instance;
	}
	
	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, username, password);
	}
	
	
	// les Tableau disponible dans la base ::
	
	public UtilisateurDao getUtilisateurDao() {
		return new UtilisateurDaoImpl(this);
	}
	
	public EvenementDao getEvenementDao() {
		return new EvenementDaoImpl(this);
	}
	

	public DirecteurDao getDirecteurDao() {
		return new DirecteurDaoImpl(this);
	}
	
	public OuvrageDao getOuvrageDao() {
		return new OuvrageDaoImpl(this);
	}
	
	public BrevetDroitDao getBrevetDroitDao() {
		return new BrevetDroitDaoImpl(this);
	}
	
	public BudgetDao getBudgetDao() {
		return new BudgetDaoImpl(this);
	}
	
	public EquipeDao getEquipeDao() {
		return new EquipeDaoImpl(this);
	}
	
	public TheseDao getTheseDao() {
		return new TheseDaoImpl(this);
	}
	

	
	public FormationDao getFormationDao() {
		return new FormationDaoImpl(this);
	}
	public LitteraireDao getLitteraireDao() {
		return new LitteraireDaoImpl(this);
	}
	public PartenariatDao getPartenariatDao() {
		return new PartenariatDaoImpl(this);
	}
	public DistinctionPrixDao getDistinctionPrixDao() {
		return new DistinctionPrixDaoImpl(this);
	}
	
	public JournalDao getJournalDao() {
		return new JournalDaoImpl(this);
	}
	public ConferenceDao getConferenceDao() {
		return new ConferenceDaoImpl(this);
	}
	
	
	
	
	

}
