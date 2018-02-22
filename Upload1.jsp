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
<title>Upload1</title>
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
%>
<div id="body1">

<h5 align="right"><%=new java.util.Date()%></h5>
<h2 align="center">Upload Data </h2>
</div>

<div id="bodymiddlePan">
    <% try 
	{
      		String file=request.getParameter("tt");
      		String cont=request.getParameter("text");
      		String keys = "ef50a0ef2c3e3a5f";
      		String h1="";
      		String filename="filename.txt";
      		
      		String cname=(String)application.getAttribute("ownercloud");
			
      			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
      			String encryptedValue = new String(Base64.encode(cont.getBytes()));
      		//D:/Workspace Jayam/SelCSp/WebContent
      		PrintStream p = new PrintStream(new FileOutputStream(filename));
			p.print(new String(cont));
			
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(filename);
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
 
			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
 
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
			
      		
	
%>

<form action="Upload2.jsp" method="post">
<table width="598" border="1" align="center">

	<tr>
		<td width="286"><span class="style4">File Name :- </span></td>
		<td width="356"><input name="t42" type="text" id="t42" size="50"
			value="<%= file %>" readonly="readonly" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><textarea name="text2" cols="50" rows="15" readonly><%= encryptedValue %></textarea></td>
	</tr>
	<tr>
		<td><span class="style4">MAC: </span></td>
		<td><input name="t4" type="text" id="t4" size="50"
			value="<%= h1 %>" readonly="readonly" /></td>
	</tr>
	
	
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
		<div align="right"></div>
		</td>
		<td><input type="submit" name="Submit2" value="Upload" /></td>
	</tr>
</table>
</form>
<%

	   

         connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
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
