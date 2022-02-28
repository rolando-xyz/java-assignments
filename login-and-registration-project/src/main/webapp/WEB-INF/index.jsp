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
<title>Login and Registration</title>
</head>
<body>
	<div class="d-flex justify-content-between align-items-center py-2 px-5 bg-secondary">
        <h1 class="text-info">Welcome!</h1>
    </div>
    <p>Join our growing community</p>
    <hr>
    <h2 class="text-primary">Register</h2>
    <div class="d-flex justify-content-around">
        <form:form action="/register" method="post" modelAttribute="newUser">
			<div>
				<form:label path="userName">Username:</form:label>
				<form:errors path="userName"/>
				<form:input path="userName"/>
			</div>
			<div>
				<form:label path="email">Email:</form:label>
				<form:errors path="email"/>
				<form:input path="email"/>
			</div>
			<div>
				<form:label path="password">Password:</form:label>
				<form:errors path="password"/>
				<form:password path="password"/>
			</div>
			<div>
				<form:label path="confirm">Confirm Password:</form:label>
				<form:errors path="confirm"/>
				<form:password path="confirm"/>
			</div>
			<input type="submit" value="SUBMIT"/>
		</form:form>
		<form:form action="/login" method="post" modelAttribute="newLogin">
			<div>
				<form:label path="email">Email:</form:label>
				<form:errors path="email"/>
				<form:input path="email"/>
			</div>
			<div>
				<form:label path="password">Password:</form:label>
				<form:errors path="password"/>
				<form:password path="password"/>
			</div>
			<input type="submit" value="SUBMIT"/>
		</form:form>
    </div>
</body>
</html>