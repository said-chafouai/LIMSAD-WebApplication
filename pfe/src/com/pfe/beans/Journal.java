package com.pfe.beans;

import java.sql.Date;

public class Journal {
int id_journal;
String intitule;
String journal;

String baseIndexation;
Date datePublication;
int id_utilisateur;
public int getId_journal() {
	return id_journal;
}
public void setId_journal(int id_journal) {
	this.id_journal = id_journal;
}
public String getIntitule() {
	return intitule;
}
public void setIntitule(String intitule) {
	this.intitule = intitule;
}
public String getJournal() {
	return journal;
}
public void setJournal(String journal) {
	this.journal = journal;
}

public String getBaseIndexation() {
	return baseIndexation;
}
public void setBaseIndexation(String baseIndexation) {
	this.baseIndexation = baseIndexation;
}
public Date getDatePublication() {
	return datePublication;
}
public void setDatePublication(Date datePublication) {
	this.datePublication = datePublication;
}
public int getId_utilisateur() {
	return id_utilisateur;
}
public void setId_utilisateur(int id_utilisateur) {
	this.id_utilisateur = id_utilisateur;
}


}
