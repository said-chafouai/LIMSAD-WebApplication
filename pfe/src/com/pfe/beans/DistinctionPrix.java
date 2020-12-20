package com.pfe.beans;

import java.sql.Date;

public class DistinctionPrix {
     int id_distinctionPrix;
     String intitule;
     String evenement;
     String organisme;
     Date dateDistinction;
     int id_utilisateur;
	public int getId_distinctionPrix() {
		return id_distinctionPrix;
	}
	public void setId_distinctionPrix(int id_distinctionPrix) {
		this.id_distinctionPrix = id_distinctionPrix;
	}
	public String getIntitule() {
		return intitule;
	}
	public void setIntitule(String intitule) {
		this.intitule = intitule;
	}
	public String getEvenement() {
		return evenement;
	}
	public void setEvenement(String evenement) {
		this.evenement = evenement;
	}
	public String getOrganisme() {
		return organisme;
	}
	public void setOrganisme(String organisme) {
		this.organisme = organisme;
	}
	public Date getDateDistinction() {
		return dateDistinction;
	}
	public void setDateDistinction(Date dateDistinction) {
		this.dateDistinction = dateDistinction;
	}
	public int getId_utilisateur() {
		return id_utilisateur;
	}
	public void setId_utilisateur(int id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}
     
     
	
	
}
