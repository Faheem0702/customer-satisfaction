
<%
String clo=(String)application.getAttribute("cloudname");
String a="Amazon EC2";


if(clo.equalsIgnoreCase("AmazonEC2"))
{
	application.setAttribute("cns",a);



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Amazon Cloud Home Page</title>
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
<h1 align="center">Cloud Server Main SaaS Infrastructure</h1>
</div>
<div id="bodymiddlePan">

<h2>Welcome to <%=application.getAttribute("cloudname") %> CS</h2>
<p>&nbsp;</p>
<p align="justify">Along with the development of cloud computing, an increasing number of enterprises start to adopt cloud service, which promotes the emergence of many cloud service providers. For cloud service providers, how to configure their cloud service platforms to obtain the maximum profit becomes increasingly the focus that they pay attention to. In this paper, we take customer satisfaction into consideration to address this problem. Customer satisfaction affects the profit of cloud service providers in two ways. On one hand, the<br />
cloud configuration affects the quality of service which is an important factor affecting customer satisfaction. On the other hand, the customer satisfaction affects the request arrival rate of a cloud service provider. However, few existing works take customer satisfaction into consideration in solving profit maximization problem, or the existing works considering customer satisfaction do not give a proper formalized definition for it. Hence, we firstly refer to the definition of customer satisfaction in economics and develop a formula for measuring customer satisfaction in cloud computing. And then, an analysis is given in detail on how the customer satisfaction affects the profit. Lastly, taking into consideration customer satisfaction, service-level agreement, renting price, energy consumption and so forth, a profit maximization problem is formulated and solved to get the optimal configuration such that the profit is maximized.</p>
<p>&nbsp;</p>
<p align="justify">&nbsp;</p>
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

<div align=center></div>
</body>
</html>
<%
}
%>
