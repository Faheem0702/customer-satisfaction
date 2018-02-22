<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>End User Customer</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
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
String userName=(String)application.getAttribute("ename");
%>
<div id="body1">

<h5 align="right"><%=new java.util.Date()%></h5>
 <h1 align="center">Welcome <%=application.getAttribute("clname") %> Customer :: Mr. <%=userName %> </h1> 
</div>

<div id="bodymiddlePan">
  <h2>End User  </h2>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p><img src="images/enduser.png" width="480" height="328" /></p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p align="justify">&nbsp;</p>
</div>
<div id="bodyBottomPan">
  <div id="infoPan">
    <h2>more info</h2>
    <p>A Profit Maximization Scheme with GQSCC</p>
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
