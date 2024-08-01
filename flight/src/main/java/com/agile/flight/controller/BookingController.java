package com.agile.flight.controller;

import com.agile.flight.bean.Passenger;
import com.agile.flight.bean.Ticket;
import com.agile.flight.bean.TicketPassengerEmbed;
import com.agile.flight.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class BookingController {

    @Autowired
    private TicketService ticketService;

    @GetMapping("/bookTicket")
    public String showBookingPage(Model model, @RequestParam Long flightNumber, @RequestParam String carrierName,
                                  @RequestParam String fromCity, @RequestParam String toCity, @RequestParam Double fair, @RequestParam Long routeId) {
        Ticket ticket = new Ticket();
        ticket.setTicketNumber(ticketService.generateTicketNumber());
        ticket.setFlightNumber(flightNumber);
        ticket.setCarrierName(carrierName);
        ticket.setRouteId(routeId);
        ticket.setTotalAmount(fair);  // Setting totalAmount correctly

        model.addAttribute("ticket", ticket);
        model.addAttribute("fromCity", fromCity);
        model.addAttribute("toCity", toCity);
        model.addAttribute("fair", fair);

        // Prepopulate passenger names and DOBs for the form
        model.addAttribute("passengerNames", new String[]{"", "", "", "", "", ""});
        model.addAttribute("passengerDOBs", new String[]{"", "", "", "", "", ""});

        return "bookingPage";
    }

    @PostMapping("/bookTicket")
    public String bookTicket(@ModelAttribute("ticket") Ticket ticket,
                             @RequestParam("name") String[] names,
                             @RequestParam("dob") String[] dobs, @RequestParam("fromCity") String fromCity,
                             @RequestParam("toCity") String toCity,
                             Model model) {
        List<Passenger> passengers = new ArrayList<>();
        for (int i = 0; i < names.length; i++) {
            if (!names[i].isEmpty() && !dobs[i].isEmpty()) {  // Check if name and DOB are not empty
                Passenger passenger = new Passenger();
                TicketPassengerEmbed embeddedId = new TicketPassengerEmbed();
                embeddedId.setTicketNumber(ticket.getTicketNumber());
                embeddedId.setSerialNumber(i + 1);
                passenger.setEmbeddedId(embeddedId);
                passenger.setPassengerName(names[i]);
                passenger.setPassengerDOB(dobs[i]);
                passenger.setFair(ticketService.discountedFareCalculation(ticket.getTotalAmount(), dobs[i]));
                passengers.add(passenger);
            }
        }
        
        if (!ticketService.capacityCalculation(passengers.size(), ticket.getFlightNumber())) {
            model.addAttribute("error", "Not enough seats available for this booking.");
            return "bookingPage";
        }

        Ticket bookedTicket = ticketService.bookTicket(ticket, passengers);
        
        model.addAttribute("ticket", bookedTicket);
        model.addAttribute("passengers", passengers);
        model.addAttribute("fromCity", fromCity);
        model.addAttribute("toCity", toCity);

        return "bookingConfirmation";
    } 
    
    @PostMapping("/cancelTicket")
    public String cancelTicket(@RequestParam("ticketNumber") Long ticketNumber, Model model) {
        boolean success = ticketService.cancelTicket(ticketNumber);
        if (success) {
            model.addAttribute("message", "Ticket cancelled successfully.");
        } else {
            model.addAttribute("message", "Ticket cancellation failed.");
        }
        return "cancellationResult";
    }
    
    @GetMapping("/passengerDetails")
    public String showPassengerDetails(@RequestParam(required = false) Long ticketNumber, Model model) {
        List<Passenger> passengers;
        if (ticketNumber != null) {
            passengers = ticketService.getPassengersByTicketNumber(ticketNumber);
        } else {
            passengers = ticketService.getAllPassengers();
        }
        model.addAttribute("passengers", passengers);
        return "passengerDetails";
    }

    @GetMapping("/ticketsBooked")
    public String showTicketsBooked(Model model) {
        List<Ticket> tickets = ticketService.getAllTickets();
        model.addAttribute("tickets", tickets);
        return "ticketsBooked";
    }
    
    //for customer:
    @GetMapping("/passengerDetailsC")
    public String showPassengerDetailsC(@RequestParam(required = false) Long ticketNumber, Model model) {
        List<Passenger> passengers;
        if (ticketNumber != null) {
            passengers = ticketService.getPassengersByTicketNumber(ticketNumber);
        } else {
            passengers = ticketService.getAllPassengers();
        }
        model.addAttribute("passengers", passengers);
        return "passengerDetailsC";
    }

    @GetMapping("/ticketsBookedC")
    public String showTicketsBookedC(Model model) {
        List<Ticket> tickets = ticketService.getAllTickets();
        model.addAttribute("tickets", tickets);
        return "ticketsBookedC";
    }
    
    @PostMapping("/cancelTicketC")
    public String cancelTicketC(@RequestParam("ticketNumber") Long ticketNumber, Model model) {
        boolean success = ticketService.cancelTicket(ticketNumber);
        if (success) {
            model.addAttribute("message", "Ticket cancelled successfully.");
        } else {
            model.addAttribute("message", "Ticket cancellation failed.");
        }
        return "cancellationResultC";
    }
}
