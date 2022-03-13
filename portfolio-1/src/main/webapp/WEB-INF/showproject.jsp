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
<title>Joy Bundler Names</title>
</head>
<body>
	<div class="d-flex justify-content-between align-items-center py-2 px-5 bg-secondary">
        <h1 class="text-warning">${project.firstName}</h1>
        <a href="/dashboard" class="btn btn-info bg-danger">Go Back</a>
    </div>
    <hr>
    <main class="d-flex justify-content-around">
    	<div class="col-10 bg-dark text-light">
    		<p>(added by ${project.creator.userName})</p>
	    	<p>Gender:  ${project.gender}</p>
			<p>Origin:  ${project.origin}</p>
			<c:if test="${project.creator.id == userId}">
				<a href="/names/edit/${project.id }">EDIT</a>
			</c:if>
    	</div>
    </main>
        
    
	
</body>
</html>