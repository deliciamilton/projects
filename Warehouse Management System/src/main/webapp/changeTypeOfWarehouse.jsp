<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="changeDetailsHeader.jsp" %>
<%@ include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("success".equals(msg))
{
%>

<h3 class="alert">Your security Question successfully changed !</h3>
<% } %>
<%

if("invalid".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<% } %>

<% %>
<form action="changeTypeOfWarehouseAction.jsp" method="post">
<h3>Select Your New Type of Warehosue</h3>
 <select class="input-style" name="typeOfWarehouse">
 <option value="rooftop">ROOFTOP</option>
 <option value="retail">RETAIL</option>
 <option value="local">LOCAL</option>
 
 </select>
 
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="password" name="password" placeholder="Enter your password">
<hr>
 <button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>