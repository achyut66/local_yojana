<?php
require_once("includes/initialize.php");
$id = $_GET['id'];
$black_list = CostumerBlackList::find_by_plan_id($id);
// pp($black_list);
if(!empty($black_list))
{
    foreach($black_list as $bl):
    $bl->delete();{
        echo alertBox("कालो सूचीबाट हटाउन सफल !!!", "kalo_suchi_upabhokta_list.php");
    }
endforeach;
}
?>