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
<title>A Profit Maximization Scheme with Guaranteed Quality of
Service in Cloud Computing</title>
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
<h1 align="center">Cloud Server Main</h1>
</div>
<div id="bodymiddlePan"><%
	String s1 = "", s2 = "", s4 = "", s5 = "", s6 = "", s7 = "", s8, s9 = "", s10, s11, s12, s13;
	int i = 0, j = 0, k = 0, s3;
	String cn = request.getParameter("cname");
	Random r = new Random();
	int j1;

	try {

		String query = "select * from apms_csheduler ";
		Statement st = connection.createStatement();
		ResultSet rs = st.executeQuery(query);
		while (rs.next()) {

			i = rs.getInt(1);
			s2 = rs.getString(2);
			s3 = rs.getInt(3);
%>
			<%=cn%>
			<%
				if (cn.equalsIgnoreCase("Eucalyptus")
								&& s2.equalsIgnoreCase("Eucalyptus")
								|| cn.equalsIgnoreCase("Nimbus")
								&& s2.equalsIgnoreCase("Nimbus")
								|| cn.equalsIgnoreCase("AmazonEC2")
								&& s2.equalsIgnoreCase("AmazonEC2")) {

							if (s3 == 0) {

								j1 = r.nextInt(50);

								String strQuery25 = "update apms_csheduler set jobs='"
										+ j1
										+ "' where cloudname='"
										+ cn
										+ "' and id='" + i + "'";
								connection.createStatement().executeUpdate(
										strQuery25);
								String strQuery2 = "update apms_slaj set job='"
										+ j1 + "' where cname='" + cn + "' ";
								connection.createStatement().executeUpdate(
										strQuery2);
			%><h3>Hi,ur jobs are reassigned <%=j1%> for <%=cn%></h3>
				<h3><a href="viewschj.jsp">View Scheduled Jobs.</a></h3>
				<%
					if (rs.next()) {

										s2 = rs.getString(2);
									}
								}

							}
							if (s2.equalsIgnoreCase(cn)) {
				%><h1>if s2 == cn <%=s2%> <%=cn%></h1>
				<%
					if ((s2.equalsIgnoreCase("Eucalyptus"))
										&& cn.equalsIgnoreCase("Eucalyptus")) {

									j1 = r.nextInt(50);
									String eu = "Eucalyptus";
									String strQuery26 = "update apms_csheduler set jobs='"
											+ j1 + "' where cloudname='" + eu + "'";
									out.print(strQuery26);
									connection.createStatement().executeUpdate(
											strQuery26);

									String strQuery2 = "update apms_slaj set job='"
											+ j1 + "' where cname='" + eu + "' ";
									connection.createStatement().executeUpdate(
											strQuery2);
				%><h3>Hi,ur jobs are <%=j1%> for <%=cn%></h3>
<h3><a href="viewschj.jsp">View Scheduled Jobs.</a></h3>
<%
	}

				if ((s2.equalsIgnoreCase("AmazonEC2"))
						&& cn.equalsIgnoreCase("AmazonEC2")) {
					String am = "AmazonEC2";
					String am1 = "AmazonEC2";
					j1 = r.nextInt(50);
					String strQuery26 = "update apms_csheduler set jobs='"
							+ j1 + "' where cloudname='" + am1 + "' ";

					connection.createStatement().executeUpdate(
							strQuery26);

					String strQuery2 = "update apms_slaj set job='"
							+ j1 + "' where cname='" + am + "' ";
					connection.createStatement().executeUpdate(
							strQuery2);
%><h3>Hi,ur jobs are <%=j1%> for <%=cn%></h3>
				<h3><a href="viewschj.jsp">View Scheduled Jobs.</a></h3>
<%
	}

				if ((s2.equalsIgnoreCase("Nimbus"))
						&& cn.equalsIgnoreCase("Nimbus")) {
					String ni = "Nimbus";
					j1 = r.nextInt(50);
					String strQuery26 = "update apms_csheduler set jobs='"
							+ j1 + "' where cloudname='" + ni + "' ";

					connection.createStatement().executeUpdate(
							strQuery26);

					String strQuery2 = "update apms_slaj set job='"
							+ j1 + "' where cname='" + ni + "' ";
					connection.createStatement().executeUpdate(
							strQuery2);
%><h3>Hi,ur jobs are <%=j1%> for <%=cn%></h3>
<h3><a href="viewschj.jsp">View Scheduled Jobs.</a></h3>
<%
	}

			}

		}

			} catch (Exception e) {
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

