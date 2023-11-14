<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp" method="post">
    <input type="text" name="name" placeholder="Enter Name" required>
    <input type="email" name="email" placeholder="Enter Email" required>
    <input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required>

    
 
 
    <input type="text" name="adress" placeholder="Enter Address" required>
    <input type="text" name="ssize" placeholder="Enter Aadhar Number" required>
    
    <input type="password" name="password" placeholder="Enter Password" required>
    <input type="submit" value="signup">
    
    
     </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
  
 <%
 String msg=request.getParameter("msg");
 if("valid".equals(msg))
 {
 %>
<h1>Successfully registered</h1>
<% } %>

<% if("invalid".equals(msg))
{ %>
<h1>Some thing Went Wrong! Try Again !</h1>
 <% } %>
    <h2>WAREHOUSE RENTING</h2>
    <p>The Warehouse Automation is the application that allows the users to locally rent the warehouse and monitor daily warehouse activites.</p>
  </div>
</div>

</body>
</html>