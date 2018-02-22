<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><%@include file="connect.jsp" %>
<head>
<title>View CFiles</title>
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
 <h1 align="center">Cloud Server Approved Files </h1> 
</div>

<div id="bodymiddlePanj">
  <table width="965" border="1" align="left">
    <tr>
      <td width="140" height="32"><div align="center"><span class="style3">File Name </span></div></td>
      <td width="293"><div align="center"><span class="style3">Owner Name </span></div></td>
      <td width="293"><div align="center"><span class="style3">Cloud Name </span></div></td>
        <td width="293"><div align="center"><span class="style3">VM Name </span></div></td>
      <td width="293"><div align="center"><span class="style3">MAC</span></div></td>
      <td width="178"><div align="center"><span class="style3">Secret Key </span></div></td>
      <td width="115"><div align="center"><span class="style3">Date </span></div></td>
    </tr>
    <%
String clo=(String)application.getAttribute("cloudname");
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        
          
      		
      		 
      		
      		String query="select * from apms_cloudserver where cname='"+clo+"' "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
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

		%>
    <tr>
      <td height="29"><div align="center"><%=s2%></div></td>
      <td><div align="center"><%=s4%></div></td>
      <td><div align="center"><%=s5%></div></td>
      <td><div align="center"><%=s6%></div></td>
      <td><div align="center"><%=s7%></div></td>
      <td><div align="center"><%=s8%></div></td>
      <td><div align="center"><%=s10%></div></td>
    </tr>
    <%
	   }
	  
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
            e.printStackTrace();
          }
%>
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
