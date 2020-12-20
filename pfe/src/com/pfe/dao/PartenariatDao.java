package com.pfe.dao;

import java.util.List;

import com.pfe.beans.Partenariat;

public interface PartenariatDao {
	public void ajouter(Partenariat partenariat);
	public int dernierPartenariat() ;
	public void declarer_participant(int id_partenariat, int id_participant);
	public List<Partenariat> lister_participant(int id_user, String etat);
	public List<Partenariat> lister(int id_user, String etat);
	public void supprimerP(int id);
	public void supprimer(int id) ;
	public void modifier(Partenariat partenariat);
	public List<Partenariat> lister(int id_user) ;
	public void valide(int id);
	}
