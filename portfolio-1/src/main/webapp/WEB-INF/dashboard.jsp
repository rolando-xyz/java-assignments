<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/dashboard.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Llama Capital</title>
</head>
<body>
	<header>
		<div>
		    <div class="d-flex justify-content-between align-items-center py-2 px-5 bg-secondary">
		    	<div class="menu-button">
					<div class="menu-button-burger"></div>
			    </div>
			    <div>
			    	<img src="/images/group 6.png" alt="User Logo" width="40" height="40">
			    </div>
		        <div class="d-flex justify-content-between align-items-center">
		        	<input type="text">
			        <a href="/logout" class="btn btn-info bg-danger">Log out</a>
	          		<img src="/images/group 6.png" alt="User Logo" width="40" height="40">
			    </div>
		    </div>
		</div>
	</header>
	<main class="bg-warning">
		
	    <h2 class="text-dark">Baby Names</h2>
	    <div class="d-flex justify-content-around">
	    <hr>
	    <table>
	    <thead>
	        <tr>
	            <th>First name</th>
	            <th>Gender</th>
	            <th>Origin</th>
	        </tr>
	    </thead>
	    <tbody>
			<c:forEach var="x" items="${project }">
				<tr>
					<td><a href="/names/${x.id }">${x.getTitle()}</a></td>
					<td> ${x.getDescription() }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	    </div>
	    <a href="/projects/new" class="btn btn-info bg-success">New name</a>
	</main>
	<footer class="fixed-bottom">
		<div>
		    <div class="d-flex justify-content-between align-items-center py-2 px-5 bg-secondary">
		    	<div class="menu-button bg-dark">
					<div class="menu-button-burger"></div>
			    </div>
			    <div>
			    	<img src="/images/group 6.png" alt="User Logo" width="40" height="40">
			    </div>
		        <div class="d-flex justify-content-between align-items-center">
		        	<input type="text">
			        <a href="/logout" class="btn btn-info bg-danger">Log out</a>
	          		<img src="/images/group 6.png" alt="User Logo" width="40" height="40">
			    </div>
		    </div>
		</div>
	</footer>
	
    
</body>
</html>