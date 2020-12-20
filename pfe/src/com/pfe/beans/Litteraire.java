package com.pfe.beans;

import java.sql.Date;

public class Litteraire {

	int id_litteraire;
	String Intitule;
	Date datelitteraire;
	int id_utilisateur;
	String nom;
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	String acteurexterne;
	public int getId_litteraire() {
		return id_litteraire;
	}
	public void setId_litteraire(int id_litteraire) {
		this.id_litteraire = id_litteraire;
	}
	public String getIntitule() {
		return Intitule;
	}
	public void setIntitule(String intitule) {
		Intitule = intitule;
	}
	public Date getDatelitteraire() {
		return datelitteraire;
	}
	public void setDatelitteraire(Date datelitteraire) {
		this.datelitteraire = datelitteraire;
	}
	public int getId_utilisateur() {
		return id_utilisateur;
	}
	public void setId_utilisateur(int id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}
	public String getActeurexterne() {
		return acteurexterne;
	}
	public void setActeurexterne(String acteurexterne) {
		this.acteurexterne = acteurexterne;
	}
	
	
	
	
	
}
