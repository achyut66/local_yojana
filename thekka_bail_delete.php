<?php require_once 'includes/initialize.php';
if(!$session->is_logged_in()){ redirect_to("logout.php");}
$id = $_GET['id'];
$result = ThekkaBail::delete_by_id($id);
if($result){
    echo alertBox("हटाउन सफल !!!!", 'thekka_dharauti.php');
}
?>