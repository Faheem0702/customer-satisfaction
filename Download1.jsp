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
  <div id="header"> <a href="http://tmksinfotech.com"><img src="images/logo.gif" alt="Total Management" title="Total Management" border="0" /></a>
    <ul>
      <li><a href="DownloadFile.jsp">Download</a> </li>
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
<h2 align="center">Request For Download Data </h2>
</div>

<div id="bodymiddlePan">
	     <%
String a=(String)application.getAttribute("a");
String fn=(String)application.getAttribute("fname");
String fname = request.getParameter("fname");
	

		    	try 
				{
		  		String file = request.getParameter("t1");
					String cname = request.getParameter("cloud");
String filname="",cloname="";
%>
<% 
					String strQuery5 = "select * from apms_cloudserver where fname='"+file+"' and cname='"+cname+"'";
					ResultSet rs5 = connection.createStatement().executeQuery(strQuery5);
					if(rs5.next()==true)
					{
						
						%>
						<%
						filname=rs5.getString(2);
						cloname=rs5.getString(5);
						
						if(filname.equalsIgnoreCase(file)&&cname.equalsIgnoreCase(cname))
						{
					
					application.setAttribute("name",cname);
				String mac="";
				String sk="";
				String strQuery = "select * from apms_cloudserver where fname='"+file+"' and cname='"+cname+"'";
				ResultSet rs = connection.createStatement().executeQuery(strQuery);
				{
					if(rs.next()==true)
					{
						mac=rs.getString(7);
						sk=rs.getString(8);
						
					SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

					Date now = new Date();

					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;	
					String task="Download";
					String user=(String) application.getAttribute("ename");
					String strQuery2 = "insert into apms_transaction(user,fname,cname,sk,task,dt) values('"+user+"','"+file+"','"+cname+"','"+sk+"','"+task+"','"+dt+"')";
					connection.createStatement().executeUpdate(strQuery2);
					
			%>
			
			<form action="Download2.jsp" method="get" name="form1" id="form1">
            <table width="478" border="0" align="center">
              <tr>
                <td width="223"><span class="style1">Enter File Name :-</span></td>
                <td width="245"><label>
                  <input required name="t1" type="text" value="<%=file%>" size="40" />
                </label></td>
              </tr>
			   <tr>
            <td width="223"><span class="style1">Select Cloud :-</span></td>
             <td>   <select id="s1" name="cloud" style="width:150px;" class="text">
                  <option><%= cname%></option>
            	  
                </select></td>
			  </tr>
			  
              <tr>
                <td height="34"><span class="style1">MAC :-</span></td>
                <td><input name="t12" type="text" value="<%=mac%>" size="40" /></td>
              </tr>
              <tr>
                <td><span class="style1">Secret Key :-</span></td>
                <td><input name="t13" type="text" value="<%=sk%>" size="40" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td><div align="right"></div></td>
                <td><label>
                  <input type="submit" name="Submit2" value="Download" />
                </label></td>
              </tr>
            </table>
          </form>		
			
			<%	
					}
					else
					{
		
						out.println("File Doesn't Exist !!!");
			%>
						<p><a href="Download.jsp">Back</a></p>
	<%
					}
				}
	 
           
						}
					}else{
						%>
						<br /><br /><br />
						<h3>U Dont Have Permision to delete this file Or ur accessing the file on Other Cloud !!!!!!!</h3>
						<br /><br />
						<h4><a href="UserMain.jsp">back</a></h4>
						<%
					}
					connection.close();	
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
          
%> 		
<%
	
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
