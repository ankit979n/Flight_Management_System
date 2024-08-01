package com.agile.flight.repository;

import com.agile.flight.bean.Passenger;
import com.agile.flight.bean.TicketPassengerEmbed;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PassengerRepository extends JpaRepository<Passenger, TicketPassengerEmbed> {
	List<Passenger> findByEmbeddedIdTicketNumber(Long ticketNumber);
	List<Passenger> findByEmbeddedId_TicketNumberOrderByEmbeddedId_SerialNumber(Long ticketNumber);
    List<Passenger> findAllByOrderByEmbeddedId_TicketNumberAsc();
}