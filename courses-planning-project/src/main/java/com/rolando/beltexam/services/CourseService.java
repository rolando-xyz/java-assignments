package com.rolando.beltexam.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rolando.beltexam.models.Course;
import com.rolando.beltexam.repositories.CourseRepository;

@Service
public class CourseService {
	
	@Autowired
	private CourseRepository courseRepository;
	
	public List<Course> allCourses(){
		return courseRepository.findAll();
	}
	
	public Course getCourse(Long id) {
		Optional<Course> optionalCourse = courseRepository.findById(id);
		if(optionalCourse.isPresent()) {
			return optionalCourse.get();
		}
		else {
			return null;
		}
	}
	
	public Course createOneCourse(Course book) {
		return courseRepository.save(book);
	}
	
	public Course updateCourse(Course book) {
		return courseRepository.save(book);
	}
	
	public void deleteCourse(Long id) {
		courseRepository.deleteById(id);
	}
}