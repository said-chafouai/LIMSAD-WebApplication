package com.pfe.beans;

import java.sql.Date;

public class Partenariat {
      int id_partenariat;
      String intitule;
      String type;
      String organisme;
      String nom;
      public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	Date datePartenariat;
      int id_utilisateur;
	public int getId_partenariat() {
		return id_partenariat;
	}
	public void setId_partenariat(int id_partenariat) {
		this.id_partenariat = id_partenariat;
	}
	public String getIntitule() {
		return intitule;
	}
	public void setIntitule(String intitule) {
		this.intitule = intitule;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getOrganisme() {
		return organisme;
	}
	public void setOrganisme(String organisme) {
		this.organisme = organisme;
	}
	public Date getDatePartenariat() {
		return datePartenariat;
	}
	public void setDatePartenariat(Date datePartenariat) {
		this.datePartenariat = datePartenariat;
	}
	public int getId_utilisateur() {
		return id_utilisateur;
	}
	public void setId_utilisateur(int id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}
      
	
	
	
}
