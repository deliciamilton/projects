<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String email=String.valueOf(session.getAttribute("email"));
String id=request.getParameter("id");
String type=request.getParameter("type");
String address=request.getParameter("address");
String period=request.getParameter("period");
String capacity=request.getParameter("capacity");
String category=request.getParameter("category");
String active=request.getParameter("active");

try
{
	Connection con=ConnectionProvider.getCon(); 
	PreparedStatement ps=con.prepareStatement("insert into warehouses values(?,?,?,?,?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,email);
	ps.setString(3,type);
	ps.setString(4,address);
	ps.setString(5,period);
	ps.setString(6,capacity);
	ps.setString(7,category);
	ps.setString(8,active);
	
	ps.executeUpdate();
	response.sendRedirect("addNewWarehouse.jsp?msg=done");
}
catch(Exception e)
{
	out.println(e);
	response.sendRedirect("addNewWarehouse.jsp?msg=invalid");
}
%>