<?php
require_once("includes/initialize.php");
$res= array();
$plan_id= $_POST['plan_id'];
$result = MarmatSamharSetting::find_by_plan_id($plan_id);
if($result == "")
{
    $html= MarmatSamharSetting::find_by_type(1);
    
}
else
{
    $html = $result;
}
$res['html']= (double) $html;
echo json_encode($res);exit;