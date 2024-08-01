package com.agile.flight.bean;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

@Entity
public class Passenger{
	@EmbeddedId
	private TicketPassengerEmbed embeddedId;
	private String passengerName;
	private String passengerDOB;
	private Double fair;
	
	public Passenger() {
		super();
		//TODO Auto-generated constructor stub
	}
	// Parameterized constructor
	public Passenger(TicketPassengerEmbed embeddedId, String passengerName, String passengerDOB) {
        super();
        this.embeddedId = embeddedId;
        this.passengerName = passengerName;
        this.passengerDOB = passengerDOB;
    }
    public Passenger(TicketPassengerEmbed embeddedId, String passengerName, String passengerDOB, Double fair) {
        super();
        this.embeddedId = embeddedId;
        this.passengerName = passengerName;
        this.passengerDOB = passengerDOB;
        this.fair = fair;
    }

    // Getter and setter methods
    public TicketPassengerEmbed getEmbeddedId() {
        return embeddedId;
    }

    public void setEmbeddedId(TicketPassengerEmbed embeddedId) {
        this.embeddedId = embeddedId;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public void setPassengerName(String passengerName) {
        this.passengerName = passengerName;
    }

    public String getPassengerDOB() {
        return passengerDOB;
    }

    public void setPassengerDOB(String passengerDOB) {
        this.passengerDOB = passengerDOB;
    }

    public Double getFair() {
        return fair;
    }

    public void setFair(Double fair) {
        this.fair = fair;
    }
}