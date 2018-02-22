<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Upload</title>
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
  <div id="header"> <a href="http://all-free-download.com/free-website-templates/"><img src="images/logo.gif" alt="Total Management" title="Total Management" border="0" /></a>
      <ul>
      <li><a href="Upload.jsp">Upload</a> </li>
      <li class="active"><a href="ViewOwnerFiles.jsp">View Owner Files</a></li>
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
<h2 align="center">Encrypt &amp; Upload Data </h2>
</div>

<div id="bodymiddlePan">
    <form id="form1" name="form1" method="post" action="Upload1.jsp">
          <table width="598" border="1" align="center">
            <tr>
              <td width="286"><span class="style4">Select File :- </span></td>
              <td width="356"><input required="required" type="file" name="t42" id="file"  onchange="loadFileAsText()" /></td>
            </tr>
            <tr>
              <td class="style4">File Name :- </td>
              <td><input required="required" name="tt" type="text" id="t42" size="50"/></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><textarea name="text" id="textarea" cols="50" rows="15"></textarea></td>
            </tr>
            <tr>
              <td><span class="style4">MAC :- </span></td>
              <td><input name="t4" type="text" id="t4" size="50" value="" readonly="readonly" /></td>
            </tr>
			
            <tr>
              <td><div align="right"></div></td>
              <td><input type="submit" name="Submit" value="Encrypt" /></td>
            </tr>
          </table>
  </form>
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
