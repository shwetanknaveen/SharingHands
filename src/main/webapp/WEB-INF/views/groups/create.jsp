<!DOCTYPE html>
<html lang="en">
<head>
  <title>Create Group</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<style>
		.menutop		{
			padding: 0px;
			/*margin-right: 0px;*/
			/*overflow: hidden;*/
		}

		.sidebarleft	{
			/*height: 100vh;*/
		}

		.sidebarleft .btn	{
			margin-top: 20px;
		}

		.requestform	{
			margin-top: 10px;
			padding: 10px;
			padding-bottom: 0px;
		}

		.requestbutton	{
			margin-left: 5px;
		}

		.checkboxlabel	{
			margin: 0px;
			padding-left: 20px;
			padding-right: 0px;
			height: 45px;
			overflow: hidden;
			overflow-y: scroll;
			word-break: break-all;
		}

		.badge-secondary	{
			font-size: 15px;
			background-color: #404040;
		}

		.blocks	{
			height: 100%;
			width: 100%;
		}

		.groupmainspacing	{
			margin-left: 10px;
			margin-right: 5px;
			margin-bottom: 10px
		}
		/************************  home.jsp  *************************/

		/************************  chat.jsp  *************************/
		.chathead	{
			font-size: 23px;
			margin-top: 5px;
			margin-left: 5px;
		}

		.chatheadlabel 	{
			width: 20%;
		}

		.badgelabel	{
			font-size: 18px;
			margin-left: 5px;
			color: black;
		}

		.chatspacing	{
			margin: 0px;
			margin-right: -10px;
			margin-bottom: 5px;
		}
	</style>
<%--	<link rel="stylesheet" href="createCss.css">--%>
</head>
<body>
	<div class="container-fluid menutop" style="10vh">
		<div class="row bg-secondary" style="margin-right: 0px;">
			<div class="col-sm-12">
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="margin-right: -15px">
					<a class="navbar-brand" href="#">
						<img src="https://user-images.githubusercontent.com/39495857/165233943-cb6d9760-57d8-42b6-b9b5-bbc58db73df8.jpeg" width="35" height="35" class="d-inline-block align-top img-thumbnail" alt="">
						Sharing Hand
					</a>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<div class="dropdown">
							<button type="button" class="btn btn-info dropdown-toggle .btn-sm" data-toggle="dropdown">
							Settings
							</button>
							<div class="dropdown-menu dropdown-menu-right" >
								<!--<a class="dropdown-item" href="#">My Profile</a>
								<a class="dropdown-item" href="#">Change Password</a>
								<div class="dropdown-divider"></div>-->
								<form action="/logout" method="post">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            						<input class="dropdown-item" type="submit" value="Sign Out"/>
        						</form>
							</div>
						</div>
					</li>
				</ul>
				</nav>
			</div> 
		</div> 
	</div>
  
	<div class="container-fluid" style="height: 90vh">
		<div class="row" style="height: 100%">
			<div class="col-sm-2 bg-light sidebarleft">
				<div class="nav flex-sm-column text-body">
					<a href="/home">
						<button type="button" class="btn btn-dark btn-block">HOME</button>
					</a>
					<a href="/groups/create">
						<button type="button" class="btn btn-dark btn-block">CREATE GROUP</button>
					</a>
					<a href="/myrequests">
						<button type="button" class="btn btn-dark btn-block">MY REQUESTS</button>
					</a>
					<a href="/requestacceptedbyme/accepted">
						<button type="button" class="btn btn-dark btn-block">REQUESTS ACCEPTED BY ME</button>
					</a>
				</div>
			</div>

	    	<div class="col-sm-10 bg-secondary">
	    		<div class="row">
	    			<div class="col-sm-2"></div>
	    			<div class="col-sm-8 bg-light rounded" style="margin: 20px; padding: 10px; text-align: center;">
	    				<div style="font-size: 30px; font-weight: bold;">CREATE GROUP</div>
						<div style="font-size: 15px; font-weight: bold; color: red; margin-bottom: 50px">${message}</div>
	    				<form name="group" method="POST" action="/groups/create">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">Group Name</span>
								</div>
								<input type="text" name="name" class="form-control">
							</div>

							<div class="input-group mb-3">
								<textarea class="form-control" name="description" style="height: 20vh" placeholder="Group Description"></textarea>
							</div>

							<div class="mb-3">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<input type="submit" class="btn btn-dark" style="width: 25%; font-weight: bolder" name="submit" value="SUBMIT">
							</div>
						</form> 
	    			</div>
	    			<div class="col-sm-2"></div>
	    		</div>
			</div>
		</div>
	</div>
</body>
</html> 