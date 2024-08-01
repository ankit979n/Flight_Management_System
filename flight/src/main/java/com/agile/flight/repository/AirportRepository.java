package com.agile.flight.repository;

import com.agile.flight.bean.Airport;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AirportRepository extends JpaRepository<Airport, String> {
	@Query("SELECT a.airportLocation FROM Airport a")
    List<String> findAllAirportLocations();
	
	Airport findByAirportLocation(String airportLocation);

    @Query("SELECT a.airportCode FROM Airport a WHERE a.airportLocation = :location")
    String findAirportCodeByLocation(String location);
}
