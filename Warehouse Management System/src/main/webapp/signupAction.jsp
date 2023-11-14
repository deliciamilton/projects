<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String name=request.getParameter("name");
out.print(name);
String email=request.getParameter("email");

String mobileNumber=request.getParameter("mobilenumber");
String tow=request.getParameter("tow");
String adress=request.getParameter("adress");
String ssize=request.getParameter("ssize");
String password=request.getParameter("password");
String city="";
String state="";
try
{
	 Connection con=ConnectionProvider.getCon();
	 PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?)");
	 ps.setString(1,name);
	 ps.setString(2,email);
	 ps.setString(3,mobileNumber);
	 ps.setString(4,tow);
	 ps.setString(5,adress);
	 ps.setString(6,ssize);
	 ps.setString(7,password);
	 ps.setString(8,city);
	 ps.setString(9,state);

	 ps.executeUpdate();
	 response.sendRedirect("signup.jsp?msg=valid");
	 
	 
}
catch(Exception e){
	out.print(e);
	response.sendRedirect("signup.jsp?msg=invalid");
	
	}
%>

