package com.rolando.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rolando.dojosandninjas.models.Dojo;
import com.rolando.dojosandninjas.repositories.DojoRepository;

@Service
public class DojoService {
	
	@Autowired
	private DojoRepository repo;
	
	public List<Dojo> allDojos(){
		return repo.findAll();
	}
	
	public Dojo createDojo(Dojo dojo) {
		return repo.save(dojo);
	}
	
	public Dojo findDojo(Long id) {
		Optional<Dojo> dojo = repo.findById(id);
		if (dojo.isPresent()) {
			return dojo.get();
		}
		else {
			return null;
		}
	}
	
	public Dojo updateDojo(Dojo dojo) {
		return repo.save(dojo);
	}
	
	public void deleteDojo(Long id) {
		repo.deleteById(id);
	}
}
