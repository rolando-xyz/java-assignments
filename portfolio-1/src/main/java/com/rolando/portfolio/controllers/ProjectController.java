package com.rolando.portfolio.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.rolando.portfolio.models.Project;
import com.rolando.portfolio.models.User;
import com.rolando.portfolio.services.ProjectService;
import com.rolando.portfolio.services.UserService;

@Controller
public class ProjectController {
	
     @Autowired
     private UserService userService;
     
     @Autowired
     private ProjectService projectService;
    
    @GetMapping("/projects/new")
    public String projectIndex(@ModelAttribute("project") Project project,HttpSession session,Model model) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
    	User user = userService.getUser((Long)session.getAttribute("userId"));
    	model.addAttribute("user", user);
    	return "newproject.jsp";
    }
    
    @PostMapping("/projects/new/project")
    public String newProject(@Valid @ModelAttribute("project") Project project,BindingResult result) {
        if(result.hasErrors()) {
            return "newproject.jsp";
        }
        else {
        	projectService.createOneProject(project);
            return "redirect:/dashboard";
        }
    }
    
    @GetMapping("/projects/{id}")
    public String showProject(@PathVariable("id") Long id, Model model, HttpSession session) {
        if(session.getAttribute("userId")==null) {
            return "redirect:/";
        }
        Project project = projectService.getProject(id);
        model.addAttribute("project", project);
        User user = userService.getUser((Long)session.getAttribute("userId"));
        model.addAttribute("user",user);
        return "showproject.jsp";
    }
    
    @GetMapping("/projects/edit/{id}")
	public String edit(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		Project project = projectService.getProject(id);
		model.addAttribute("project", project);
		return "editproject.jsp";
	}
    
    @PutMapping("/projects/edit/{id}")
	public String update(@PathVariable("id")Long id, @Valid @ModelAttribute("project")Project project, BindingResult result,  HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		if(result.hasErrors()) {
			return "editproject.jsp";
		}else {
			projectService.updateProject(project);
			return "redirect:/dashboard";
		}
	}
	
	@DeleteMapping("/projects/delete/{id}")
	public String destroy(@PathVariable("id")Long id, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		projectService.deleteProject(id);
		return "redirect:/dashboard";
	}
    
}