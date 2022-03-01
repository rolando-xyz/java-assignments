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
        <h1 class="text-info">Create a Course</h1>
    </div>
</head>
<body>
	<hr>
    <main class="d-flex justify-content-around">
    	<div class="col-10 bg-dark text-light">
    		<h1>New Course</h1>
			<form:form action="/courses/new/course" method="post" modelAttribute="course">
			<form:hidden path="student" value="${userId }"/>
				<div>
					<form:label path="name">Name:</form:label>
					<form:errors path="name"/>
					<form:input path="name"/>
				</div>
				<div>
					<form:label path="weekday">Day of the week:</form:label>
					<form:errors path="weekday"/>
					<form:input path="weekday"/>
				</div>
				<div>
					<form:label path="price">Drop-in price:</form:label>
					<form:errors path="price"/>
					<form:input path="price"/>
				</div>
				<div>
					<form:label path="time">Time:</form:label>
					<form:errors path="time"/>
					<form:input path="time"/>
				</div>
				<div>
					<form:label path="description">Description:</form:label>
					<form:errors path="description"/>
					<form:textarea path="description"/>
				</div>
				<input type="submit" value="SUBMIT"/>
			</form:form>
			<a href="/dashboard" class="btn btn-info bg-light">Cancel</a>
        </div>
    </main>
</body>
</html>