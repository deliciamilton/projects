<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%

String product_id=request.getParameter("id");
String warehouse_id=String.valueOf(session.getAttribute("wid"));
int quantity=1;
int product_price=0;
int product_total=0;
int good_total=0;
int z=0;

try
{
	   Connection con=ConnectionProvider.getCon();
	   Statement st=con.createStatement();
	   ResultSet rs=st.executeQuery("select * from product where id='"+product_id+"'");
	   while(rs.next())
	   {
		   product_price=rs.getInt(4);
		   product_total=product_price;
		   
	   }
	   ResultSet rs1=st.executeQuery("select * from goods where p_id='"+product_id+"' and w_id='"+warehouse_id+"'");
	   while(rs1.next())
	   {
		   good_total=rs1.getInt(5);
		   good_total=good_total+product_total;
		   quantity=rs1.getInt(3);
		   quantity=quantity+1;
		   z=1;
		   
	   }
	   if(z==1)
	   {
		   st.executeUpdate("update goods set total='"+good_total+"',quantity='"+quantity+"' where p_id="+product_id+" and w_id='"+warehouse_id+"'");
	       response.sendRedirect("allWarehouses.jsp?msg=exist");
	   }
	   else
	   {
		   PreparedStatement ps=con.prepareStatement("insert into goods(w_id,p_id,quantity,price,total) value(?,?,?,?,?)");
		   ps.setString(1,warehouse_id);
		   ps.setString(2,product_id);
		   ps.setInt(3,quantity);
		   ps.setInt(4,product_price);
		   ps.setInt(5,product_total);
		   ps.executeUpdate();
		   response.sendRedirect("allWarehouses.jsp?msg=added");
		   
		  
		   
	   }
}
catch(Exception e)
{
	out.print(e);
	response.sendRedirect("allWarehouses.jsp?msg=invalid");
}
%>