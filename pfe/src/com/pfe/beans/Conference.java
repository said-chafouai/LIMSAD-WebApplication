package com.pfe.beans;

import java.sql.Date;

public class Conference {
int id_conference;
String intitule;
String manifestation;
String pays;
String ville;
Date dateConference;
int id_utilisateur;
String acteurexterne;
public int getId_conference() {
	return id_conference;
}
public void setId_conference(int id_conference) {
	this.id_conference = id_conference;
}
public String getIntitule() {
	return intitule;
}
public void setIntitule(String intitule) {
	this.intitule = intitule;
}
public String getManifestation() {
	return manifestation;
}
public void setManifestation(String manifestation) {
	this.manifestation = manifestation;
}
public String getPays() {
	return pays;
}
public void setPays(String pays) {
	this.pays = pays;
}
public String getVille() {
	return ville;
}
public void setVille(String ville) {
	this.ville = ville;
}
public Date getDateConference() {
	return dateConference;
}
public void setDateConference(Date dateConference) {
	this.dateConference = dateConference;
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
