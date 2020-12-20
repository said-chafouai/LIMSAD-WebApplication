package com.pfe.beans;

import java.util.ArrayList;
import java.util.List;

public class Equipe {
	int id;
	String nom;
	int chef;
	List<Integer> enseignants = new ArrayList<Integer>();
	List<Integer> doctorants = new ArrayList<Integer>();
	
	
	public int getChef() {
		return chef;
	}
	public void setChef(int chef) {
		this.chef = chef;
	}


	
	public List<Integer> getEnseignants() {
		return enseignants;
	}
	public void setEnseignants(List<Integer> enseignants) {
		this.enseignants = enseignants;
	}
	public List<Integer> getDoctorants() {
		return doctorants;
	}
	public void setDoctorants(List<Integer> doctorants) {
		this.doctorants = doctorants;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	

}
