<%-- 
    Document   : geotest
    Created on : Jun 29, 2014, 7:43:14 AM
    Author     : SHIBABRATA
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="favicon1.ico"/>
  	<title>CDAC-BSI</title>
	  	<style>
	#body-in{background-color:#D5D5D5;}
    #map-canvas {height:430px; width:80%;background-color:#1E1B1B; z-index:2;}
	#hea{ background-color:#fff;height:90px;width:100%;}
	a[href^="http://maps.google.com/maps"]{display:none !important}

	.gmnoprint a, .gmnoprint span {
		display:none;
	}
	.gmnoprint div {
		background:none !important;
	}
	table[Attributes Style] {
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	border-spacing: 0px;
	width: 100%;
	-webkit-margin-start: auto;
	-webkit-margin-end: auto;
	}
	h2,h4 {
	margin: 0px;
	padding: 0px;
	letter-spacing: 1px;
	font-weight: normal;
	color: rgb(47,97,6);
	}
	#menu-wrapper {
	position: relative;
	overflow: visible;
	height: 36px;
	background:rgb(47,97,6);
	text-align: center;
	box-shadow: 0px 0px 0px 5px rgba(0,0,0,0.03);
	border-top-left-radius: 8px;
	border-top-right-radius: 8px;
	border-bottom-left-radius: 8px;
	border-bottom-right-radius: 8px;
	}
    #panel{
		  	position:absolute;
		  	width:20%;
			height:auto;
			z-index:6;
			padding:0px;
			border:1px solid #000;
			background-color:#fff;
			text-align: center;
			right: 0%;
			top:25%;
			border-bottom-left-radius:3px;
			border-bottom-right-radius:3px;
			border-top-left-radius:3px;
			border-top-right-radius:3px;
			border-color:#053214;
			}
	#foo{
			 background-color:#94F6F8;
			 text-align:center;
			 color:#050505;
			 border-top-left-radius: 8px;
			border-top-right-radius: 8px;
			border-bottom-left-radius: 8px;
			border-bottom-right-radius: 8px;
			}
			
    </style>
    <script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script>
	var lat,lng,zm,markers,lati=21.0000,longi=78.0000;
    var customIcons = {
      family: "f.png",      
	  genus: "g.png",
	  species: "s.png"
    };
google.maps.event.addDomListener(window, 'load', codeAddress);
function showHint()
{
var str=document.getElementById("temporary").value;
var xmlhttp=new XMLHttpRequest();
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
     //var jsonObj = JSON.parse(http_request.responseText);
      alert("hello");
  }
//xmlhttp.open("GET","?q="+str,true);
//xmlhttp.send();
}
function codeAddress() {
      var infoWindow = new google.maps.InfoWindow;
		var enteredValue=document.getElementById("temporary").value;
      // Change this depending on the name of your PHP file
      downloadUrl("phpsqlajax_genxml2.php?q="+enteredValue, function(data) {
        var xml = data.responseXML;
        markers = xml.documentElement.getElementsByTagName("marker");
        for (var i = 0; i < markers.length; i++) {
          var name = markers[i].getAttribute("name");
          var address = markers[i].getAttribute("address");
          var type = markers[i].getAttribute("type");
		  var Link = markers[i].getAttribute("link");
          var point = new google.maps.LatLng(
              parseFloat(markers[i].getAttribute("lat")),
              parseFloat(markers[i].getAttribute("lng")));
           var html = "<b>" + name + "</b> <br/><a id=\"loginLink\" onClick=\"toggletable(true);\" onDblClick=\"toggletable(false);\" height=0% href=\"#\">show details</a>";
          var icon = new google.maps.MarkerImage(customIcons[type]);
          var marker = new google.maps.Marker({
            map: map,
            position: point,
            icon: icon,
            shadow: icon.shadow,
			animation:google.maps.Animation.DROP
          });
          bindInfoWindow(marker, map, infoWindow, html);
        }
      });
	  var map = new google.maps.Map(document.getElementById("map-canvas"), {
        center: new google.maps.LatLng(lat,lng),
        zoom: zm,
        mapTypeId: document.getElementById('maptype').value,
      });
				  var animal=document.getElementById("temporary").value;
				  if(animal!="India"){
				  showHint();
				  lat=document.getElementById("lat").innerHTML;
				  lng=document.getElementById("long").innerHTML;
				  zm=4;
				  }
        		  else{
			       lat=21.0000;
			       lng=78.0000;
			       zm=4;
		          }    
      var map = new google.maps.Map(document.getElementById("map-canvas"), {
        center: new google.maps.LatLng(lat,lng),
        zoom: zm,
        mapTypeId: document.getElementById('maptype').value,
      });
    }
	function bindInfoWindow(marker, map, infoWindow, html) {
      google.maps.event.addListener(marker, 'click', function(evt) {
		 lati = evt.latLng.lat();
		 longi = evt.latLng.lng();
		 zoom:4;
	  	 document.getElementById("t2").innerHTML="";
        infoWindow.setContent(html);
        infoWindow.open(map, marker);
      });
    }
	function toggletable(hide)
    {
    if (hide) {
			for (var i = 0; i < markers.length; i++) {
				if(parseFloat(markers[i].getAttribute("lat")).toFixed(6)==lati.toFixed(6) && parseFloat(markers[i].getAttribute("lng")).toFixed(6)==longi.toFixed(6))
						document.getElementById("t2").innerHTML="<table style=\" color:#2D6E39; \"; width=\"100%\" height=\"100%\" border=\"1\" id=\"loginTable\" cellspacing=\"3\"><caption>DETAILS</caption><tr><th scope=\"row\">Name</th><td>"+ markers[i].getAttribute("name") +"</td></tr><tr><th scope=\"row\">ADDRESS</th><td>"+markers[i].getAttribute("address")+"</td></tr><tr><th scope=\"row\">Latitude</th><td>"+ markers[i].getAttribute("lat") +"</td></tr><tr><th scope=\"row\">longitude</th><td>"+ markers[i].getAttribute("lng")  +"</td></tr><tr style=\" height:auto;\"><th scope=\"row\">Type</th><td>"+ markers[i].getAttribute("type") +"</td></tr></table><br/><img height=\"245\" width=\"99.5%\" style=\"border:none\" src=\""+ markers[i].getAttribute("link")+"\"/>";
						
				}
          } else {
	  	  document.getElementById("t2").innerHTML="";
     }
   }
    function downloadUrl(url, callback) {
      var request = window.ActiveXObject ?
          new ActiveXObject('Microsoft.XMLHTTP') :
          new XMLHttpRequest;

      request.onreadystatechange = function() {
        if (request.readyState == 4) {
          request.onreadystatechange = doNothing;
          callback(request, request.status);
        }
      };
      request.open('GET', url, true);
      request.send(null);
    }
    function doNothing() {}
	function ayu()
	{
	document.getElementById("temporary").value="";
	}
	$(function(){
            $("#getAllPlants").submit(function(){
               
                var formInput=$(this).serialize();
                 $.getJSON('geotest/getAllPlants.action', formInput,function(data) {
                    $('.result').html(alert("success")); 
                 });
                 return false;
            });
        });
    //]]>
  </script>

    </head>
   <body onLoad="codeAddress">
  <header>
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
</header>
<div id="menu-wrapper" align="center">
   <font size="+2" color="#F4F3F3">Map Legends</font>
		<font color="#F8F7F7">
        <img src="f.png" height="30"/>Family
 		<img src="g.png" height="30"/>Genus
		<img src="s.png" height="30"/>Species</font>
	<select id="maptype" name="mapType" style=" border:none; background:#FDFDFD; height:30px; float:right;" onChange="codeAddress()">
     <option value="terrain">TERRIAN</option>
     <option value="satellite">SATELLITE</option>
     <option value="hybrid">HYBRID</option>
     <option value="roadmap">ROAD MAP</option>
   </select>
   </div>
   <div>
<marquee bgcolor="#FFFFFF" style="z-index:4;">Get information about location of plants</marquee>
</div>

 				<div style="background:rgb(47,97,6)"><table  border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                <tbody>
                <tr>
                <td>
             
                <div id="map-canvas" style="width:80%;" ></div></td>
               
              <div id="panel">	
                  <form action="getAllPlants" id="plantsearch">
                        <input name="temporary" id="temporary" required="true" type="textbox" value="India" style=" border:none; color:#2D6E39; height: 40px; width:70%;" onFocus="ayu()">
                        <input type="submit">
                      
                        <!--<input type="image" src="search-green-icon.png" height="25" width="30" onClick="codeAddress()"> -->
                                </form>    

                  <div id="t2" style=" width:100%; height:100%;" ></div>
              </div>
            <div id="txtHint" style="visibility:hidden; position:absolute"></div></tr></tbody></table></div>	
<footer>
  <div id="foo">
  <table>
  <tbody>
  <tr>
  <td>
	  BSI, CGO Complex, 3rd MSO Building, Block-F(5th & 6th)Floor, DF Block Sector-I, Saltlake City, Kolkata-700-064, WESTBENGAL<br/>
      <center>Site maintained by CDAC-KOLKATA
    <div>
    </td>
                          
                                <td>                                                                              
                                    <a href="https://www.facebook.com/pages/Botanical-Survey-of-India/135241593172793#" target="_blank">
                                        <img src="icon_facebook_grey.png" height="30" width="30">
                                    </a>
                                </td>  
                                <td>
                                    <a href="#">
                                        <img src="icon_twitter_grey.png" height="30" width="30">
                                    </a>
                                </td>
                                <td>
                                    <a href="http://www.youtube.com/results?search_query=botanical+survey+of+india%2Bflora+of+india&amp;oq=botanical+survey+of+india%2Bflora+of+india&amp;gs_l=youtube.3...22421.25156.0.25427.15.15.0.0.0.0.170.1449.7j8.15.0...0.0...1ac.1.11.youtube.azpf1DCglVM" target="_blank">
                                        <img src="icon_youtube_grey.png" height="30" width="30">
                                    </a>
                                </td>

                                <td>
                                    <a href="#">
                                        <img src="icon_blogger_grey.png" height="30" width="30">
                                    </a>
                                </td>  
                            </tr>
                        </tbody></table>
                    </td>
                </tr>
            </tbody></table>
    </div>
  </footer>
  </body>

</html>
