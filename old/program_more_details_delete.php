<?php 
require_once 'includes/initialize.php';
if(!$session->is_logged_in()){ redirect_to("logout.php");}
$program_id=$_GET['program_id'];
$id=$_GET['id'];
  $program_more_details   =  Programmoredetails::find_by_id($id);
  if($program_more_details->delete())
  {
    echo   alertBox("हटाउन सफल ", "program_more_details.php?id=".$program_id);
  }
?>

