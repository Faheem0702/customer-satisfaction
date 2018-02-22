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

<%@page import="com.sun.mail.imap.protocol.Status"%><html
	xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Allocate</title>
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
	<li><a href="createvm.jsp">CreateVM </a></li>
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
<%String cname=request.getParameter("cname"); 
String fn = request.getParameter("fn");
String on=request.getParameter("on");
String cn=request.getParameter("cn");

String vm=request.getParameter("vname");
String vmem=request.getParameter("vmem");



%>
<h1 align="center">The <%=fn %> is allocated to <%=vm %> in <%=cn %></h1>
</div>
<div id="bodymiddlePan">
<%



String clo=(String)application.getAttribute("cns");
String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9="",s10,s11,s12,s13;
int i=0,j=0,k=0;
String tbl="";
  	try 
{
  		if (cn.equalsIgnoreCase("Eucalyptus")) {
  			tbl = "apms_eucalyptus";
  		} else if (cn.equalsIgnoreCase("Nimbus")) {
  			tbl = "apms_nimbus";
  		} else if (cn.equalsIgnoreCase("Amazon EC2")) {
  			tbl = "apms_amazonec2";
}
    
		String query9 = "SELECT * FROM "+tbl+"";
		
	       Statement st15=connection.createStatement();
	       ResultSet rs15=st15.executeQuery(query9);
		
	       Date date1=null,date2=null;
	       Date nowor=null;
		while(rs15.next()) {
			
			
			String clouname=rs15.getString(1);
			String d1=rs15.getString(2);
			String d2=rs15.getString(3);	
		
		    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		    date1 =  new SimpleDateFormat("dd/MM/yyyy").parse(d1);

		    SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
		    date2 =  new SimpleDateFormat("dd/MM/yyyy").parse(d2);
		  
		    Date now1 = new Date();
		    SimpleDateFormat sdf1 = new SimpleDateFormat ("dd/MM/yyyy");
            String strCurrDate = sdf1.format(now1);
             nowor =  new SimpleDateFormat("dd/MM/yyyy").parse(strCurrDate);

		}

System.out.println(date1);
System.out.println(date2);
System.out.println(nowor);

%> <%
if(nowor.compareTo(date2) >= 0){
	%><h3>Hi ur Service Level Agreement (SLA) Service Time is expired
on <%=date2%> for <%=cn %></h3>
<br />
<h3>Please Contact Cloud Administrator</h3>

<%
}
else if (nowor.compareTo(date1) >= 0 && nowor.compareTo(date2) <= 0) {
      
  		%> <%
  		String query="select * from apms_cloudsch where fname='"+fn+"' and ownername='"+on+"' and cname='"+cn+"' "; 
       Statement st=connection.createStatement();
       ResultSet rs=st.executeQuery(query);
       SimpleDateFormat sdfDate = new SimpleDateFormat(
		"dd/MM/yyyy");
SimpleDateFormat sdfTime = new SimpleDateFormat(
		"HH:mm:ss");

Date now = new Date();

String strDate = sdfDate.format(now);
String strTime = sdfTime.format(now);
String dt = strDate + "   " + strTime;
while ( rs.next() )
   {
	i=rs.getInt(1);
	s2=rs.getString(2);
	s3=rs.getString(3);
	s4=rs.getString(4);
	s5=rs.getString(5);
	s6=rs.getString(6);
	s7=rs.getString(7);
	s8=rs.getString(8);
	s9=rs.getString(9);
s10=rs.getString(10);

%> <%
Statement st2=connection.createStatement();
st2.executeUpdate("insert into  apms_cloudserver(fname,ct,ownername,cname,vm,mac,sk,rank,dt) values ('"+fn+"','"+s3+"','"+on+"','"+cn+"','"+vm+"','"+s6+"','"+s7+"','"+s8+"','"+dt+"')"); 
    

int ct=s2.length();
int vmememry=Integer.parseInt(vmem)-ct;

String table = "";
if (cn.equalsIgnoreCase("Eucalyptus")) {
	table = "apms_vmeucalyptus";
} else if (cn.equalsIgnoreCase("Nimbus")) {
	table = "apms_vmnimbus";
} else if (cn.equalsIgnoreCase("Amazon EC2")) {
	table = "apms_vmamazonec2";
	%>
<h2>Table <%=table %></h2>
<%
}

String strQuery5 = "update "+table+" set vmmem='" + vmememry + "' where vm='" + vm + "' ";
connection.createStatement().executeUpdate(strQuery5);

String status="Allocated";
String strQuery2 = "update apms_cloudsch set status='" + status	+ "' where fname='" + fn + "' and ownername='"+on+"' and cname='"+cn+"'   ";
connection.createStatement().executeUpdate(strQuery2);

String quer="select * from apms_csheduler where cloudname='"+clo+"' "; 
Statement st9=connection.createStatement();
ResultSet rs9=st9.executeQuery(quer);

while ( rs9.next() )
{
int iis=rs.getInt(1);
String s117=rs9.getString(2);
String s118=rs9.getString(3);


int job=Integer.parseInt(s118)-1;

String strQuery25 = "update apms_csheduler set jobs='" +job+ "' where cloudname='"+cn+"'   ";
connection.createStatement().executeUpdate(strQuery25);



   }

%>
<h2>Memory Allocated Successfully to files</h2>
<%
   }
}
}catch(Exception e){
	out.println(e.getMessage());
	e.printStackTrace();
}

	%>

<h3><a href="ViewCloudFiles.jsp">back</a></h3>
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
