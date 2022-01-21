<?php
require_once("includes/initialize.php"); 
error_reporting(0);
global $database;
$plan_id=$_GET['plan_id'];
$bhautil_lak = Bhautik_lakshya::find_by_sql("select * from bhautik_lakshya where type=3 and plan_id=".$plan_id);
$plan_amount_with = Planamountwithdrawdetails::find_by_plan_id($plan_id);
$katti_details = Kar_Bibran::find_by_sql("select * from kar_bibaran where darta_id =".$plan_id);
foreach($bhautil_lak as $bhautil_lak):
    if($bhautil_lak->delete()){
        alertBox("deleted", "quotation_plan_form5.php");
    }
    
endforeach;
$plan_amount_with->delete();
foreach($katti_details as $katti_details):
    $katti_details->delete();
endforeach;
redirect_to("quotation_plan_form5.php");
// alertBox("भुक्तानी विवरण हतौना सफल !!!", "quotation_plan_form5.php");
?>