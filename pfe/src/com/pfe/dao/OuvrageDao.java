package com.pfe.dao;

import java.util.List;

import com.pfe.beans.Ouvrage;

public interface OuvrageDao {
	List<Ouvrage> lister(String etat);
	List<Ouvrage> lister(int id_user, String comportement);
	public Ouvrage lister(int id);
	void ajouter(int id_user , Ouvrage ouvrage);
	void valider(int id); // appeler par le directeur
	void modifier(Ouvrage ouvrage);
	void supprimer(int id);
	public void supprimerparticipant(int id_ouvrage);
	public List<Ouvrage> lister_participant(int id_user, String etat);
	public void declarer_participant(int id_ouvrage, int id_participant);
	public int dernierOuvrage();

	
}
