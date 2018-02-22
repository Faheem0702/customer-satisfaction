<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Data Owner Main</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="header_container">
  <div id="header"> <a href="http://all-free-download.com/free-website-templates/"><img src="images/logo.gif" alt="Total Management" title="Total Management" border="0" /></a>
    <ul>
      <li><a href="Upload.jsp">Upload</a> </li>
      <li ><a href="ViewOwnerFiles.jsp">View Owner Files</a></li>
	  
	   <li ><a href="FeedSatisfaction.jsp">Feed Your Satisfaction</a></li>
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
 <h1 align="center">Welcome To Customer :: Mr. <%=ownerName %> </h1> 
</div>

<div id="bodymiddlePan">
  <h2>Data Owner</h2>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p><img src="images/CloudOwner.jpg" width="465" height="237" /> </p>
  <p align="justify">&nbsp;</p>
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
