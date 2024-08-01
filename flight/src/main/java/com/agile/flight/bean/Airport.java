package com.agile.flight.bean;

import javax.persistence.Entity;

import javax.persistence.Id;

@Entity
public class Airport {
    @Id
    private String airportCode;
    private String airportLocation;

    public Airport() {}

    public Airport(String airportCode, String airportLocation) {
        this.airportCode = airportCode;
        this.airportLocation = airportLocation;
    }

    public String getAirportCode() {
        return airportCode;
    }

    public void setAirportCode(String airportCode) {
        this.airportCode = airportCode.toUpperCase();
    }

    public String getAirportLocation() {
        return airportLocation;
    }

    public void setAirportLocation(String airportLocation) {
        this.airportLocation = airportLocation.toUpperCase();
    }
}
