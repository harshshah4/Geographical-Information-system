<?php
if($_POST["User"] == 'Harsh' && $_POST["Password"]=='Harsh'){
echo "<script>
window.location.href='Admin.php';
</script>";
}
else{
echo "<script>
window.location.href='Index.php';
</script>";
}
?>