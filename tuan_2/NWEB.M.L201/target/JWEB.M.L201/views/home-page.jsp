<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"
	name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Home Page</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark"> <a
		class="navbar-brand" href="#"><i class="fa fa-home"></i> Home Page</a>

	<div id="navbarNavDropdown" class="navbar-collapse collapse">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="#"
				id="addEmpLink">Add</a></li>
			<li class="nav-item"><a class="nav-link" id="listEmpsLink"
				href="#">List</a></li>

		</ul>

		<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a class="nav-link" style="color: yellow"
				href="#"><i class="fa fa-user-circle-o"></i>
					${userLogin.userName}</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/logout"><i
					class="fa fa-user-times"></i> Logout</a></li>
		</ul>
	</div>
	</nav>


	<div class="container">
		<br />
		<h4>Welcome to Employee Management System</h4>
	</div>


	<div class="row fixed-bottom"
		style="border-top: 1px solid #ccc; background-color: #222">
		<div class="col-md-12">
			<p style="margin: 10px auto; text-align: center; color: #ccc">&copy;
				Copyright Fresher Academy 2018</p>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$("#addEmpLink").click(function() {
				$.get({
					url : "/JavaWeb_P_L002/add-emp",
					success : function(response) {
						$(".container").html(response);
					}
				});
			});

			$("#listEmpsLink").click(function() {
				$.get({
					url : "/JavaWeb_P_L002/list-employees",
					success : function(response) {
						$(".container").html(response);
					}
				});
			});
			
			
		});
	</script>
</body>
</html>


