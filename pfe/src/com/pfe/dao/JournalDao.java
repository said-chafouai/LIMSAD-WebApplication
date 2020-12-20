package com.pfe.dao;

import java.util.List;

import com.pfe.beans.Journal;

public interface JournalDao {
	public void declarer_participant(int id_journal, int id_participant);
	public void ajouter(Journal journal,String etat);	
	public int dernierJournal() ;
	public List<Journal> lister(int id_user, String etat ,String type);
	public List<Journal> lister_participant(int id_user, String etat,String type) ;
	 public void supprimer(int id);
	 public void supprimerP(int id);
	    public void modifier(Journal journal);
}
