<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Yoga Classes</title>
</head>
<body>
	<div class="d-flex justify-content-between align-items-center py-2 px-5 bg-secondary">
        <h1 class="text-info">View Yoga Class</h1>
        <a href="/dashboard" class="btn btn-info bg-danger">Go Back</a>
    </div>
    <hr>
    <main class="d-flex justify-content-around">
    	<div class="col-10 bg-dark text-light">
    		<h1>${course.name }</h1>
	    	<p>Day:  ${course.weekday}</p>
			<p>Cost:  ${course.price}</p>
			<p>${course.description}</p>
    	</div>
    </main>
        
    
	
</body>
</html>