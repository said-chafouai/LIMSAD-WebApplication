package com.pfe.beans;

import java.sql.Date;

public class Ouvrage {
	int id ;
	String intitule ;
	String maisonEdition ;
	String issn;
	String isbn;
	Date dateOuvrage;
	String acteurExterne;
	String declarant;
	boolean validation;
	String preuve;
	
	
	public String getPreuve() {
		return preuve;
	}
	public void setPreuve(String preuve) {
		this.preuve = preuve;
	}
	public String getDeclarant() {
		return declarant;
	}
	public void setDeclarant(String declarant) {
		this.declarant = declarant;
	}
	public Date getDateOuvrage() {
		return dateOuvrage;
	}
	public void setDateOuvrage(Date dateOuvrage) {
		this.dateOuvrage = dateOuvrage;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIntitule() {
		return intitule;
	}
	public void setIntitule(String intitule) {
		this.intitule = intitule;
	}
	public String getMaisonEdition() {
		return maisonEdition;
	}
	public void setMaisonEdition(String maisonEdition) {
		this.maisonEdition = maisonEdition;
	}
	public String getIssn() {
		return issn;
	}
	public void setIssn(String issn) {
		this.issn = issn;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getActeurExterne() {
		return acteurExterne;
	}
	public void setActeurExterne(String acteurExterne) {
		this.acteurExterne = acteurExterne;
	}
	public boolean isValidation() {
		return validation;
	}
	public void setValidation(boolean validation) {
		this.validation = validation;
	}
	
	
	
}
