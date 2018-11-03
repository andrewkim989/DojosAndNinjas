<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Create Ninja</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: rgb(153, 153, 255);
			padding: 25px;
			padding-left: 30px;
			height: 650px;
			color: rgb(0, 51, 153);
		}
		input[type = submit] {
			font-size: 20px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>New Ninja</h1>
		<br>
		<form:form action = "/ninjas/new/process" method = "post" modelAttribute = "ninja">
			<form:label path = "dojo">Dojo: </form:label>
			<form:select path = "dojo">
				<c:forEach items = "${dojos}" var = "dojo">
					<form:option value = "${dojo}">${dojo.name}</form:option>
				</c:forEach>
			</form:select>
			<br><br>
			<p><form:errors path = "firstName"/></p>
			<form:label path = "firstName">First Name: </form:label>
			<form:input path = "firstName"/><br><br>
			<form:label path = "lastName">Last Name: </form:label>
			<form:input path = "lastName"/><br><br>
			<p><form:errors path = "age"/></p>
			<form:label path = "age">Age: </form:label>
			<form:input path = "age"/><br><br>
			<input type = "submit" value = "Create">
		</form:form>
	</div>
</body>
</html>