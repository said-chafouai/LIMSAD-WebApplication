package com.pfe.dao;

import java.util.List;

import com.pfe.beans.Litteraire;

public interface LitteraireDao {
	public void ajouter(Litteraire litteraire);
	public void declarer_participant(int id_litteraire, int id_participant);
	public int dernierLitteraire() ;
	public List<Litteraire> lister(int id_user, String etat);
	public List<Litteraire> lister_participant(int id_user, String etat);
	public void supprimer(int id);
	public void supprimerP(int id);
	public void modifier(Litteraire litteraire);
	public List<Litteraire> lister(int id_user) ;
	public void valide(int id) ;
	
}
