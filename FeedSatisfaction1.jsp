<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ include file="connect.jsp" %>
<%@ page import="java.sql.*,java.util.Random,java.security.KeyPairGenerator,javax.crypto.Cipher,java.security.Key,java.security.KeyPair     "%>

    <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Feed Your Satisfaction</title>
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
      <li><a href="Upload.jsp">Upload</a> </li>
      <li class="active"><a href="ViewOwnerFiles.jsp">View Owner Files</a></li>
      <li><a href="index.html">Log Out</a></li>

    </ul>
<h1>Profit Maximization Scheme</h1>
</div>
</div>
<div id="body1"><br />
<h1 align="center">Feed Your Satisfaction </h1>
</div>
<div id="bodymiddlePanj">
       <%
     
	     	String cname=request.getParameter("cloud");
            String fname=request.getParameter("t1");
        
		
		try
		{
			SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
			Statement st=connection.createStatement();
			
			String uname=(String)application.getAttribute("onname");
			
			
					st.executeUpdate(" insert into satisfaction (oname,cname,feedback,dt) values ('"+uname+"','"+cname+"','"+fname+"','"+strDate+"') ");

						out.println("SATISFACTION FEEDBACK SENT SUCCESSFULLY");
					
					
					%><p><a href="FeedSatisfaction.jsp">Back</a></p>

			<%
					
		

		 	}
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
<h4><a href="DataOwnerMain.jsp">back</a></h4>
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
