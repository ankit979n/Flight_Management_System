package com.agile.flight.controller;

import com.agile.flight.bean.Airport;

import com.agile.flight.bean.Flight;
import com.agile.flight.bean.Route;
import com.agile.flight.bean.Ticket;
import com.agile.flight.exception.FlightNotFoundException;
import com.agile.flight.exception.RouteException;
import com.agile.flight.repository.AirportRepository;
import com.agile.flight.repository.FlightRepository;
import com.agile.flight.repository.RouteRepository;
import com.agile.flight.service.FlightService;
import com.agile.flight.service.RouteService;
import com.agile.flight.service.TicketService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicLong;

@Controller
public class RouteFlightController {

    @Autowired
    private RouteRepository routeRepository;

    @Autowired
    private RouteService routeService;

    @Autowired
    private AirportRepository airportRepository;

    @Autowired
    private FlightRepository flightRepository;

    @Autowired
    private FlightService flightService;
    
    /*
    @GetMapping("/")
	public String home() {
		return "index";
	}
	
    
    @GetMapping("/index")
    public String showIndexPage() {
        return "index";
    }
    */

    @GetMapping("/airportadd")
    public String showAirportAdditionPage(Model model) {
        model.addAttribute("airport", new Airport());
        return "airportAddition";
    }

    @PostMapping("/airportadd")
    public String addAirport(@ModelAttribute("airport") Airport airport) {
    	airport.setAirportCode(airport.getAirportCode().toUpperCase());
        airport.setAirportLocation(airport.getAirportLocation().toUpperCase());
        airportRepository.save(airport);
        return "redirect:/airportall";
    }

    @GetMapping("/airportall")
    public String showAllAirportsPage(Model model) {
        List<Airport> airportList = airportRepository.findAll();
        model.addAttribute("airportList", airportList);
        return "allAirports";
    }
    
    @GetMapping("/airportEnquiry")
    public String showAirportEnquiryPage(@RequestParam("airportCode") String airportCode,
                                         @RequestParam("airportLocation") String airportLocation,
                                         Model model) {
        model.addAttribute("airportCode", airportCode);
        model.addAttribute("airportLocation", airportLocation);
        return "airportEnquirypage";
    }


    @GetMapping("/routeadd")
    public String showRouteAdditionPage(Model model) {
        List<Airport> airportList = airportRepository.findAll();
        model.addAttribute("airportList", airportList);
        model.addAttribute("route", new Route());
        return "routeAddition";
    }

    @PostMapping("/routeadd")
    public String addRoute(@ModelAttribute("route") Route route) {
    	if (route.getSourceAirportCode().equalsIgnoreCase(route.getDestinationAirportCode())) {
            throw new RouteException("Source Airport Code and Destination Airport Code can't be the same.");
        }

    	route.setSourceAirportCode(route.getSourceAirportCode().toUpperCase());
        route.setDestinationAirportCode(route.getDestinationAirportCode().toUpperCase());
        route.setRouteId(routeService.generateRouteId());
        routeRepository.save(route);
        Route returnRoute = routeService.createReturnRoute(route);
        routeRepository.save(returnRoute);
        return "redirect:/routeall";
    }

    @GetMapping("/routeall")
    public String showAllRoutesPage(Model model) {
        List<Route> routeList = routeRepository.findAll();
        model.addAttribute("routeList", routeList);
        return "allRoutes";
    }
    
 // New method to show the edit page
    @GetMapping("/routeedit/{routeId}")
    public String showEditRoutePage(@PathVariable("routeId") Long routeId, Model model) {
    	 Route route = routeService.findByRouteId(routeId);
         if (route == null) {
             throw new RouteException("Route not found.");
         }
         model.addAttribute("route", route);
         List<Airport> airportList = airportRepository.findAll();
         model.addAttribute("airportList", airportList);
         return "routeEdit";
    }

    // New method to handle the update request
    @PostMapping("/routeupdate")
    public String updateRoute(@ModelAttribute("route") Route route) {
    	if (route.getSourceAirportCode().equalsIgnoreCase(route.getDestinationAirportCode())) {
            throw new RouteException("Source Airport Code and Destination Airport Code can't be the same.");
        }

        route.setSourceAirportCode(route.getSourceAirportCode().toUpperCase());
        route.setDestinationAirportCode(route.getDestinationAirportCode().toUpperCase());
        routeRepository.save(route);
        return "redirect:/routeall";
    }

    // New method to handle the delete request
    @GetMapping("/routedelete/{routeId}")
    public String deleteRoute(@PathVariable("routeId") Long routeId) {
    	 routeRepository.deleteById(routeId);
         return "redirect:/routeall";
    }

    @GetMapping("/flightadd")
    public String showAddFlightPage(Model model) {
        List<Route> routeList = routeRepository.findAll();
        model.addAttribute("routeList", routeList);
        model.addAttribute("flight", new Flight());
        return "addFlight";
    }

    @PostMapping("/flightadd")
    public String addFlight(@ModelAttribute("flight") Flight flight,
                            @RequestParam("returnDeparture") String returnDeparture,
                            @RequestParam("returnArrival") String returnArrival, Model model) {
        flightRepository.save(flight);
        Flight returnFlight = flightService.createReturnFlight(flight, returnDeparture, returnArrival);
        flightRepository.save(returnFlight);
        
   
       return "redirect:/flightresults";
    }
    
    @GetMapping("/flightedit/{flightNumber}")
    public String showEditFlightPage(@PathVariable Long flightNumber, Model model) {
        Flight flight = flightService.findByFlightNumber(flightNumber);
        model.addAttribute("flight", flight);
        return "editFlight"; // JSP page for editing the flight
    }

    @PostMapping("/flightedit")
    public String editFlight(@ModelAttribute("flight") Flight flight) {
        flightRepository.save(flight); // Save the updated flight
        return "redirect:/flightresults"; // Redirect to the flight results page
    }

    @GetMapping("/flightdelete/{flightNumber}")
    public String deleteFlight(@PathVariable Long flightNumber) {
        flightRepository.deleteById(flightNumber);
        return "redirect:/flightresults"; // Redirect to the flight results page
    }


    @GetMapping("/flightsearch")
    public String showSearchFlightPage(Model model) {
    	List<String> airportLocations = airportRepository.findAllAirportLocations();
        model.addAttribute("airportLocations", airportLocations);
        return "searchFlight";
    }

    @PostMapping("/flightsearch")
    public ModelAndView searchFlights(@RequestParam("fromCity") String fromCity,
                                      @RequestParam("toCity") String toCity) {
    	// Fetch the airport codes by location
        String fromAirportCode = airportRepository.findAirportCodeByLocation(fromCity);
        String toAirportCode = airportRepository.findAirportCodeByLocation(toCity);

        // Log debug information
        System.out.println("From Airport Code: " + fromAirportCode);
        System.out.println("To Airport Code: " + toAirportCode);

        // Check if from and to airports are different
        if (fromAirportCode == null || toAirportCode == null) {
            throw new FlightNotFoundException("Invalid airport location(s) provided.");
        }

        if (fromAirportCode.equalsIgnoreCase(toAirportCode)) {
            throw new FlightNotFoundException("From-City & To-City cannot be the same.");
        }

        // Find the route by source and destination airport codes
        Optional<Route> optionalRoute = routeRepository.findBySourceAirportCodeAndDestinationAirportCode(fromAirportCode, toAirportCode);
        if (!optionalRoute.isPresent()) {
            throw new FlightNotFoundException("Route not found between the specified cities.");
        }

        // Fetch the flights for the found route
        Route route = optionalRoute.get();
        List<Flight> flightList = flightRepository.findByRouteId(route.getRouteId());
        
        if (flightList.isEmpty()) {
            throw new FlightNotFoundException("No flights available for the specified route.");
        }

        // Prepare the ModelAndView for the result page
        ModelAndView mv = new ModelAndView("routeFlightShowPage");
        mv.addObject("flightList", flightList);
        mv.addObject("fromAirport", fromCity);
        mv.addObject("toAirport", toCity);
        mv.addObject("fair", route.getFair());
        return mv;
    }
    
    
    @GetMapping("/flightresults")
    public String showAllFlights(Model model) {
        List<Flight> flightList = flightRepository.findAll();
        model.addAttribute("flights", flightList);
        return "flightResults";
    }
    
    //for customer
    @GetMapping("/flightresultsC")
    public String showAllFlightsC(Model model) {
        List<Flight> flightList = flightRepository.findAll();
        model.addAttribute("flights", flightList);
        return "flightResultsC";
    }
   
    @ExceptionHandler(RouteException.class)
    public ModelAndView handleRouteException(RouteException exception) {
        ModelAndView mv = new ModelAndView("routeErrorPage");
        mv.addObject("errorMessage", exception.getMessage());
        return mv;
    }
    
    @ExceptionHandler(FlightNotFoundException.class)
    public ModelAndView handleFlightNotFoundException(FlightNotFoundException exception) {
        ModelAndView mv = new ModelAndView("ErrorPage");
        mv.addObject("errorMessage", exception.getMessage());
        return mv;
    }
}
