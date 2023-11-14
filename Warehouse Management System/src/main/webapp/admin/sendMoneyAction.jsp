<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
String wid=request.getParameter("wid");
String amount=request.getParameter("amount");
String ddate=request.getParameter("paymentDate");
String method=request.getParameter("paymentMethod");
String tid=request.getParameter("transactionID");

try
{
	Connection con=ConnectionProvider.getCon(); 
	PreparedStatement ps=con.prepareStatement("insert into wpay values(?,?,?,?,?)");
	ps.setString(1,wid);
	ps.setString(2,amount);
	ps.setString(3,ddate);
	ps.setString(4,method);
	ps.setString(5,tid);
	ps.executeUpdate();
	response.sendRedirect("allWarehouses.jsp?msgse=done");
}
catch(Exception e)
{
	response.sendRedirect("allWarehouses.jsp?msgse=invalid");
}
%>