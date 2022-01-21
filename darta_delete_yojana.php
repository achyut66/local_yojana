<?php 
require_once("includes/initialize.php");
$plan_id = $_GET['id'];
$details_plan = Plandetails1::find_by_id($plan_id);
$plan_total = Plantotalinvestment::find_by_plan_id($plan_id);
$plan_total1 = AmanatLagat::find_by_plan_id($plan_id);
$plan_total2 = Quotationtotalinvestment::find_by_plan_id($plan_id);
$plan_total3 = Samitiplantotalinvestment::find_by_plan_id($plan_id);
$plan_total4 = Ethekka_lagat::find_by_plan_id($plan_id);
$plan_total5 = Contractinfo::find_by_plan_id($plan_id);
// $plan_deactivate = DeactivePlan::find_by_plan_id($plan_id);

if(empty($plan_total) && empty($plan_total1) && empty($plan_total2) && empty($plan_total3) && empty($plan_total4) && empty($plan_total5)){
    if ($details_plan->delete()) {
        echo alertBox("योजना दर्ता हटाउन सफल", "plan_form_delete.php");
    }
}else{
        echo alertBox("योजना सम्झौता भैसकेको छ !! त्यसकारण योजना दर्ता हटाउन असफल हुनुभयो !!", "plan_form_delete.php");
}
?>