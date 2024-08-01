/*package com.agile.flight.service;

import com.agile.flight.bean.FlightUser;
import com.agile.flight.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        FlightUser flightUser = userRepository.findByUsername(username);
        if (flightUser == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return User.builder()
                .username(flightUser.getUsername())
                .password(flightUser.getPassword())
                .roles(flightUser.getUserType())
                .build();
    }
}
*/