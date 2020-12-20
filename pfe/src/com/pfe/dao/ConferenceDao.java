package com.pfe.dao;

import java.util.List;

import com.pfe.beans.Conference;

public interface ConferenceDao {
	public void ajouter(Conference conference) ;
	public void declarer_participant(int id_conference, int id_participant) ;
	public int dernierConference();
	public List<Conference> lister(int id_user, String etat,String type);
	public List<Conference> lister_participant(int id_user, String etat,String pays);
	public void supprimer(int id);
	public void supprimerP(int id);
	 public void modifier(Conference conference);
}
