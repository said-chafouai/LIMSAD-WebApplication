package com.pfe.beans;

import java.sql.Date;;

public class Budget {
	private Date dateBudget;
	private int somme;
	
	public Date getDateBudget() {
		return dateBudget;
	}
	public void setDateBudget(Date dateBudget) {
		this.dateBudget = dateBudget;
	}
	public int getSomme() {
		return somme;
	}
	public void setSomme(int somme) {
		this.somme = somme;
	}

}
