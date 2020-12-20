	package com.pfe.beans;
import java.sql.Date;
public class Evenement {
	private String titre;
	int id_evenement;
    public int getId_evenement() {
		return id_evenement;
	}
	public void setId_evenement(int id_evenement) {
		this.id_evenement = id_evenement;
	}
	private String message;
    private Date date;
    private String type;
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String mess) {
		this.message = mess;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}
