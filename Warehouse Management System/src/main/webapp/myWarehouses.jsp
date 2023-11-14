<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<%@ include file="../footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WORKING WAREHOUSES</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">WORKING WAREHOUSES<i class="fa fa-institution"></i></div>
<%String msg=request.getParameter("msg");
if("added".equals(msg))
{%>
<h3 class="alert">Product added successfully!</h3>
<% } %>
<%
if("exist".equals(msg))
{%>

<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%} %>
<%
if("invalid".equals(msg))
{%>

<h3 class="alert">Something Went Wrong ! Try Again</h3>
<%} %>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">TYPE</th>
            <th scope="col">RENT PERIOD</th>
            <th scope="col">AVAILABLE CAPACITY</th>
            <th scope="col"> CATEGORY</th>
            <th scope="col">AVAILABLE GOODS <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%         
 try
{
	Connection con=ConnectionProvider.getCon(); 
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from warehouses where active='Yes' and email='"+email+"'");
	while(rs.next())
	{
%>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getString(6) %></td>
            <td> <%=rs.getString(7) %></td>
            <td><a href="availableGoods.jsp?id=<%= rs.getString(1) %>">AVAILABLE GOODS <i class='fas fa-cart-plus'></i></a></td>
          </tr>
          <%}
	}
	catch(Exception e)
	{
		out.print(e);
	}%>

        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>