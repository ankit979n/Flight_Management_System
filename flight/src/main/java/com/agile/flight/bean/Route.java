package com.agile.flight.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Route {
    
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
    private Long routeId;
    private String sourceAirportCode;
    private String destinationAirportCode;
    private Double fair; // Add this line
    

    public Route() {}

    public Route(String sourceAirportCode, String destinationAirportCode) {
        this.sourceAirportCode = sourceAirportCode;
        this.destinationAirportCode = destinationAirportCode;
    }

    public Long getRouteId() {
        return routeId;
    }

    public void setRouteId(Long routeId) {
        this.routeId = routeId;
    }

    public String getSourceAirportCode() {
        return sourceAirportCode;
    }

    public void setSourceAirportCode(String sourceAirportCode) {
        this.sourceAirportCode = sourceAirportCode.toUpperCase();
    }

    public String getDestinationAirportCode() {
        return destinationAirportCode;
    }

    public void setDestinationAirportCode(String destinationAirportCode) {
        this.destinationAirportCode = destinationAirportCode.toUpperCase();
    }
    
    public Double getFair() { // Add this method
        return fair;
    }

    public void setFair(Double fair) { // Add this method
        this.fair = fair;
    }
}
