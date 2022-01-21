<?php
 	require_once("includes/initialize.php"); 
 	error_reporting(0);
 	global $database;
 	if(!$session->is_logged_in()){ redirect_to("logout.php");}
	$plan_id=$_GET['plan_id'];
    // print_r($plan_id);exit;
$result=Samitiplanamountwithdrawdetails::find_by_plan_id($plan_id);
$katti_details = Bhautik_lakshya::find_by_sql("select * from bhautik_lakshya where type=3 and plan_id=".$plan_id);
if(empty($result)){
    echo alertBox("टेबलमा डेटा खालि छ !!!",'samiti_plan_form5.php');
}else{
    $data=  Samitiplanamountwithdrawdetails::find_by_plan_id($plan_id);
    if ($data->delete()) {
        echo alertBox("विवरण हटाउन सफल !!!", "samiti_plan_form5.php");
    }
    // $data->delete();
    $sql = "DELETE FROM kar_bibaran WHERE darta_id = $plan_id";
    $sql1 = "delete from katti_details where plan_id = $plan_id";
    $result1 = $database->query($sql);
    $result2 = $database->query($sql);
    if ($result1 && $result2) {
        redirect_to("samiti_plan_form5.php");
    } else {
        redirect_to("samiti_plan_form5.php");
    }
}
foreach($katti_details as $kd):
$kd->delete();
endforeach;
?>