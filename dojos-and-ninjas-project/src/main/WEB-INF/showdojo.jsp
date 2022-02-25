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
<title>Dojos and Ninjas</title>
</head>
<body>
	<div class="d-flex justify-content-between align-items-center py-2 px-5 bg-secondary">
        <h1 class="text-info">Dojos and Ninjas</h1>
        <a href="/dojos/new" class="btn btn-info bg-danger">Go Back</a>
    </div>
    <hr>
    <main class="d-flex justify-content-around">
    	<div class="col-10 bg-dark text-light">
    		<h2>Location Ninjas</h2>
			<table>
			    <thead>
			        <tr>
			            <th>First Name</th>
			            <th>Last Name</th>
			            <th>Age</th>
			        </tr>
			    </thead>
			    <tbody>
					<c:forEach var="ninja" items="${dojo.ninjas}">
						<tr>
							<td><c:out value="${ninja.firstName}"></c:out></td>
							<td><c:out value="${ninja.lastName}"></c:out></td>
							<td><c:out value="${ninja.age}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
    	</div>
    </main>
        
    
	
</body>
</html>
