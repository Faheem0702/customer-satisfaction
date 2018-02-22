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
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style4 {color: #FFFF00}
.style5 {color: #0099FF}
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
	<li><a href="createvm.jsp?">CreateVM </a></li>
	<li><a href="ViewCloudFiles.jsp">RecievedFiles</a></li>
	<li><a href="ViewVm.jsp">ViewAllVM</a></li>
	<li><a href="ViewOwners.jsp">ViewDataOwners</a></li>
	<li><a href="ViewAttackers.jsp">ViewsAttackers</a></li>
	<li><a href="ViewTransactions.jsp">ViewTransactions</a></li>
	<li class="aboutus"><a href="index.html">Log Out</a></li>


</ul>
<h1>Profit Maximization Scheme</h1>
</div>
</div>
<div id="body1"><br />
<%String kind=request.getParameter("kind");
%>

<%String clo=(String)application.getAttribute("cloudname");%>
<h1 align="center" class="style4" >The <%=kind %> of <%=clo%></h1>
</div>
<div id="bodymiddlePanj">
       <h1 align="center">&nbsp;</h1>
<p>&nbsp;</p>
    <table width="924" border="1" align="left">
  <tr>
    <td width="241" height="32"><div align="center" class="style5">Owner Image </div></td>
    <td width="168"><div align="center" class="style5">Owner Name </div></td>
    <td width="109"><div align="center" class="style5">DOB</div></td>
    <td width="154"><div align="center" class="style5">E-Mail</div></td>
    <td width="102"><div align="center" class="style5">Mobile</div></td>
     <td width="124"><div align="center" class="style5">Payment/Cloud Name</div></td>
    <td width="124"><div align="center" class="style5">Service Time Period</div></td>
  </tr>

<%

      	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9,s10,s11,s12,s13="";
	int i=0,j=0;
String ii="";
      	try 
	{
      		String query="";
        if(kind.equalsIgnoreCase("Data Owners"))
        {
         query="select * from apms_owner "; 
		 
		 
        }else   if(kind.equalsIgnoreCase("End Users"))
        {
         query="select * from apms_enduser where cloudname='"+clo+"' "; 
         }
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		ii=rs.getString("id");
		s2=rs.getString("name");
		
		s3=rs.getString("dob");
		s4=rs.getString("email");
		s5=rs.getString("mobile");
		s6=rs.getString("imagess");
		s7=rs.getString("cloudname");
		 if(kind.equalsIgnoreCase("Data Owners"))
        {
		s8=rs.getString("servicetime");
		}
		 else   if(kind.equalsIgnoreCase("End Users"))
        {
		s8="Not Applicable";
		}
		
		i=Integer.parseInt(ii);
%>



  <tr>
    <td><div align="center">
    <%if(kind.equalsIgnoreCase("Data Owners"))
    {%>
      <input  name="image" type="image" src="images.jsp?imgid=<%=i%>" width="100" height="100" alt="Submit">
      <%} else   if(kind.equalsIgnoreCase("End Users"))
        {%>
    	  <input  name="image" type="image" src="images1.jsp?imgid=<%=i%>" width="100" height="100" alt="Submit">
      <%}%>
    </input></div></td>
    <td><div align="center"><%=s2%></div></td>
    <td><div align="center"><%=s3%></div></td>
    <td><div align="center"><%=s4%></div></td>
    <td><div align="center"><%=s5%></div></td>

    <td><div align="center"><%=s7%></div></td>
        <td><div align="center"><%=s8%></div></td>
  </tr>

<%

	 
	   }
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
            e.printStackTrace();
          }
%>
</table>
          </p>

<%if(clo.equalsIgnoreCase("Eucalyptus")||clo.equalsIgnoreCase("Nimbus"))
{
%>
<h3><a href="<%=clo%>Main.jsp">back</a></h3>
<%}else if(clo.equalsIgnoreCase("Amazon EC2") )
{%>
<h3><a href="AmazonEC2Main.jsp">back</a></h3>
<%}%>
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
