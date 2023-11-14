<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
String id=request.getParameter("id");
String status="No";


try
{
	Connection con=ConnectionProvider.getCon(); 
	Statement st=con.createStatement();
	
	
	st.executeUpdate("update warehouses set active='"+status+"' where id='"+id+"'");
		
	response.sendRedirect("allWarehouses.jsp?msgr=done");
}
catch(Exception e)
{
	response.sendRedirect("allWarehouses.jsp?msgr=wrong");
}
%>