<?php

$con=mysqli_connect("localhost","root","","yellow pages");
// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
if($_GET['q']=="company")
{
// escape variables for security
$name = mysqli_real_escape_string($con, $_POST['id']);
$type = mysqli_real_escape_string($con, $_POST['cityid']);
$address = mysqli_real_escape_string($con, $_POST['name']);
$lat = mysqli_real_escape_string($con, $_POST['establishedyear']);
$lng = mysqli_real_escape_string($con, $_POST['location']);
$link = mysqli_real_escape_string($con, $_POST['noofemployees']);
$sql="INSERT INTO company VALUES ('".$name."', '".$type."', '".$address."','".$lat."','".$lng."','".$link."')";
}
if($_GET['q']=="companybranch")
{
// escape variables for security
$name = mysqli_real_escape_string($con, $_POST['id']);
$type = mysqli_real_escape_string($con, $_POST['companyid']);
$address = mysqli_real_escape_string($con, $_POST['location']);
$lat = mysqli_real_escape_string($con, $_POST['description']);
$sql="INSERT INTO companybranch VALUES ('".$name."', '".$type."', '".$address."','".$lat."')";
}
if($_GET['q']=="companyproduct")
{
// escape variables for security
$name = mysqli_real_escape_string($con, $_POST['id']);
$type = mysqli_real_escape_string($con, $_POST['companyid']);
$address = mysqli_real_escape_string($con, $_POST['name']);
$lat = mysqli_real_escape_string($con, $_POST['image']);
$lng = mysqli_real_escape_string($con, $_POST['description']);
$link = mysqli_real_escape_string($con, $_POST['price']);
$sql="INSERT INTO companyproduct VALUES ('".$name."', '".$type."', '".$address."','".$lat."','".$lng."','".$link."')";
}
if($_GET['q']=="city")
{
// escape variables for security
$name = mysqli_real_escape_string($con, $_POST['id']);
$type = mysqli_real_escape_string($con, $_POST['countryid']);
$address = mysqli_real_escape_string($con, $_POST['name']);
$lat = mysqli_real_escape_string($con, $_POST['image']);
$sql="INSERT INTO city VALUES ('".$name."', '".$type."', '".$address."','".$lat."')";
}
if($_GET['q']=="country")
{
// escape variables for security
$name = mysqli_real_escape_string($con, $_POST['id']);
$type = mysqli_real_escape_string($con, $_POST['name']);
$address = mysqli_real_escape_string($con, $_POST['image']);
$sql="INSERT INTO country VALUES ('".$name."', '".$type."', '".$address."')";
}

if (!mysqli_query($con,$sql)) {
  die('Error: ' . mysqli_error($con));
}

echo "<script>
alert('Data added successfully');
window.location.href='index.php';
</script>";

mysqli_close($con);
?>
