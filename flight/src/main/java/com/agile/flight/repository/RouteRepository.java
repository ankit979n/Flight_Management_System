package com.agile.flight.repository;

import com.agile.flight.bean.Route;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RouteRepository extends JpaRepository<Route, Long> {
	@Query("SELECT r FROM Route r WHERE r.sourceAirportCode = :sourceAirportCode AND r.destinationAirportCode = :destinationAirportCode")
	Optional<Route> findBySourceAirportCodeAndDestinationAirportCode(String sourceAirportCode, String destinationAirportCode);

	
    // Custom method for generating Route IDs if needed
    @Query("SELECT MAX(r.routeId) FROM Route r")
    Long findMaxRouteId();
    
    Optional<Route> findByRouteId(Long routeId);
      
}
