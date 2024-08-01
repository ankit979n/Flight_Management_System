package com.agile.flight.service;

import com.agile.flight.bean.Route;
import com.agile.flight.repository.RouteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

import javax.annotation.PostConstruct;

@Service
public class RouteService {

    @Autowired
    private RouteRepository routeRepository;

    private Long nextRouteId;

    @PostConstruct
    public void init() {
        Long maxRouteId = routeRepository.findMaxRouteId();
        if (maxRouteId == null) {
            nextRouteId = 101L;
        } else {
            nextRouteId = (maxRouteId % 2 == 0) ? maxRouteId + 1 : maxRouteId + 2;
        }
    }

    public synchronized Long generateRouteId() {
        Long currentRouteId = nextRouteId;
        nextRouteId += 2;
        return currentRouteId;
    }

    public Route createReturnRoute(Route route) {
        Route returnRoute = new Route();
        returnRoute.setRouteId(route.getRouteId() + 1);
        returnRoute.setSourceAirportCode(route.getDestinationAirportCode());
        returnRoute.setDestinationAirportCode(route.getSourceAirportCode());
        returnRoute.setFair(route.getFair());
        return returnRoute;
    }
    
    public Route findByRouteId(Long routeId) {
        Optional<Route> routeOptional = routeRepository.findByRouteId(routeId);
        return routeOptional.orElse(null);
    }
}
