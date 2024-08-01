package com.agile.flight.repository;

import com.agile.flight.bean.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface TicketRepository extends JpaRepository<Ticket, Long> {
    
    @Query("SELECT MAX(t.ticketNumber) FROM Ticket t")
    Long findMaxTicketNumber();
}