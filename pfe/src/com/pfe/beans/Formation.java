package com.pfe.beans;

import java.sql.Date;

public class Formation {
       int id_formation;
       String nom;
       public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	String intitule;
       Date dateformation;
       int id_utilisateur;
     
	public int getId_formation() {
		return id_formation;
	}
	public void setId_formation(int id_formation) {
		this.id_formation = id_formation;
	}
	public String getIntitule() {
		return intitule;
	}
	public void setIntitule(String intiule) {
		this.intitule = intiule;
	}
	public Date getDateformation() {
		return dateformation;
	}
	public void setDateformation(Date dateformation) {
		this.dateformation = dateformation;
	}
	public int getId_utilisateur() {
		return id_utilisateur;
	}
	public void setId_utilisateur(int id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}
	

}
