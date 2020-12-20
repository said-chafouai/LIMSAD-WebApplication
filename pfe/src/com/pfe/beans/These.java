package com.pfe.beans;

import java.sql.Date;

public class These {
	int id_these;
	Date datePremierInscription ;
	Date dateSoutenance;
	String theseCotutelle ;
	String nom;
	String prenom;
	String Etablissement;
	String sujet ;
	int id_doctorant;
	int id_directeurThese;
	
	public int getId_these() {
		return id_these;
	}
	public void setId_these(int id_these) {
		this.id_these = id_these;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public Date getDatePremierInscription() {
		return datePremierInscription;
	}
	public void setDatePremierInscription(Date datePremierInscription) {
		this.datePremierInscription = datePremierInscription;
	}
	public Date getDateSoutenance() {
		return dateSoutenance;
	}
	public void setDateSoutenance(Date dateSoutenance) {
		this.dateSoutenance = dateSoutenance;
	}
	public String getTheseCotutelle() {
		return theseCotutelle;
	}
	public void setTheseCotutelle(String theseCotutelle) {
		this.theseCotutelle = theseCotutelle;
	}
	public String getEtablissement() {
		return Etablissement;
	}
	public void setEtablissement(String etablissementCotutelle) {
		Etablissement = etablissementCotutelle;
	}
	public String getSujet() {
		return sujet;
	}
	public void setSujet(String sujet) {
		this.sujet = sujet;
	}
	public int getId_doctorant() {
		return id_doctorant;
	}
	public void setId_doctorant(int id_doctorant) {
		this.id_doctorant = id_doctorant;
	}
	public int getId_directeurThese() {
		return id_directeurThese;
	}
	public void setId_directeurThese(int id_directeurThese) {
		this.id_directeurThese = id_directeurThese;
	}
	

}
