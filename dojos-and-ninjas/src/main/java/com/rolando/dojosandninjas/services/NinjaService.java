package com.rolando.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rolando.dojosandninjas.models.Ninja;
import com.rolando.dojosandninjas.repositories.NinjaRepository;

@Service
public class NinjaService {

	@Autowired
	private NinjaRepository repo;
	
	public List<Ninja> allNinjas(){
		return repo.findAll();
	}
	
	public Ninja createNinja(Ninja ninja) {
		return repo.save(ninja);
	}
	
	public Ninja findNinja(Long id) {
		Optional<Ninja> ninja = repo.findById(id);
		if (ninja.isPresent()) {
			return ninja.get();
		}
		else {
			return null;
		}
	}
	
	public Ninja updateNinja(Ninja ninja) {
		return repo.save(ninja);
	}
	
	public void deleteNinja(Long id) {
		repo.deleteById(id);
	}
}
