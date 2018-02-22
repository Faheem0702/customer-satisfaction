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
<title>Upload</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}

</script>

</head>
<body>
<div id="header_container">
  <div id="header"> <a href="index.html"><img src="images/logo.gif" alt="Total Management" title="A Profit Maximization Scheme with Guaranteed Quality of Service in Cloud Computing" border="0" /></a>
    <ul>
      <li><a href="Upload.jsp">Upload</a> </li>
      <li class="active"><a href="ViewOwnerFiles.jsp">View Owner Files</a></li>
      <li><a href="index.html">Log Out</a></li>

    </ul>
    <h1>Profit Maximization Scheme</h1>
  </div>
</div>
<%
String ownerName=(String)application.getAttribute("onname");
String ocl=(String)application.getAttribute("uploadC");
%>
<div id="body1">

<h5 align="right"><%=new java.util.Date()%></h5>
<h2 align="center">Upload Data </h2>
</div>

<div id="bodymiddlePan">
   <%

      	try 
	{
      		String file=request.getParameter("t42");
      		String cont=request.getParameter("text2");
      		String mac =request.getParameter("t4");
      		String cloud=request.getParameter("cloud");
			SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
      		KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
				Cipher encoder = Cipher.getInstance("RSA");
				KeyPair kp = kg.generateKeyPair();

				Key pubKey = kp.getPublic();

				byte[] pub = pubKey.getEncoded();
//				System.out.println("PUBLIC KEY" + pub);
		
				String pk = String.valueOf(pub);
				String rank="0";
			 Statement st=connection.createStatement();
	
				String user="Data Owner";
				String task="Upload";
				
				String ownernam=(String) application.getAttribute("onname");
				
				String strQuery2 = "insert into apms_transaction(user,fname,sk,task,dt) values('"+user+"','"+file+"','"+pk+"','"+task+"','"+dt+"')";
				connection.createStatement().executeUpdate(strQuery2);
				
				Statement stss=connection.createStatement();
				String status="waiting";
stss.executeUpdate("insert into  apms_ownerdetails(fname,ownername,mac,sk,dt) values ('"+file+"','"+ownernam+"','"+mac+"','"+pk+"','"+dt+"')"); 
			
				Statement st2=connection.createStatement();
st2.executeUpdate("insert into  apms_cloudsch(fname,ct,ownername,cname,mac,sk,rank,dt,status) values ('"+file+"','"+cont+"','"+ownernam+"','"+ocl+"','"+mac+"','"+pk+"','"+rank+"','"+dt+"','"+status+"')"); 
      		
	
%>
<p>
<h2>Data Uploaded Successfully !!!</h2>
</p>
<br />
<p><a href="DataOwnerMain.jsp">BACK</a></p>

<%

	   

           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
            e.printStackTrace();
          }
%>
</div>
<div id="bodyBottomPan">
  <div id="infoPan">
    <h2>more info</h2>
    <p>customer satisfaction; multiserver system</p>
    <p class="view"><a href="#">view</a></p>
  </div>
  <div id="servicesPan">
    <h2>Cloud SLAs </h2>
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
