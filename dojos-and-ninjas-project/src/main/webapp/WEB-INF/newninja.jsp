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
    		<h1>New Ninja</h1>
			<form:form action="/ninjas/new" method="post" modelAttribute="ninja">
				<div>
					<form:label path="dojo">Dojo:</form:label>
					<form:errors path="dojo"/>
					<form:select path="dojo">
						<c:forEach var="d" items="${dojos }">
								<option value="${d.id }">${d.name }</option>
							</c:forEach>
					</form:select>
				</div>
				<div>
					<form:label path="firstName">First Name:</form:label>
					<form:errors path="firstName"/>
					<form:input path="firstName"/>
				</div>
				<div>
					<form:label path="lastName">Last Name:</form:label>
					<form:errors path="lastName"/>
					<form:input path="lastName"/>
				</div>
				<div>
					<form:label path="age">Name:</form:label>
					<form:errors path="age"/>
					<form:input path="age"/>
				</div>
				<input type="submit" value="SUBMIT"/>
			</form:form>
        </div>
    </main>
        
    
	
	
</body>
</html>