package com.rolando.beltexam.models;


import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="username required")
	@Size(min=2, max=30, message="username must be between 2 and 30 characters")
	private String userName;
	
	@NotEmpty(message="email required")
	@Size(min=2, max=30, message="enter valid email")
	private String email;
	
	@NotEmpty(message="password required")
	@Size(min=8, max=100, message="password must be between 8 and 100 characters")
	private String password;
	
	@NotEmpty(message="confirm password required")
	@Size(min=8, max=100, message="confirm password must be between 8 and 100 characters")
	private String confirm;

	@OneToMany(mappedBy="student", fetch = FetchType.LAZY)
    private List<Course> courses;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

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

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	
	
}