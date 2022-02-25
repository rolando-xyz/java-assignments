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
        <a href="/ninjas/new" class="btn btn-info bg-danger">New Ninja</a>
    </div>
    <hr>
    <main class="d-flex justify-content-around">
        <div class="col-10 bg-dark text-light">
            <h2 class="text-center">New Dojo</h2>
            <hr class="bg-info">
            <div class="d-flex flex-row justify-content-between card bg-dark my-2">
            	<form:form action="/dojos/new" method="POST" modelAttribute="dojo">
					<div>
						<form:label path="name">Name:</form:label>
						<form:errors path="name"/>
						<form:input path="name"/>
					</div>
					<input type="submit" value="SUBMIT"/>
				</form:form>
                <table>
				    <thead>
				        <tr>
				            <th>Dojo</th>
				        </tr>
				    </thead>
				    <tbody>
						<c:forEach var="d" items="${dojos }">
							<tr>
								<td><a href="/dojos/show/${d.id }">${d.getName() }</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
            </div>
        </div>
    </main>
</body>
</html>
