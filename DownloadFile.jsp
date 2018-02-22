<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Download File</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />


     <script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}

</script>

</head>
<body>
<div id="header_container">
  <div id="header"> <a href="http://tmksinfotech.com"><img src="images/logo.gif" alt="Total Management" title="Total Management" border="0" /></a>
    <ul>
      <li><a href="DownloadFile.jsp">Download</a> </li>
      <li><a href="index.html">Log Out</a></li>

    </ul>
    <h1>Profit Maximization Scheme</h1>
  </div>
</div>
<%
String clod=(String)application.getAttribute("clname");

String ownerName=(String)application.getAttribute("onname");
%>
<div id="body1">

<h5 align="right"><%=new java.util.Date()%></h5>
<h2 align="center">Request For Download Data </h2>
</div>

<div id="bodymiddlePan">
		<h2> Download File</h2>



<form action="Download1.jsp" method="post" name="form1" id="form1">
<table width="478" border="0" align="center">
	<tr>
		<td width="223"><span class="style1">Enter File Name :-</span></td>
		<td width="245"><label> <input required name="t1"
			type="text"  size="40" /> </label></td>
	</tr>
	<tr>
		<td width="223"><span class="style1">Select Cloud :-</span></td>
		<td><select id="s1" name="cloud" style="width: 150px;"
			class="text">
			<option>--Select--</option>
		   <option><%=clod %></option>

		</select></td>
	</tr>
	<tr>
		<td height="34"><span class="style1">MAC :-</span></td>
		<td><input name="t12" type="text" size="40" /></td>
	</tr>
	<tr>
		<td><span class="style1">Secret Key :-</span></td>
		<td><input name="t13" type="text" size="40" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
		<div align="right"><input type="submit" name="Submit"
			value="Req MAC" /></div>
		</td>
	
	</tr>
</table>
</form>
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
