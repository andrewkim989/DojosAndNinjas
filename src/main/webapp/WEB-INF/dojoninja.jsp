<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>${dojo.name}</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: rgb(153, 153, 255);
			padding: 25px;
			padding-left: 30px;
			padding-bottom: 40px;
		}
		h1 {
			text-align: center;
		}
		table {
			border: 1px solid black;
			border-collapse: collapse;
			margin: auto;
			margin-top: 30px;
		}
		th {
			text-align: left;
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px;
			padding-left: 10px;
			padding-right: 170px;
			background-color: rgb(66, 244, 223);
			font-size: 18px;
		}
		tr td {
			border: 1px solid black;
			border-collapse: collapse;
			padding: 10px;
			background-color: rgb(237, 241, 248);
			font-size: 18px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>${dojo.name}</h1>
		<table>
		    <thead>
		        <tr>
		            <th>First Name</th>
		            <th>Last Name</th>
		            <th>Age</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items = "${dojo.getNinjas()}" var = "ninja">
		        <tr>
		            <td>${ninja.firstName}</td>
		            <td>${ninja.lastName}</td>
		            <td>${ninja.age}</td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
	</div>
</body>
</html>