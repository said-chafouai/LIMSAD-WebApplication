package com.pfe.dao;

import java.util.List;

import com.pfe.beans.These;

public interface TheseDao {
	public List<These> lister(int id,String etat);
	public void supprimer(int id);
	public void ajouter(These these);
	public void modifier(These these);
}
