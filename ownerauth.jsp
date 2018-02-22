<title>Authentication Page</title>
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
	String name = request.getParameter("userid");
	String pass = request.getParameter("pass");
	//String cname = request.getParameter("cname");

	try {
		application.setAttribute("onname", name);


		String sql = "SELECT * FROM apms_owner where name='" + name
				+ "' and pass='" + pass + "' ";
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		String utype = "";
		if (rs.next()) {
			int i = rs.getInt(1);

			String frm = rs.getString(10);
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

			Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(frm);
			Date now1 = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
			String strCurrDate = sdf1.format(now1);
			Date date2 = new SimpleDateFormat("dd/MM/yyyy")
					.parse(strCurrDate);
			System.out.println(date1);
			System.out.println(date2);

			if (date1.compareTo(date2) < 0) {
				Statement stmt1 = connection.createStatement();
				String query1 = "delete from apms_cloudserver where ownername='"+ name + "' ";
				stmt1.executeUpdate(query1);

				Statement stmt11 = connection.createStatement();
//				String query11 = "delete from apms_tparbi where ownername='"+ name + "' ";
	//			stmt11.executeUpdate(query11);
%><h1>Hi <%=name%> ur Service Level Agreement (SLA) Service Time is expired on <%=date1%> u </h1>

<h2>Please Register Again</h2>

<h2><a href="Register.html">Register </a></h2>
<%
	Statement stmt12 = connection.createStatement();
				String query12 = "delete from apms_owner where name='"
						+ name + "'";
				stmt11.executeUpdate(query12);

			} else if (date1.compareTo(date2) > 0
					|| date1.compareTo(date2) == 0) {
				//status="TicketValid";

				application.setAttribute("uid", i);
				response.sendRedirect("DataOwnerMain.jsp");

			} else {

				response.sendRedirect("wronglogin.html");
			}
		} else {
			response.sendRedirect("wronglogin.html");
%>

<%
	}
	} catch (Exception e) {
		out.print(e);
		e.printStackTrace();
	}
%>

