package com.agile.flight.repository;

import com.agile.flight.bean.Flight;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface FlightRepository extends JpaRepository<Flight, Long> {
	List<Flight> findByRouteId(Long routeId);
	Flight findByFlightNumber(Long flightNumber);
	Flight findFlightByFlightNumber(Long flightNumber);
}
