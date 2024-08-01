package com.agile.flight.service;

import com.agile.flight.bean.Flight;




import com.agile.flight.bean.FlightUser;
import com.agile.flight.repository.FlightRepository;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FlightService {

    @Autowired
    private FlightRepository flightRepository;
    

    public Flight createReturnFlight(Flight flight, String dtime, String atime) {
        Flight returnFlight = new Flight();
        returnFlight.setFlightNumber(flight.getFlightNumber() + 1);
        returnFlight.setCarrierName(flight.getCarrierName());
        returnFlight.setSeatCapacity(flight.getSeatCapacity());
        returnFlight.setRouteId(flight.getRouteId() + 1); // Assuming the return route has ID routeId + 1
        returnFlight.setDeparture(flight.getArrival());
        returnFlight.setArrival(flight.getDeparture());
        
        if (flight.getRouteId() % 2 == 0) {
            returnFlight.setRouteId(flight.getRouteId() - 1);
        } else {
            returnFlight.setRouteId(flight.getRouteId() + 1);
        }
        return returnFlight;
    }
    
    public Flight findByFlightNumber(Long flightNumber) {
        return flightRepository.findByFlightNumber(flightNumber);
    }
    
    @Transactional
    public Flight updateFlight(Flight flight) {
        return flightRepository.save(flight);
    }

    @Transactional
    public void deleteFlight(Long flightNumber) {
        flightRepository.deleteById(flightNumber);
    }

}
