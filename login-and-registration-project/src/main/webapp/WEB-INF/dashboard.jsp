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
        <h1 class="text-info">Welcome! ${name.userName}</h1>
        <a href="/logout" class="btn btn-info bg-danger">LOGOUT</a>
    </div>
    <hr><h2 class="text-primary">Register</h2>
    <div class="d-flex justify-content-around">
        <p>This is your dashboard. Nothing to see here yet.</p>
    </div>
</body>
</html>