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
<title>View Transactions</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style3 {color: #00FFFF}
.style4 {color: #FFFF33}
.style5 {color: #CC99CC}
-->
</style>
</head>
<body>

<%
String clo=(String)application.getAttribute("cns");


%>
<div id="header_container">
<div id="header"><a
	href="http://all-free-download.com/free-website-templates/"><img
	src="images/logo.gif" alt="Total Management" title="Total Management"
	border="0" /></a>
   <ul>
	<li><a href="createvm.jsp?">CreateVM </a></li>
	<li><a href="ViewCloudFiles.jsp">RecievedFiles</a></li>
	<li><a href="ViewVm.jsp">ViewAllVM</a></li>
	<li><a href="ViewOwners.jsp">ViewDataOwners</a></li>
	<li><a href="ViewAttackers.jsp">ViewsJobs&amp;SLA</a></li>
	<li><a href="ViewTransact.jsp">ViewTransactions</a></li>
	<li class="aboutus"><a href="index.html">Log Out</a></li>

</ul>
<h1>Profit Maximization Scheme</h1>
</div>
</div>
<div id="body1"><br />
<h1 align="center" class="style3">View Transaction Details!!!</h1>
</div>
<div id="bodymiddlePan">




  	 <form id="form1" name="form1" method="post" action="ViewTransact.jsp">
<table width="598" border="0" align="center">
<p>&nbsp;</p><p>&nbsp;</p>
	<tr>
		<td class="style4">Enter Cloud Name :-</td>
		<td><select id="s1"	name="cname" class="text">
		  <option>--Select Cloud Server--</option>
		    <option ><%=clo %></option>
        </select></td>
	</tr>
		

	<tr>
		<td>&nbsp;</td>
	<tr>
		<td>
		<div align="right"></div>		</td>
		<td><input type="submit" name="Submit" value="Get <%=clo %> Transaction" /></td>
	</tr>
</table>
</form>




<br/>
<span class="style3"><br/>
<br/>


<%

	String cname=request.getParameter("cname");


	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
      		if(cname.equalsIgnoreCase("Eucalyptus")||cname.equalsIgnoreCase("Nimbus")||cname.equalsIgnoreCase("Amazon EC2")){
          %>
</span>
<h3 align="center"><span class="style5"><%=cname %> Transaction Details are:</span><br/>
  <br/>
  </h3>
<table  border="1" align="left">
  <tr>
   <td ><div align="center"><span class="style3">User Name </span></div></td>
      <td ><div align="center"><span class="style3">File Name </span></div></td>     
       <td ><div align="center"><span class="style3">Cloud Name </span></div></td>
      <td ><div align="center"><span class="style3">Secret Key </span></div></td>
    <td ><div align="center"><span class="style3">Task</span></div></td>
    <td ><div align="center"><span class="style3">Date </span></div></td>
  </tr>
      		 
      		
      	<%	String query="select * from apms_transaction where cname='"+cname+"'"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getString(4);
		s5=rs.getString(5);
		s6=rs.getString(6);
		s7=rs.getString(7);
		

		%>
		


<tr>
	<td height="29">
	<div align="center"><%=s2%></div>	</td>
		<td>
	<div align="center"><%=s3%></div>	</td>
	<td>
	<div align="center"><%=s4%></div>	</td>
	<td>
	<div align="center"><%=s5%></div>	</td>
	<td>
	<div align="center"><%=s6%></div>	</td>
	<td>
	<div align="center"><%=s7%></div>	</td>
</tr>


<%
	   }
	}else{
			%>
			<h1>Please provide the cloud nmae..</h1>
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
