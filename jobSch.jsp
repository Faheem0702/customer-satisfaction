<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Job Schedule</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="header_container">
  <div id="header"> <a href="http://all-free-download.com/free-website-templates/"><img src="images/logo.gif" alt="Total Management" title="Total Management" border="0" /></a>
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
<div id="body1">
<br/>
<h1 align="center">Get Job Schedule Details</h1>
</div>
<div id="bodymiddlePan">
  	 <form id="form1" name="form1" method="post" action="scheduler.jsp">
<table width="598" border="0" align="center">
<p>&nbsp;</p><p>&nbsp;</p>
	<tr>
	<td class="style4">Enter Cloud Name :-</td>
		<td><select id="s1"	name="cname" class="text">
		  <option>--Select Cloud Server--</option>
		    <option>Eucalyptus</option>
          <option>Nimbus</option>
          <option>AmazonEC2</option>
        </select></td>
	</tr>
		
	<tr>
		<td>&nbsp;</td>
	<tr>
		<td>
		<div align="right"></div>
		</td>
		<td><input type="submit" name="Submit" value="Get Job Details" /></td>
	</tr>
</table>





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
