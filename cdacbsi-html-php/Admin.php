
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="stylesheet.css" type="text/css" rel="stylesheet">
    </head>
	<script>
	function code(){
	document.getElementById("name").value=" ";
	document.getElementById("type").value=" ";
	document.getElementById("address").value=" ";
	document.getElementById("lat").value=" ";
	document.getElementById("lng").value=" ";
	document.getElementById("link").value=" ";
	}
	</script>
<body onLoad="code">
        <div id="hea">
 <table id="TableMain" border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
    <tbody>
    <td style="text-align: left;width: 30px">
    <img src="bsi.gif"  alt="" height="70" width="100px">
    </td>
                            <td style="text-align: left;vertical-align: text-top">
                                <h4>Government of India</h4>
                                <h4>Ministry of Environment and Forests</h4>
                                <h2>Botanical Survey of India</h2>
                            </td>
	<td>
	<img src="national-emblem.gif" height="90px" align="right"/>	
	</td>
    </tr>
    </tbody>
    </table>
 </div>
<div>
<div>
<font style="azimuth:center" size="+3">Enter the taxon Data In the Following Fields
</font></div>
<div style="float:left;">
  <form action="insertdata.php" method="post">
  <table>
<tbody>
<tr>
<td>Name:</td><td> <input id="name" type="text" name="name"></td>
</tr>
<tr>
<td>Address:</td><td> <input id="address" type="text" name="address"></td>
</tr>
<tr>
<td>Latitude:</td><td> <input id="lat" type="text" name="lat"></td>
</tr>
<tr>
<td>Longitude:</td><td> <input id="lng" type="text" name="lng"></td>
</tr>
<tr>
<td>Type:</td><td> <input id="type" type="text" name="type"></td>
</tr>
<tr>
<td>Image(Including Extension):</td><td> <input id="im" type="text" name="link"></td>
</tr>
</tbody>
</table>
<input type="submit" />
<a href=index.php>return</a>
</form>
</div>
</div>
</body>
</html>
