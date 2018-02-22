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
<title>Download</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />

<script type='text/javascript'>
  
function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = "File.txt";

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}



</script>
</head>
<body>
<div id="header_container">
  <div id="header"> <a href="http://all-free-download.com/free-website-templates/"><img src="images/logo.gif" alt="Total Management" title="Total Management" border="0" /></a>
     <ul>
      <li><a href="DownloadFile.jsp">Download</a> </li>
            <li><a href="ViewCFiles.jsp">View Files</a> </li>
      <li><a href="index.html">Log Out</a></li>

    </ul>
    <h1>Profit Maximization Scheme</h1>
  </div>
</div>
<%
String ownerName=(String)application.getAttribute("onname");
%>
<div id="body1">

<h2 align="center">Download Data </h2>
</div>

<div id="bodymiddlePan">
		   <h5 align="right"><%=new java.util.Date()%></h5>
	    <%
		   	try {
		   		String file = request.getParameter("t1");
		   		String cloud = request.getParameter("cloud");
		   		String mac = request.getParameter("t12");
		   		String sk = request.getParameter("t13");

		   		application.setAttribute("file2", file);
		   		application.setAttribute("sk2", sk);

		   		%>
				<%
		   		String strQuery = "select * from apms_cloudserver where fname='"
		   				+ file
		   				+ "' and cname='"
		   				+ cloud
		   				+ "' and  mac='"
		   				+ mac
		   				+ "' and  sk='" + sk + "'";
		   		String strQuery1 = "select * from apms_cloudserver where fname='"
		   				+ file + "'";

		   		ResultSet rs = connection.createStatement().executeQuery(
		   				strQuery);
		   		{
		   			%>
					<%
		   			
		   			if (rs.next() == true) {
		   				ResultSet rs1 = connection.createStatement()
		   						.executeQuery(strQuery1);
		   				{
		   					%>
							<%
		   					if (rs1.next() == true) {
		   						String rank = rs1.getString(9);
		   					//	int r=Integer.parseInt(rank);
		   %>
					
						<%
					int updaterank = Integer.parseInt(rank)+ 1;
						%>
						<%
												String strQuery2 = "update apms_cloudserver set rank='"
														+ updaterank
														+ "' where fname='"
														+ file+ "' and cname='"+cloud+"' ";
					
												connection.createStatement().executeUpdate(
														strQuery2);
						%>
			
						<%
							String ct = rs.getString(3);

												String keys = "ef50a0ef2c3e3a5f";
												byte[] keyValue1 = keys.getBytes();
												Key key1 = new SecretKeySpec(keyValue1, "AES");
												Cipher c1 = Cipher.getInstance("AES");
												c1.init(Cipher.DECRYPT_MODE, key1);
												String decryptedValue = new String(Base64
														.decode(ct.getBytes()));
						%>
			
		  </p>
		  <p align="center" class="style1">File Contents</p>
		  
		    <label>
	            <div align="center">
	              <textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue%></textarea>
	              <br/>
	              <br/>
	              <td><button onClick="saveTextAsFile()">Download</button></td>
            </div>
		    </label>
		  <p align="center">&nbsp; </p>
		  <p>
		    <%
		    	} else {
		    %>
	      </p>
		  <p>
		  <h1 class="style1">File Doesn't Exist !!!</h1>
		  </p><br />
						<p><a href="UserMain.jsp">Back</a></p>
	<%
		}
					}
				} else {
					SimpleDateFormat sdfDate = new SimpleDateFormat(
							"dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat(
							"HH:mm:ss");

					Date now = new Date();

					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;

					String user = (String) application
							.getAttribute("ename");
String type="Wrong Credentials";
					String strQuery2 = "insert into apms_attacker(user,fname,cname,sk,type,dt) values('"
							+ user
							+ "','"
							+ file
							+ "','"+cloud+"','"
							+ sk
							+ "','"+type+"','"
							+ dt
							+ "')";
					connection.createStatement().executeUpdate(strQuery2);
	%>
	      </p>
		  <p>
		  <h1 class="style1">Secret Key Mismatch !!!</h1>
		  </p><br />
						<p><a href="UserMain.jsp">Back</a></p>
	<%
		}
			}
			connection.close();
		} catch (Exception e) {
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
</div>
<div id="bodyBottomPan">
  <div id="infoPan">
    <h2>more info</h2>
    <p>PoS; QoS; service-level agreement</p>
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
