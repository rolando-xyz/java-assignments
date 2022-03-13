package com.rolando.portfolio.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginUser {
	
	@NotEmpty(message="email is required")
	@Email(message="please enter valid email")
	private String email;
	
	@NotEmpty(message="password is required")
	@Size(min=8, max=100, message="password must be between 8 and 100 characters")
	private String password;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}