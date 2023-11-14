<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="adminHeader.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Payment</title>

</head>
<body>
<br>
<table>
<thead>
<%
String wid=request.getParameter("id");
int total=0;
int sno=0;
int pay=0;
try
{
	Connection con=ConnectionProvider.getCon(); 
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from goods where w_id='"+wid+"'");
	while(rs1.next())
	{
		total=rs1.getInt(1);
	}
%>

          <tr>
          <th scope="col"><a href="myCart"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
        <% 
        ResultSet rs=st.executeQuery("select * from product inner join goods on product.id=goods.p_id and goods.w_id='"+wid+"'");
       while(rs.next())
       {
    	   
       
        %>
        
          <tr>
          <% sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%= rs.getString(4) %></td>
            <td><%= rs.getString(8) %> </td>
            <td><i class="fa fa-inr"></i><%= rs.getString(10) %> </td>
            </tr>
         <% }
            String mail="";
            ResultSet rs2=st.executeQuery("select * from warehouses where id='"+wid+"'");
            while(rs2.next())
            {
            	mail=rs2.getString(2);
            }
            ResultSet rs3=st.executeQuery("select * from users where email='"+mail+"'");
            while(rs3.next())
            {
            	
            
            	
       %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="sendMoneyAction.jsp" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
<input class="input-style" type="text" name="address" value="<%=rs3.getString(5) %>" placeholder="Enter address" required>
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=rs3.getString(8) %>" placeholder="Enter City" required>

</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rs3.getString(9) %>" placeholder="Enter State" required>
</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="Enter" placeholder="Enter country" required>
</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<input class="input-style" type="hidden" name="wid" value="<% out.println(wid); %>">
<div class="left-div">


<hr style="width: 100%">

<h3>Amount to be Paid</h3>
<input class="input-style" type="text" name="amount" value="<% out.println(total); %>" placeholder="Enter Amount to be PAid">
<h3 style="color: red">*Dont Change the Amount</h3>
 
</div>

<div class="right-div">
<h3>Enter the Payment Date(DD-MM-YYYY)</h3>
<input class="input-style" type="text" name="paymentDate" placeholder="Enter the date of Payment">
<h3 style="color: red"></h3>
</div>

<hr style="width: 100%">

<div class="left-div">
<h3>Select way of Payment</h3>
<select class="input-style" type="text" name="paymentMethod">
  <option value="Cash On Delivery(COD)">Cash On Delivery(COD)</option>
  <option value="Online Payment">Online Payment</option>
  </select>
 
</div>

<div class="right-div">
<h3>Pay online on this Jenish@pay.com</h3>
<input class="input-style" type="text" name="transactionID" placeholder="Enter Transaction ID">
<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>

<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="mobileNumber" value="<%=rs3.getString(3)%>" placeholder="Enter Mobile Number" required>
<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button" type="submit">Proceed<i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
            }
}
catch(Exception e){
	out.print(e);
}%>

      <br>
      <br>
      <br>

</body>
</html>