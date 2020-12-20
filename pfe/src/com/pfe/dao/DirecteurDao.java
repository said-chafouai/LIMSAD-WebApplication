package com.pfe.dao;

import java.util.List;
import com.pfe.beans.Directeur;


public interface DirecteurDao {
	List<Directeur> lister();
	public void modifier(Directeur directeur);

}
