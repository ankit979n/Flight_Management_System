package com.agile.flight.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import com.agile.flight.bean.FlightUser;

public interface UserRepository extends JpaRepository<FlightUser, Long> {
	FlightUser findByEmail(String email);

	FlightUser findByUsername(String username);
}
