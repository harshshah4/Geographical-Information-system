<html xmlns="http://www.w3.org/1999/xhtml">
  <head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<link rel="shortcut icon" href="favicon1.ico"/>
  	<title>CDAC-BSI</title>
	  	<link href="stylesheet.css" type="text/css" rel="stylesheet">
    <script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
	<script>
	var nme,type,name,place,description,imag;
	var lat,longit,zm,markers,lati=21.0000,longi=78.0000;
    var customIcons = {
      family: "f.png",      
	  genus: "g.png",
	  species: "s.png"
    };
google.maps.event.addDomListener(window, 'load', codeAddress);
function codeAddress() {
      var infoWindow = new google.maps.InfoWindow;
		var enteredValue=document.getElementById("temporary").value;
	  document.getElementById("t2").innerHTML="";
	  nme=document.getElementById("temporary").value;
	  lat=25.000000;longit=78.000000;
	  if(nme=="neem"){type='family';lati=29.950000;longi=78.170000;}
	  if(nme=="tulsi"){type='genus';lati=25.000000;longi=72.000000;}
	  if(nme=="chandan"){type='species';lati=12.000000;longi=77.000000;}
	  var html = "<b>" + nme + "</b> <br/><a id=\"loginLink\" onClick=\"toggletable(true);\" onDblClick=\"toggletable(false);\" height=0% href=\"#\">show details</a>";
	  var icon = new google.maps.MarkerImage(customIcons[type]);
      var map = new google.maps.Map(document.getElementById("map-canvas"), {
        center: new google.maps.LatLng(lat,longit),
        zoom: zm,
        mapTypeId: document.getElementById('maptype').value,
      });
	  var point=new google.maps.LatLng(lati,longi);
	  if(document.getElementById("temporary").value=="neem")
	  {
		  nme="neem";
		  place="Haridwar";
		  description="*Antifungal<br/>*Antibacterial"
		  imag="p1.jpg";
		  var marker = new google.maps.Marker({
            map: map,
            icon: icon,
			position: point,
            animation:google.maps.Animation.DROP
          });
          bindInfoWindow(marker, map, infoWindow, html);
	  }
	  if(document.getElementById("temporary").value=="tulsi")
	  {
		  nme="tulsi";
		  place="Mt. Abu";
		  description="*Antibiotic<br/>*Antioxidant"
		  imag="p2.jpg";
		  var marker = new google.maps.Marker({
            map: map,
            icon: icon,
			position: point,
            animation:google.maps.Animation.DROP
			});
          bindInfoWindow(marker, map, infoWindow, html);
	  }
	  if(document.getElementById("temporary").value=="chandan")
	  {
		  nme="Chandan";
		  place="Bangaluru";
		  description="*Beauty Care<br/>*Hair Care"
		  imag="p3.png";
		  var marker = new google.maps.Marker({
            map: map,
            icon: icon,
			position: point,
            animation:google.maps.Animation.DROP
          });
          bindInfoWindow(marker, map, infoWindow, html);
	  }
        
	  		  var animal=document.getElementById("temporary").value;
				  if(animal!="India"){
				  lat=document.getElementById("lat").innerHTML;
				  longit=document.getElementById("long").innerHTML;
				  zm=4;
				  }
        		  else{
			       lat=21.0000;
			       longit=78.0000;
			       zm=4;
		          }    
      var map = new google.maps.Map(document.getElementById("map-canvas"), {
        center: new google.maps.LatLng(lat,longit),
        zoom: zm,
        mapTypeId: document.getElementById('maptype').value,
      });
    }
	function bindInfoWindow(marker, map, infoWindow, html) {
      google.maps.event.addListener(marker, 'click', function(evt) {
		 lati = evt.latLng.lat();
		 longi = evt.latLng.lng();
		 zoom:4;
	  //	 document.getElementById("t2").innerHTML="";
        infoWindow.setContent(html);
        infoWindow.open(map, marker);
      });
    }
	function toggletable(hide)
    {
    if (hide) {
			document.getElementById("t2").innerHTML="<table style=\" color:#2D6E39; \" width=\"100%\" height=\"100%\" border=\"1\" id=\"loginTable\" cellspacing=\"3\"><caption>DETAILS</caption><tr><th scope=\"row\">Name</th><td>"+ nme +"</td></tr><tr><th scope=\"row\">Place</th><td>"+ place +"</td></tr><tr><th scope=\"row\">Desc</th><td>"+ description +"</td></tr></table><br/><img height=\"245\" width=\"99.5%\" style=\"border:none\" src=\""+ imag+"\"/>";
          } else {
			document.getElementById("t2").innerHTML="";
     }
   }
    
	function ayu()
	{
	document.getElementById("temporary").value="";
	}
	
    //]]>
  </script>
  </head>
  <body onload="codeAddress">
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
 		<img src="g.png" height="20"/>Genus
		<img src="s.png" height="20"/>Species</font>
		&nbsp;
		&nbsp;
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
				    <input id="temporary" type="textbox" value="India" style=" border:none; color:#2D6E39; height: 40px; width:70%;" class="auto" onfocus="ayu()"><input type="image" src="search-green-icon.png" height="25" width="30" onClick="codeAddress()"> 
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