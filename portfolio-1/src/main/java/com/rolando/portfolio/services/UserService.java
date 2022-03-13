package com.rolando.portfolio.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.rolando.portfolio.models.LoginUser;
import com.rolando.portfolio.models.User;
import com.rolando.portfolio.repositories.UserRepository;

@Service
public class UserService {
	
		@Autowired
		private UserRepository userRepo;
	
	public User register(User newUser, BindingResult result) {
		Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
		
		if(potentialUser.isPresent()) {
			result.rejectValue("email", "unique", "This email is already in use!");
		}
		
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "The confirmed password does not match");
		}
		
		if(result.hasErrors()) {
			return null;
		}
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		return userRepo.save(newUser);
	}
	
	public User login(LoginUser newLoginObject, BindingResult result) {
		
		Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
		
		if(!potentialUser.isPresent()) {
			result.rejectValue("email", "unique", "Unknown email");
			return null;
		}
		User user = potentialUser.get();
		if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "invalid password");
		}
		if(result.hasErrors()) {
			return null;
		}
		return user;
	}
	
	public User getUser(Long id) {
		Optional<User> user = userRepo.findById(id);
		if(user.isPresent()) {
			return user.get();
		}
		else {
			return null;
		}
	}
}