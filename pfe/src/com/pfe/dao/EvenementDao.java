package com.pfe.dao;
import java.util.List;
import com.pfe.beans.Evenement;

public interface EvenementDao {
void ajouter(Evenement Evenement);
List<Evenement> lister();
void supprimer(int a);	
void modifier(Evenement evenement);
Evenement lister(int id);	
	
	
}
