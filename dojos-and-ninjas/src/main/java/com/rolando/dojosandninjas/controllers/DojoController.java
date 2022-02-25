package com.rolando.dojosandninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.rolando.dojosandninjas.models.Dojo;
import com.rolando.dojosandninjas.models.Ninja;
import com.rolando.dojosandninjas.services.DojoService;
import com.rolando.dojosandninjas.services.NinjaService;

@Controller
public class DojoController {
	
	@Autowired
	private DojoService dojoService;
	
	@Autowired
	private NinjaService ninjaService;
	
	
	@GetMapping("/dojos/new")
	public String index(@ModelAttribute("dojo") Dojo dojo, Model model) {
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		return "newdojo.jsp";
	}
	
	@PostMapping("/dojos/new")
	public String create(@Valid @ModelAttribute("dojos") Dojo dojo, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Dojo> dojos = dojoService.allDojos();
			model.addAttribute("dojos", dojos);
			return "newdojo.jsp";
		}
		else {
			dojoService.createDojo(dojo);
			return "redirect:/dojos/new";
		}
	}
	
	@GetMapping("/ninjas/new")
	public String createNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
//		List<Ninja> ninjas = ninjaService.allNinjas();
//		model.addAttribute("ninjas", ninjas);
		
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		return "newninja.jsp";
	}
	
	@PostMapping("/ninjas/new")
	public String postMethodNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result) {
		if (result.hasErrors()) {
			return "newninja.jsp";
		}
		else {
			// if its successful save to the database
			ninjaService.createNinja(ninja);
			return "redirect:/dojos/new";
		}
	}
	
	@GetMapping("/dojos/show/{id}")
	public String showOne(@PathVariable("id") Long id, Model model) {
		Dojo dojo = dojoService.findDojo(id);
		
		model.addAttribute("dojo", dojo);
		return "showdojo.jsp";
	}
}