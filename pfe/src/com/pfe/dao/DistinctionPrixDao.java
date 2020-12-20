package com.pfe.dao;

import java.util.List;

import com.pfe.beans.DistinctionPrix;

public interface DistinctionPrixDao {
	public void ajouter(DistinctionPrix distinction);
	public int dernierDistinctionPrix();
	public void declarer_participant(int id_distinction, int id_participant) ;
	public List<DistinctionPrix> lister(int id_user, String etat) ;
	public void supprimer(int id);
	public List<DistinctionPrix> lister_participant(int id_user, String etat);
	public void supprimerP(int id);
	 public void modifier(DistinctionPrix distinction) ;
}
