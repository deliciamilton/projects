<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%

String email=session.getAttribute("email").toString();
String type=request.getParameter("typeOfWarehouse");
String password=request.getParameter("password");
int check=0;
try
{
	Connection con=ConnectionProvider.getCon(); 
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rs.next())
	{
		check=1;
		st.executeUpdate("update users set TypeOfWarehouse='"+type+"' where email='"+email+"'");
		response.sendRedirect("changeTypeOfWarehouse.jsp?msg=success");
	}
	if(check==0)
	{
		response.sendRedirect("changeTypeOfWarehouse.jsp?msg=invalid");
		
	}
	
	
}
	catch(Exception e)
{
	out.println(e);
	
}
%>
