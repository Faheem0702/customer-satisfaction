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
<style type="text/css">
<!--
.style3 {font-size: 24px; color: #FF0000; }
.style4 {color: #FF0000}
.style8 {font-size: 24px}
.style9 {color: #FFFFFF}
-->
</style>
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
<h1 align="center">The Customer Paid Details </h1>
</div>
<div id="bodymiddlePan">
       
	   
	   <iframe src="Results.jsp" height="400" width="600"></iframe>
	   
	   
	   <p class="style4">&nbsp;</p>
	   <p class="style4">&nbsp;</p>
	   <p class="style4"></p>
	   <p class="style4">
	   <%

	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0,pay=0,sum=0;

      	try 
	{
        
          
      		
      		 
      		
      		String query="select * from apms_owner"; // where cname='"+clo+"' "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		
	pay=Integer.parseInt(rs.getString(9));	
	sum=sum+pay;

	   }
	  
	  out.print("TOTAL PROFIT="+sum);
	  
	  
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
            e.printStackTrace();
          }
%>

	   
	   
	   
	   </p>
	   <p>&nbsp;</p>
	   <p>&nbsp; </p>
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
