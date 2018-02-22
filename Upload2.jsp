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
<title>A Profit Maximization Scheme with Guaranteed Quality of
Service in Cloud Computing</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />

<script language="javascript" type='text/javascript'>
	function loadFileAsText() {
		var fileToLoad = document.getElementById("file").files[0];

		var fileReader = new FileReader();
		fileReader.onload = function(fileLoadedEvent) {
			var textFromFileLoaded = fileLoadedEvent.target.result;
			document.getElementById("textarea").value = textFromFileLoaded;
		};
		fileReader.readAsText(fileToLoad, "UTF-8");
	}
</script>

</head>
<body>
<div id="header_container">
<div id="header"><a href="index.html"><img
	src="images/logo.gif" alt="Total Management"
	title="A Profit Maximization Scheme with Guaranteed Quality of Service in Cloud Computing"
	border="0" /></a>
<ul>
	<li><a href="Upload.jsp">Upload</a></li>
	<li class="active"><a href="ViewOwnerFiles.jsp">View Owner
	Files</a></li>
	<li><a href="index.html">Log Out</a></li>

</ul>
<h1>Profit Maximization Scheme</h1>
</div>
</div>
<%
	String ownerName = (String) application.getAttribute("onname");
	//String ocl=(String)application.getAttribute("uploadC");
%>
<div id="body1">

<h5 align="right"><%=new java.util.Date()%></h5>
<h2 align="center">Upload Data</h2>
</div>

<div id="bodymiddlePan">
<%
	try {
		String vmname1 = "";
		int vmmem1 = 0;
%>
<h2>Vontrol sssdsdsds</h2>
<%
	String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "", s8, s9 = "", s10, s11, s12, s13;
		int i = 0, j = 0, k;
		String file = request.getParameter("t42");
		String cont = request.getParameter("text2");
		String mac = request.getParameter("t4");
		String cloud = request.getParameter("cloud");
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

		Date now = new Date();
		int is = 0;
		String cnamej = "";
		int jobs = 0;
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
		String rank = "0";
		Statement st = connection.createStatement();

		String user = "Data Owner";
		String task = "Upload";

		Statement sts = connection.createStatement();
		String sqlS = "SELECT * FROM apms_csheduler where jobs=(SELECT max(jobs) from apms_csheduler)";

		ResultSet rs2s = sts.executeQuery(sqlS);

		if (rs2s.next()) {
			is = rs2s.getInt(1);
			cnamej = rs2s.getString(2);
			jobs = rs2s.getInt(3);
%>
<h2><%=cnamej%> <%=jobs%> sssdsdsds</h2>
<%
	String ownernam = (String) application
					.getAttribute("onname");

			String strQuery2 = "insert into apms_transaction(user,fname,cname,sk,task,dt) values('"
					+ ownernam
					+ "','"
					+ file
					+ "','"
					+ cnamej
					+ "','"
					+ pk
					+ "','"
					+ task
					+ "','" + dt + "')";
			connection.createStatement().executeUpdate(strQuery2);

			Statement stss = connection.createStatement();
			String status = "waiting";
			stss
					.executeUpdate("insert into  apms_ownerdetails(fname,ownername,cname,mac,sk,dt) values ('"
							+ file
							+ "','"
							+ ownernam
							+ "','"+cnamej+"','"
							+ mac
							+ "','" + pk + "','" + dt + "')");

			Statement st2 = connection.createStatement();
			st2
					.executeUpdate("insert into  apms_cloudsch(fname,ct,ownername,cname,mac,sk,rank,dt,status) values ('"
							+ file
							+ "','"
							+ cont
							+ "','"
							+ ownernam
							+ "','"
							+ cnamej
							+ "','"
							+ mac
							+ "','"
							+ pk
							+ "','"
							+ rank
							+ "','"
							+ dt
							+ "','"
							+ status + "')");
%>
<h2>Upload sssdsdsds</h2>
<%
	//VM
			String table = "";
			if (cnamej.equalsIgnoreCase("Eucalyptus")) {
				table = "apms_vmeucalyptus";
			} else if (cnamej.equalsIgnoreCase("Nimbus")) {
				table = "apms_vmnimbus";
			} else if (cnamej.equalsIgnoreCase("AmazonEC2")) {
				table = "apms_vmamazonec2";
			}

			String query = "select vm,vmmem from " + table
					+ " group by vmmem order by MAX(vmmem) DESC";
			//select vm,vmmem,MAX(vmmem) from apms_vmEucalyptus group by vmmem order by MAX(vmmem) DESC; 
			Statement st52 = connection.createStatement();
			ResultSet rs52 = st52.executeQuery(query);
			if (rs52.next()) {
				vmname1 = rs52.getString(1);
				vmmem1 = rs52.getInt(2);

			}
%>
<h2>HIhhhh <%=vmname1 %> <%=vmmem1 %></h2>
<%
	//Date Period Validation
			String tbl1 = "";
			
				if (cnamej.equalsIgnoreCase("Eucalyptus")) {
					tbl1 = "apms_eucalyptus";
				} else if (cnamej.equalsIgnoreCase("Nimbus")) {
					tbl1 = "apms_nimbus";
				} else if (cnamej.equalsIgnoreCase("AmazonEC2")) {
					tbl1 = "apms_amazonec2";
				}

				String query9 = "SELECT * FROM " + tbl1 + "";

				Statement st15 = connection.createStatement();
				ResultSet rs15 = st15.executeQuery(query9);

				Date date1 = null, date2 = null;
				Date nowor = null;
				if (rs15.next()) {

					String clouname = rs15.getString(1);
					String d1 = rs15.getString(2);
					String d2 = rs15.getString(3);

					SimpleDateFormat sdf = new SimpleDateFormat(
							"dd/MM/yyyy");
					date1 = new SimpleDateFormat("dd/MM/yyyy")
							.parse(d1);

					SimpleDateFormat sdf2 = new SimpleDateFormat(
							"dd/MM/yyyy");
					date2 = new SimpleDateFormat("dd/MM/yyyy")
							.parse(d2);

					Date now1 = new Date();
					SimpleDateFormat sdf1 = new SimpleDateFormat(
							"dd/MM/yyyy");
					String strCurrDate = sdf1.format(now1);
					nowor = new SimpleDateFormat("dd/MM/yyyy")
							.parse(strCurrDate);

				}

				System.out.println("Date1: " + date1);
				System.out.println("Date2: " + date2);
				System.out.println("Date3: " + nowor);
				%>
				<h2>bfr date validation <%=nowor.compareTo(date1) >= 0 && nowor.compareTo(date2) <= 0 %></h2>
				<%
%> <%
 	if (nowor.compareTo(date2) >= 0) {
 %><h3>Hi ur Service Level Agreement (SLA) Service Time is expired
on <%=date2%> for <%=cnamej%></h3>
<br />
<h3>Please Contact Cloud Administrator</h3>

<%
	} 
 	else if (nowor.compareTo(date1) >= 0 && nowor.compareTo(date2) <= 0) {
		%>
		<h2>with in date validation</h2>
		<%
					
					
						Statement st21 = connection.createStatement();
						st21.executeUpdate("insert into  apms_cloudserver(fname,ct,ownername,cname,vm,mac,sk,rank,dt) values ('"
										+ file
										+ "','"
										+ cont
										+ "','"
										+ ownernam
										+ "','"
										+ cnamej
										+ "','"
										+ vmname1
										+ "','"
										+ mac
										+ "','"
										+ pk
										+ "','"
										+ rank
										+ "','" + dt + "')");
						%>
						<h2>with in validation</h2>
						<%

						int ct = s2.length();
						int vmememry = vmmem1 - ct;

						String table1 = "";
						if (cnamej.equalsIgnoreCase("Eucalyptus")) {
							table1 = "apms_vmeucalyptus";
						} else if (cnamej.equalsIgnoreCase("Nimbus")) {
							table1 = "apms_vmnimbus";
						} else if (cnamej.equalsIgnoreCase("AmazonEC2")) {
							table1 = "apms_vmamazonec2";
%>
<h2>Table <%=table1%></h2>
<%
	}

						String strQuery5 = "update " + table
								+ " set vmmem='" + vmememry
								+ "' where vm='" + vmname1 + "' ";
						connection.createStatement().executeUpdate(
								strQuery5);

						String statuss = "Allocated";
						String strQuery22 = "update apms_cloudsch set status='"
								+ statuss
								+ "' where fname='"
								+ file
								+ "' and ownername='"
								+ ownernam
								+ "' and cname='" + cnamej + "'   ";
						connection.createStatement().executeUpdate(
								strQuery22);

						String quer = "select * from apms_csheduler where cloudname='"
								+ cnamej + "' ";
						Statement st9 = connection.createStatement();
						ResultSet rs9 = st9.executeQuery(quer);

						while (rs9.next()) {
							int iis = rs9.getInt(1);
							String s117 = rs9.getString(2);
							String s118 = rs9.getString(3);

							int job = Integer.parseInt(s118) - 1;

							String strQuery25 = "update apms_csheduler set jobs='"
									+ job
									+ "' where cloudname='"
									+ cnamej + "'   ";
							connection.createStatement().executeUpdate(
									strQuery25);
							String strQuery255 = "update apms_slaj set job='"
								+ job
								+ "' where cname='"
								+ cnamej + "'   ";
						connection.createStatement().executeUpdate(
								strQuery255);

						}
%>
<h2>Memory Allocated Successfully to files</h2>
<%
	
				}
		

		}
%>
<p>
<h2>Data Uploaded Successfully !!!</h2>
</p>
<br />
<p><a href="DataOwnerMain.jsp">BACK</a></p>




<%
	connection.close();
	}

	catch (Exception e) {
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
</div>
<div id="bodyBottomPan">
<div id="infoPan">
<h2>more info</h2>
<p>A Profit Maximization Scheme with GQSCC</p>
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
