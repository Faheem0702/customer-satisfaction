<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>View Jobs</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="header_container">
<div id="header"><a
	href="http://all-free-download.com/free-website-templates/"><img
	src="images/logo.gif" alt="Total Management" title="Total Management"
	border="0" /></a>
  <ul>
	  <li><a href="jobSch.jsp">JobScheduler </a> </li>
      <li><a href="schv.jsp">SLAScheduler</a></li>
	    <li><a href="ViewCSFil.jsp">ViewFiles</a></li>
	        <li><a href="ViewTransaction.jsp">ViewTransaction</a></li>
            <li><a href="ViewJobsNSla.jsp">ViewsJobs&amp;SLA</a></li>
            <li class="aboutus"><a href="index.html">Log Out</a></li>
	
    
    </ul>
<h1>Profit Maximization Scheme</h1>
</div>
</div>
<div id="body1"><br />
<h1 align="center">The SLA Period and No Of Jobs in Clouds</h1>
</div>
<div id="bodymiddlePan">
       <table  border="1" align="center">
  <tr>
   <td ><div align="center"><span class="style3">Cloud Name </span></div></td>
      <td ><div align="center"><span class="style3">SLA Activation Time  </span></div></td>     
      <td ><div align="center"><span class="style3">SLA Expiry Time  </span></div></td>     
      <td ><div align="center"><span class="style3">Jobs  </span></div></td>     
  </tr>
    <tr>
   <td ></td>
      <td ></td>     
      <td ></td>     
  </tr>
<%
	
	String s1="",s2="",s3="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0,s4;

      	try 
	{
      		
       
      		 
      		
      		String query="select * from apms_slaj"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		s1=rs.getString(1);
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getInt(4);
		

		%>

<tr>
	<td height="29">
	<div align="center"><%=s1%></div>
	</td>
	<td>
	<div align="center"><%=s2%></div>
	</td>
	<td>
	<div align="center"><%=s3%></div>
	</td>
	<td>
	<div align="center"><%=s4%></div>
	</td>
	
</tr>


<%
	   }
	  
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
</table>

<h3><a href="CloudScheMain.jsp">back</a></h3>
</div>
<div id="bodyBottomPan">
<div id="infoPan">
<h2>more info</h2>
<p>customer satisfaction; multiserver system</p>
<p class="view"><a href="#">view</a></p>
</div>
<div id="servicesPan">
<h2>Cloud SLAs</h2>
<p>service-level<br />
agreement</p>
<p class="view"><a href="#">view</a></p>
</div>
<div id="schedulePan">
<h2>schedule</h2>
<p>job scheduler are used in each VMs</p>
<p class="view"><a href="#">view</a></p>
</div>
</div>

</body>
</html>
