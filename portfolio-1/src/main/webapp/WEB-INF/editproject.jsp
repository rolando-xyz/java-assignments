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
        <h1 class="text-warning">Change ${project.title}</h1>
    </div>
</head>
<body>
	<hr>
    <main class="d-flex justify-content-around">
    	<div class="col-10 bg-dark text-light">
			<form:form action="/projects/edit/${project.id }" method="post" modelAttribute="project" class="py-5">
			<input type="hidden" name="_method" value="put"/>
			<form:hidden path="creator" value="${project.creator.id }"/>
				<div>
					<form:label path="title">Name:</form:label>
					<form:errors path="title"/>
					<form:input path="title"/>
				</div>
				<div>
					<form:label path="description">Meaning:</form:label>
					<form:errors path="description"/>
					<form:input path="description"/>
				</div>
				<input type="submit" value="SUBMIT"/>
			</form:form>
			<a href="/dashboard" class="btn btn-info bg-light">Cancel</a>
			<form action="/projects/delete/${project.id }" method="post">
				<input type="hidden" name="_method" value="delete">
				<input type="submit" value="DELETE" class="bg-danger">
			</form>
        </div>
    </main>
</body>
</html>