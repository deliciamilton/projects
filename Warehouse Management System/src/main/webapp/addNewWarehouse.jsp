<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<%@ include file="../footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/addNewProduct-style.css">
<title>Add New Warehouse</title>
</head>
<body>
<%
   String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>

<h3 class="alert">Warehouse Added Successfully!</h3>
<% } %>

<%
   
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<% } %>

<%
  int id=1;
  try{
	  Connection con=ConnectionProvider.getCon(); 
	  Statement st=con.createStatement();
	  ResultSet rs=st.executeQuery("select max(id) from warehouses");
	  while(rs.next())
	  {
		  id=rs.getInt(1);
		  id=id+1;
	  }
  }
  catch(Exception e)
  {
	  
  }
%>

<form action="addNewWarehouseAction.jsp" method="post">

<h3 style="color: yellow;">Warehouse ID: <%out.println(id); %> </h3>
<input type="hidden" name="id" value="<%out.println(id);%>">



<div class="left-div">
 <h3>Enter Type of Warehouse</h3>
 <input class="input-style" type="text" name="type" placeholder="Enter type of Warehouse" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Address</h3>
 <input class="input-style" type="text" name="address" placeholder="Enter your Warehouse Address" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Period of rent</h3>
<input class="input-style" type="number" name="period" placeholder="Enter period of rent(in months)" required>
 <hr>
</div>

<div class="right-div">
<h3>Enter the capacity</h3>
<input class="input-style" type="number" name="capacity" placeholder="Enter capacity(in dimension)" required>
 <hr>
</div>

<div class="left-div">
<h3>Enter Category Of product</h3>
<input class="input-style" type="text" name="category" placeholder="Enter category of Products" required>
 <hr>
</div>

<div class="right-div">
<h3>Active</h3>
 <select class="input-style" name="active">
 <option value="Yes">Yes </option>
 <option value="No">No </option>
 </select>
   
<hr>
</div>
 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>












