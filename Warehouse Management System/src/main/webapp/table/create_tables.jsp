<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
try
{
  Connection con=ConnectionProvider.getCon();
  Statement st=con.createStatement();
  String q1="create table users(name varchar(100),email varchar(100)primary key,mobileNumber bigint,TypeOfWarehouse varchar(200),adress varchar(200),ssize bigint,password varchar(100),city varchar(100),state varchar(100))";
  String q2="create table product(id int,name varchar(500),category varchar(200),price int,active varchar(10))";
  String q3="create table cart(email varchar(200),product_id int,quantity int,price int,total int,address varchar(500),city varchar(100),state varchar(100),country varchar(100),mobileNumber bigInt,orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
  String q4="create table message(id int AUTO_INCREMENT,email varchar(100),subject varchar(200),body varchar(1000),PRIMARY KEY(id))";
  String q5="create table warehouses(id int primary key,email varchar(200),type varchar(200),address varchar(500),period varchar(100),capacity varchar(200),category varchar(200),active varchar(10))";
  String q6="create table goods(w_id int,p_id int,quantity int,price int,total int,deliveryDate varchar(100),active varchar(10))";
  String q7="create table wpay(w_id int,amount int,paymentDate varchar(100),paymentMethod varchar(100),transID varchar(50))";
  
  //st.execute(q1);
  //st.execute(q2);
 // st.execute(q3);
 // st.execute(q4);
 // st.execute(q5);
  //st.execute(q6);
  st.execute(q7);
  out.print("table created");
  con.close();
  }
 catch(Exception e)
 {
	 out.print(e);
 }
 %>