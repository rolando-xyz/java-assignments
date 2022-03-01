package com.rolando.beltexam.controllers;

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

import com.rolando.beltexam.models.Course;
import com.rolando.beltexam.models.User;
import com.rolando.beltexam.services.CourseService;
import com.rolando.beltexam.services.UserService;

@Controller
public class CourseController {
	
     @Autowired
     private UserService userService;
     
     @Autowired
     private CourseService courseService;
    
    @GetMapping("/courses/new")
    public String courseIndex(@ModelAttribute("course") Course course,HttpSession session,Model model) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
    	User user = userService.getUser((Long)session.getAttribute("userId"));
    	model.addAttribute("name", user);
    	return "newcourse.jsp";
    }
    
    @PostMapping("/courses/new/course")
    public String newCourse(@Valid @ModelAttribute("course") Course course,BindingResult result) {
        if(result.hasErrors()) {
            return "newcourse.jsp";
        }
        else {
        	courseService.createOneCourse(course);
            return "redirect:/dashboard";
        }
    }
    
    @GetMapping("/courses/{id}")
    public String showCourse(@PathVariable("id") Long id, Model model, HttpSession session) {
        if(session.getAttribute("userId")==null) {
            return "redirect:/";
        }
        Course course = courseService.getCourse(id);
        model.addAttribute("course", course);
        User user = userService.getUser((Long)session.getAttribute("userId"));
        model.addAttribute("user",user);
        return "showcourse.jsp";
    }
    
    @GetMapping("/courses/edit/{id}")
	public String edit(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		Course course = courseService.getCourse(id);
		model.addAttribute("course", course);
		return "editcourse.jsp";
	}
    
    @PutMapping("/courses/edit/{id}")
	public String update(@PathVariable("id")Long id, @Valid @ModelAttribute("course")Course course, BindingResult result,  HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		if(result.hasErrors()) {
			return "editcourse.jsp";
		}else {
			courseService.updateCourse(course);
			return "redirect:/dashboard";
		}
	}
	
	@DeleteMapping("/courses/delete/{id}")
	public String destroy(@PathVariable("id")Long id, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		courseService.deleteCourse(id);
		return "redirect:/dashboard";
	}
    
}