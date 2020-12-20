package com.pfe.dao;

import java.util.List;

import com.pfe.beans.Budget;

public interface BudgetDao {
	public void ajouter(Budget budget);
	public List<Budget> lister();


}
