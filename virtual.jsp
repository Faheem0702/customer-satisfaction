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



<%
	String clo = (String) application.getAttribute("cnames1");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>View VM</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="header_container">
  <div id="header"> <a href="http://all-free-download.com/free-website-templates/"><img src="images/logo.gif" alt="Total Management" title="Total Management" border="0" /></a>
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
<div id="body1">
<br/>
<h1 align="center">Cloud Server Main</h1>
</div>
<div id="bodymiddlePan"><%
	try {
		String cn = request.getParameter("cloudn");
		String vm = request.getParameter("vm");
		String vmm = request.getParameter("vmm");//ch
		String tbl = "";
		if (cn.equalsIgnoreCase("Eucalyptus")) {
			tbl = "apms_eucalyptus";
		} else if (cn.equalsIgnoreCase("Nimbus")) {
			tbl = "apms_nimbus";
		} else if (cn.equalsIgnoreCase("Amazon EC2")) {
			tbl = "apms_amazonec2";
		}

		String query9 = "SELECT * FROM " + tbl + "";

		Statement st15 = connection.createStatement();
		ResultSet rs15 = st15.executeQuery(query9);

		Date date1 = null, date2 = null;
		Date nowor = null;
		while (rs15.next()) {

			String clouname = rs15.getString(1);
			String d1 = rs15.getString(2);
			String d2 = rs15.getString(3);

			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			date1 = new SimpleDateFormat("dd/MM/yyyy").parse(d1);

			SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
			date2 = new SimpleDateFormat("dd/MM/yyyy").parse(d2);

			Date now1 = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
			String strCurrDate = sdf1.format(now1);
			nowor = new SimpleDateFormat("dd/MM/yyyy")
					.parse(strCurrDate);

		}

		System.out.println(date1);
		System.out.println(date2);
		System.out.println(nowor);
%> <%
 	if (nowor.compareTo(date2) >= 0) {
 %><h3>Service Level Agreement (SLA) period of <%=cn%> is expired on
<%=date2%></h3>
<br />
<h3>Please Contact Cloud Administrator</h3>

<%
	} else if (nowor.compareTo(date1) >= 0
				&& nowor.compareTo(date2) <= 0) {

			SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			if (cn.equalsIgnoreCase("Eucalyptus")) {

				//String strQuery25 = "insert into (vm,vmmem,dt) values('"
					//	+ vm + "','" + vmm + "','" + dt + "')";
				
				String strQuery25="update apms_vmeucalyptus set vmmem='"
				+ vmm + "', dt='"+dt+"' where vm='" +vm+ "' ";
				connection.createStatement().executeUpdate(strQuery25);
%><h3>Created Virtal Machine <%=vm%> of <%=vmm%> for <%=cn%></h3>
<%
	}
			if (cn.equalsIgnoreCase("Nimbus")) {

			//	String strQuery25 = "insert into apms_vmNimbus(vm,vmmem,dt) values('"
				//		+ vm + "','" + vmm + "','" + dt + "')";
				String strQuery25="update apms_vmNimbus set vmmem='"
					+ vmm + "', dt='"+dt+"' where vm='" +vm+ "' ";
				connection.createStatement().executeUpdate(strQuery25);
%><h3>Created Virtal Machine <%=vm%> of <%=vmm%> for <%=cn%></h3>
<%
	}//
			if (cn.equalsIgnoreCase("Amazon EC2")) {

	//			String strQuery25 = "insert into apms_vmAmazonEC2(vm,vmmem,dt) values('"
		//				+ vm + "','" + vmm + "','" + dt + "')";
				String strQuery25="update apms_vmamazonec2 set vmmem='"
					+ vmm + "', dt='"+dt+"' where vm='" +vm+ "' ";
				
				connection.createStatement().executeUpdate(strQuery25);
%><h3>Created Virtal Machine <%=vm%> of <%=vmm%> for <%=cn%></h3>
<%
	}
		}
	} catch (Exception e) {
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

