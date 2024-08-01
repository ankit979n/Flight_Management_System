package com.agile.flight.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(RouteException.class)
    public ModelAndView handleRouteException(RouteException ex) {
        ModelAndView mv = new ModelAndView("routeErrorPage");
        mv.addObject("errorMessage", ex.getMessage());
        return mv;
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView handleException(Exception ex) {
        ModelAndView mv = new ModelAndView("routeErrorPage");
        mv.addObject("errorMessage", "An unexpected error occurred during flight search. Please try again.");
        return mv;
    }
}
