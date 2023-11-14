
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="loginAction.jsp" method="post">
         <input type="email" name="email" placeholder="Enter your mail">
         <input type="password" name="password" placeholder="Enter your Password">
         <input type="submit" value="login">
      </form>
      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  
  <%
  String msg= request.getParameter("msg");
  if("notexist".equals(msg))
  {
  %>
  
  <h1>Incorrect Username or Password</h1>
  <% } %>
  <%if("invalid".equals(msg))
	  {%>
<h1>Some thing Went Wrong! Try Again !</h1>
  <% } %>
    <h2>DEPOSITORY SYSTEMIZATION</h2>
    <p>The depository systemization is the application that allows the retail unit or users to monitor warehouse movements and rent local warehouses.</p>
  </div>
</div>

</body>
</html>