package com.agile.flight.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.agile.flight.bean.FlightUser;
import com.agile.flight.repository.UserRepository;
import com.agile.flight.service.UserService;

@Controller
public class UserRegistrationController {

	@Autowired
	private UserService userService;
	
	@Autowired
    private UserRepository userRepository;
	
	 @Autowired
	 private PasswordEncoder passwordEncoder;

	

	@GetMapping("/index")
	public String showIndexPage() {
		return "index";
	}

	/*
	@GetMapping("/")
	public String showLoginPage() {
		return "login";
	}
*/
	@GetMapping("/login")
	public String showLoginPage(Model model, @RequestParam(value = "error", required = false) String error) {
		if (error != null) {
			model.addAttribute("errorMessage", "Invalid email or password.");
		}
		return "login";
	}

	@PostMapping("/login")
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model) {
		System.out.println("Login attempt with email: " + email); // Debugging statement

		FlightUser user = userRepository.findByEmail(email);
	    
	    if (user != null) {
	    	System.out.println("User found: " + user.getEmail()); // Debugging statement
	       // BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	        if (passwordEncoder.matches(password, user.getPassword())) {
	            String userType = user.getUserType();
	            System.out.println("User type: " + userType); // Debugging statement

	            if ("admin".equalsIgnoreCase(userType)) {
	                return "redirect:/adminIndex";
	            } else if ("customer".equalsIgnoreCase(userType)) {
	                return "redirect:/customerIndex";
	            } else {
	                model.addAttribute("error", "Unknown user type.");
	                return "login";
	            }
	        } else {
	            model.addAttribute("error", "Invalid email or password.");
	            return "login";
	        }
	    } else {
	        model.addAttribute("error", "Invalid email or password.");
	        return "login";
	    }
	}


	@GetMapping("/registration")
	public String showregistrationForm(Model model) {
		model.addAttribute("user", new FlightUser());
		return "registration";
	}

	@PostMapping("/registration")
	public String registerregistration(@ModelAttribute("user") FlightUser user, Model model) {
		if (userService.emailExists(user.getEmail())) {
			model.addAttribute("errorMessage", "Email already exists.");
			return "registration";
		}
		userService.save(user);
		return "redirect:/login"; // Redirect to login page after successful registration
	}
	
	 @GetMapping("/loginerror")
	    public String loginError(Model model) {
	        model.addAttribute("loginError", true);
	        return "loginerror";
	    }
	 
	 
	@GetMapping("/customerIndex")
	public String showCoustomerIndexPage() {
		return "customerIndex";
	}
	
	@GetMapping("/adminIndex")
	public String showAdminIndexPage() {
		return "adminIndex";
	}

}
