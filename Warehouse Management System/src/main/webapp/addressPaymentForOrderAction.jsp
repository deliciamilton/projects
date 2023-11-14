<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String mobilenumber=request.getParameter("mobileNumber");
String paymentMethod=request.getParameter("paymentMethod");
String transactionId="";
transactionId=request.getParameter("transactionID");
String status="bill";

try
{
      Connection con=ConnectionProvider.getCon();
      PreparedStatement ps=con.prepareStatement("update users set adress=?,city=?,state=?,mobileNumber=? where email=?");
      ps.setString(1,address);
      ps.setString(2,city);
      ps.setString(3,state);
      ps.setString(4,mobilenumber);
      
      ps.setString(5,email);
      ps.executeUpdate();
      PreparedStatement ps2=con.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobileNumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY),paymentMethod=?,transactionId=?,status=? where email=? and address is NULL");
      ps2.setString(1,address);
      ps2.setString(2,city);
      ps2.setString(3,state);
      ps2.setString(4,country);
      ps2.setString(5,mobilenumber);
      ps2.setString(6,paymentMethod);
      ps2.setString(7,transactionId);
      ps2.setString(8,status);
      ps2.setString(9,email);
      ps2.executeUpdate();

      
      response.sendRedirect("bill.jsp");

      
      
      

}
catch(Exception e)
{
    out.print(e);
}
%>