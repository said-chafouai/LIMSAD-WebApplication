package com.pfe.dao;
import java.util.List;
import com.pfe.beans.BrevetDroit;



public interface BrevetDroitDao {
void ajouter(BrevetDroit brevetDroit);
List<BrevetDroit> lister(int a,String etat);
void supprimer(int id);
int dernierBrevet();
void declarer_participant(int id_brevet,int id_participant);
List<BrevetDroit> lister_participant(int id_user,String etat);
BrevetDroit listerbrevet(int id_brevet);
void modifier(BrevetDroit brevetdroit);
void supprimerparticipant(int id_brevet);
public List<BrevetDroit> lister(String etat);
public void valider(int id);

	
	
	
	
}

