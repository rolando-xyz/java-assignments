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
        <h1 class="text-info">Namaste, ${name.userName}.</h1>
        <a href="/logout" class="btn btn-info bg-danger">LOGOUT</a>
    </div>
    <p>Course Schedule</p>
    <hr>
    <h2 class="text-primary">Dashboard</h2>
    <div class="d-flex justify-content-around">
       <table>
    <thead>
        <tr>
            <th>Class Name</th>
            <th>Instructor</th>
            <th>Weekday</th>
            <th>Price</th>
            <th>Time</th>
        </tr>
    </thead>
    <tbody>
		<c:forEach var="b" items="${courses}">
			<tr>
				<td><a href="/courses/${b.id }">${b.getName() }</a>
				<c:if test="${b.student.id == userId}">
					<a href="/courses/edit/${b.id }">EDIT</a>
				</c:if>
				</td>
				<td> ${b.getStudent().userName }</td>
				<td> ${b.getWeekday() }</td>
				<td> ${b.getPrice() }</td>
				<td> ${b.getTime() }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
    </div>
    <a href="/courses/new" class="btn btn-info bg-info">New Course</a>
</body>
</html>