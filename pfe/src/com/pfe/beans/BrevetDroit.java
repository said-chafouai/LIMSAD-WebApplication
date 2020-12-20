package com.pfe.beans;

import java.sql.Date;

public class BrevetDroit {
	boolean validation;
	int id_brevet;
	String intitule;
	String type;
	String champApplication;
	int numeroDepot;
	Date dateDepot;
	int numeroEnregistrement;
	String acteurexterne;
	int id_utilisateur;
	String preuve;
	String declarant;
	
	
    public boolean isValidation() {
		return validation;
	}
	public void setValidation(boolean validation) {
		this.validation = validation;
	}
	public String getDeclarant() {
		return declarant;
	}
	public void setDeclarant(String declarant) {
		this.declarant = declarant;
	}
	public String getPreuve() {
		return preuve;
	}
	public void setPreuve(String preuve) {
		this.preuve = preuve;
	}
	public int getId_brevet() {
		return id_brevet;
	}
	public void setId_brevet(int id_brevet) {
		this.id_brevet = id_brevet;
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
	public String getChampApplication() {
		return champApplication;
	}
	public void setChampApplication(String champApplication) {
		this.champApplication = champApplication;
	}
	public int getNumeroDepot() {
		return numeroDepot;
	}
	public void setNumeroDepot(int numeroDepot) {
		this.numeroDepot = numeroDepot;
	}
	public Date getDateDepot() {
		return dateDepot;
	}
	public void setDateDepot(Date dateDepot) {
		this.dateDepot = dateDepot;
	}
	public int getNumeroEnregistrement() {
		return numeroEnregistrement;
	}
	public void setNumeroEnregistrement(int numeroEnregistrement) {
		this.numeroEnregistrement = numeroEnregistrement;
	}
	public String getActeurexterne() {
		return acteurexterne;
	}
	public void setActeurexterne(String acteurexterne) {
		this.acteurexterne = acteurexterne;
	}
	public int getId_utilisateur() {
		return id_utilisateur;
	}
	public void setId_utilisateur(int id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}
	
	
	
	
	
}
