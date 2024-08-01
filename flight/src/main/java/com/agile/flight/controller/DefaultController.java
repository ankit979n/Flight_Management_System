package com.agile.flight.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {
    @RequestMapping("/default")
    public String defaultAfterLogin(HttpServletRequest request) {
        if (request.isUserInRole("admin")) {
            return "redirect:/adminIndex";
        } else if (request.isUserInRole("customer")) {
            return "redirect:/customerIndex";
        } else {
            return "redirect:/login?error=Unknown user type.";
        }
    }
}
