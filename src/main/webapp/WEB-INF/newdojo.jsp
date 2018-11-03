<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Create a Dojo</title>
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
			font-size: 23px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>New Dojo</h1>
		<br>
		<form:form action = '/dojos/new/process' method = 'post' modelAttribute = "dojo">
			<p><form:errors path = "name"/></p>
			<form:label path = "name"><h4>Dojo name:</h4> </form:label>
			<form:input path = "name"/><br><br>
			<input type = "submit" value = "Create">
		</form:form>
	</div>
</body>
</html>