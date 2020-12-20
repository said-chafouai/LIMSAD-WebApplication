 package com.pfe.dao;

import java.util.List;
import com.pfe.beans.Utilisateur;

public interface UtilisateurDao {
	
	void ajouter(Utilisateur utilisateur);
	List<Utilisateur> lister();
	public void modifier(Utilisateur utilisateur, String changement );
	public void session(int id_user, String etat);
	public void supprimer(int login);
	public List<Utilisateur> doctorants(int id);


}
