<?php
 require_once("includes/initialize.php"); 
 if(!$session->is_logged_in()){ redirect_to("logout.php");}
$plan_id=$_GET['plan_id'];
$result= Contractanalysisbasedwithdraw::find_by_plan_id($plan_id);
$bhautik_details = Bhautik_lakshya::find_by_plan_id_and_type_payment_count($plan_id,3,1);
// pp($bhautik_details);exit;
foreach($result as $data)
{
    $data->delete();

}
foreach($bhautik_details as $bd){
    $bd->delete();
}
redirect_to("contract_form3.php");