package com.agile.flight.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Flight {
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
    private Long flightNumber;
    private String carrierName;
    private Integer seatCapacity;
    private Integer seatBooked;
    private Long routeId;
    private String departure;
    private String arrival;

    public Flight() {}

    public Flight(String carrierName, Integer seatCapacity, Long routeId, String departure, String arrival) {
        this.carrierName = carrierName;
        this.seatCapacity = seatCapacity;
        this.routeId = routeId;
        this.departure = departure;
        this.arrival = arrival;
    }

    public Long getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(Long flightNumber) {
        this.flightNumber = flightNumber;
    }

    public String getCarrierName() {
        return carrierName;
    }

    public void setCarrierName(String carrierName) {
        this.carrierName = carrierName;
    }

    public Integer getSeatCapacity() {
        return seatCapacity;
    }

    public void setSeatCapacity(Integer seatCapacity) {
        this.seatCapacity = seatCapacity;
    }

    public Long getRouteId() {
        return routeId;
    }

    public void setRouteId(Long routeId) {
        this.routeId = routeId;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getArrival() {
        return arrival;
    }

    public void setArrival(String arrival) {
        this.arrival = arrival;
    }
    
    public void setReturnRouteId(Long routeId) {
        this.routeId = routeId + 1;
    }

	public Integer getSeatBooked() {
		return seatBooked;
	}

	public void setSeatBooked(Integer seatBooked) {
		this.seatBooked = seatBooked;
	}
}
