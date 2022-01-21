<?php 
require_once 'includes/initialize.php';
if(!$session->is_logged_in()){ redirect_to("logout.php");}
$id = $_GET['plan_id'];
$csd_result= Contractamountwithdrawdetails::find_by_sql("select * from contract_amount_withdraw_details where plan_id=".$id);
$bhautik_details = Bhautik_lakshya::find_by_sql("select * from bhautik_lakshya where type = 3 and plan_id =".$id);
// pp($bhautik_details);exit;
foreach($csd_result as $data):
$data->delete();
foreach($bhautik_details as $bd):
$bd->delete();
echo alertBox("हटाउन सफल ","contract_final.php?id=".$id);
endforeach;endforeach;
?>
  