<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="adminHeader.jsp" %>
<%@ include file="../footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ALL WAREHOUSES</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">ALL WAREHOUSES<i class="fa fa-institution"></i></div>
<%String msg=request.getParameter("msg");
if("added".equals(msg))
{%>
<h3 class="alert">Product Sent to Godown!</h3>
<% } %>
<%
if("exist".equals(msg))
{%>

<h3 class="alert">Product already exist in you Godown! Quantity  increased!</h3>
<%} %>
<%
if("invalid".equals(msg))
{%>

<h3 class="alert">Something Went Wrong ! Try Again</h3>
<%} %>
<%String msgr=request.getParameter("msgr");
if("done".equals(msgr))
{%>
<h3 class="alert">Warehouse Successfully Removed!</h3>
<% } %>
<%
if("wrong".equals(msgr))
{%>

<h3 class="alert">Something went wrong!</h3>
<%} %>
<%String msgse=request.getParameter("msgse");
if("done".equals(msgse))
{%>
<h3 class="alert">MONEY SUCCESSFULLY SENT</h3>
<% } %>
<%
if("invalid".equals(msgse))
{%>

<h3 class="alert">Something went wrong!</h3>
<%} %>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            
            <th scope="col">EMAIL</th>
            
  
           
            <th scope="col"> CATEGORY</th>
            <th scope="col"> PAY</th>
            <th scope="col">SEND PRODUCTS <i class='fas fa-cart-plus'></i></th>
            <th scope="col">REMOVE <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%         
 try
{
	Connection con=ConnectionProvider.getCon(); 
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from warehouses where active='Yes'");
	while(rs.next())
	{
%>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
         
   
         
            <td> <%=rs.getString(7) %></td>
             <td><a href="sendMoney.jsp?id=<%= rs.getString(1) %>">SEND MONEY <i class='fas fa-cart-plus'></i></a></td>
            
            <td><a href="sendProductsAction.jsp?wid=<%= rs.getString(1) %>">SEND PRODUCTS<i class='fas fa-cart-plus'></i></a></td>
            
            
            <td><a href="removeWarehouse.jsp?id=<%= rs.getString(1) %>">REMOVE <i class='fas fa-cart-plus'></i></a></td>
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