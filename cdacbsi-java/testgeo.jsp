<%-- 
    Document   : testgeo
    Created on : Jun 23, 2014, 12:57:01 PM
    Author     : desd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="C:\Users\desd\Desktop\GIS-BSI\GIS\GIS\favicon1.ico" />
        <title>BSI-GIS</title>
        <style>
	#body-in{
		background-color:#D5D5D5;
		
		}
       #map-canvas {
        height: 100%;
        margin: 5px;
        padding: 0px;
		z-index: 5;
      }

	  #header{
		  height:90px;
		  width:100%;
		  }
      #panel{
	position: absolute;
	top: 170px;
	margin-left: -180px;
	z-index: 5;
	padding: 5px;
	border: 1px solid #000;
	background-color: #fff;
	text-align: center;
	left: 85%;
		 }
		 #foo{

			 background-color:#94F6F8;
			 text-align:center;
			 color:#050505;}
			

    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script>

var geocoder;
var map;
function initialize() {
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(22.572646, 88.363895);
  var mapOptions = {
    zoom: 6,
    center: latlng
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}
	

function codeAddress() {
	var mapper;

	var input=document.getElementById("temporary").value;
	if(input=="tiger")
	{
		mapper="sundernbans";
	}
	else if (input=="kangaroo")
	{
		mapper="perth";
	}
	document.getElementById("address").value=mapper;
	var address = document.getElementById('address').value;
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}
	

google.maps.event.addDomListener(window, 'load', initialize);

  </script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		
    </head>
    <body>
        <s:form id="frmBooks" name="frmBooks" action="search" method="post">
        <div id="header" style="background-color:#94F6F8;">
  <div style="float:left" >
    <img src="http://upload.wikimedia.org/wikipedia/en/7/72/Botanical_Survey_of_India_Logo.gif"/>
    </div>
    <div style="float:left">
    <h3>Government Of India <br/>
      Ministry Of Environment and Forests<br/>
      <font size:60><b>Botanical Survey Of India</b></font></h3>
    </div>
	<div id="logo">
	<img src="C:\Users\desd\Desktop\GIS-BSI\GIS\GIS" height="90px" align="right"/>	
	</div>
 </div>
 <div style="float:inherit"><font size="+2">Map Legends</font>:
 		<img src="image\icon1.jpg" width="50px" height="30"/>Genus
		<img src="image\icon2.jpg"  width="50" height="30"/>Family
		<img src="image\icon3.jpg"  width="50" height="30"/>Order
		<img src="image\icon4.jpg" width="50" height="30"/>Classs
  			
 			<marquee bgcolor="#CCFFFF">Get information about location of plants					</marquee>
 </div>
 <div id="body-in">
				<div id="map-canvas" style="height:430px; width:65%; ">
				</div>
			
 				 <div id="panel" style="width:30%">
    				<s:form>
     				 	<input id="plant" type="textbox" onClick="codeAddress()">    														<input type="button" value="Geocode" onClick="codeAddress()">
   				 	 </s:form>
					<div>
                                            <s:form>
                                                <table border="1">
                                                    <thead>
                                                        <tr>
                                                            <th>NAME</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </s:form>
				  </div>
   </div>    
 </div>


  	<div id="foo" >
  	 			 <p>BSI,CGO Complex ,3rd MSO Building ,Block-F(5th & 6th)Floor ,DF Block Sector-I 	,Saltlake City , Kolkata-700-064 ,WESTBENGAL<br/>
      Site maintained by CDAC-KOLKATA</p>
  	</div>
        </s:form>
    </body>
</html>
