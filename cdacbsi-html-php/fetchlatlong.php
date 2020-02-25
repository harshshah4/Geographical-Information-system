<?php
$animal=$_GET['q'];
require("phpsqlajax_dbinfo.php");
$connection=mysql_connect ('localhost', $username, $password);
if (!$connection) {
  die('Not connected : ' . mysql_error());
}
$db_selected = mysql_select_db($database, $connection);

if (!$db_selected) {
  die ('Can\'t use db : ' . mysql_error());
}

$query = "SELECT * 
FROM  `markers` 
WHERE name = '$animal'";

$retval = mysql_query( $query, $connection );
if(! $retval )
{
  die('Could not get data: ' . mysql_error());
}
while($row = mysql_fetch_array($retval))
{
   printf("<div id='lat'>%s</div><div id='long'>%s</div>", $row["lat"], $row["lng"]);
} 
mysql_close($connection);
?>