<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Requests Accepted</title>
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
<%--  <link rel="stylesheet" href="acceptedCss.css">--%>
  <script type="text/javascript">
  	function reply_click(clicked_id)	{
  		var slides = document.getElementsByClassName("blocks");
		for(var i = 0; i < slides.length; i++)	{
			slides[i].style.display = "none";
		}
	    document.getElementById("b"+clicked_id).style.display = "block";
	}

  	window.onload = function() {
  		document.getElementsByClassName("blocks")[0].style.display = "block";
	}
  </script>
</head>
<body>
	<div class="container-fluid menutop">
		<div class="row bg-secondary" style="margin-right: 0px;">
			<div class="col-sm-12">
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="margin-right: -15px">
					<a class="navbar-brand" href="#">
						<img src="https://user-images.githubusercontent.com/39495857/165233943-cb6d9760-57d8-42b6-b9b5-bbc58db73df8.jpeg
" width="35" height="35" class="d-inline-block align-top img-thumbnail" alt="">
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
  
	<div class="container-fluid" style="">
		<div class="row">
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
						<button type="button" class="btn btn-dark btn-block">MY ACCEPTED REQUESTS</button>
					</a>
				</div>
			</div>

	    	<div class="col-sm-10 bg-secondary">
				<div class="row bg-dark" style="height: 89vh; margin-top: 3.5px; margin-bottom:3.5px">
					<div class="col-sm-1"></div>
					<div class="col-sm-2 bg-light" style="height: 89vh; overflow-y: scroll; padding:10px;">
						<c:if test="${not empty grouprequests}">
							<c:forEach items="${grouprequests}" var="group">
								<button type="button" class="btn btn-dark btn-block" style="" onClick="reply_click(this.id)" id="${group.key.getId()}">
							 		${group.key.getName()} <span class="badge badge-light">-</span>
								</button>
							</c:forEach>
						</c:if>
					</div>
					<div class="col-sm-8 bg-light" style="height: 89vh; overflow-y: scroll; margin-left: 5px; padding: 10px;">
					    <c:if test="${not empty grouprequests}">
							<c:forEach items="${grouprequests}" var="group">				    
							    <div class="blocks" id="${'b'}${group.key.getId()}" style="display: none">
							    	<div class="row groupmainspacing">
								    	<button type="button" class="btn btn-dark btn-block">
									 		${group.key.getName()}
										</button>
									</div>
									
										<c:forEach items="${group.value}" var="request">
										<div class="row groupmainspacing">
										<div class="media border border-dark rounded-lg" style="padding: 5px; width:100%">
										    <div class="media-body" style="word-break: break-all;">
										    	<h6 class="font-weight-bold" style="margin-bottom: 5px;">${request.getRequestbyname()}<small style="float: right; font-size: 12px"><i>${request.getCreatedate()}</i></small></h6>
										    	<span style="font-size: 13px;">${request.getRequestmsg()}</span>
										    	<div style="float: right">
											        <form name="chat" method="POST" action="/chat/chat">
											        	<input type='hidden' id='chatid' name='chatid' value='${request.getChatmaps().get(0).getChatid()}'/>
											        	<input type='hidden' id='valid' name='valid' value='true'/>
											        	<button type="submit" class="btn btn-outline-dark btn-sm">
											 				Open Chat
														</button>
														<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
													</form>
										    	</div>
										    </div>
										</div>
										</div>
										</c:forEach>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<div class="col-sm-1"></div>
				</div>  
			</div>
		</div>
	</div>
</body>
</html> 