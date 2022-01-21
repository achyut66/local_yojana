<?php
include_once('includes/initialize.php');

if(isset($_POST['save']))
{
    $form_data = new SettingbhautikPariman();
    $form_data->name= $_POST['name'];
    if(!empty($_POST['parent_id'])) {
        $form_data->parent_id= $_POST['parent_id'];
    } else if($_POST['parent_id'] == 0) {
        $form_data->parent_id= $_POST['parent_id'];
    } 
    $form_data->save();

}
$res['id'] = $form_data->id;
$res['name'] = $_POST['name'];
$res['parent_id'] = $_POST['parent_id'];
echo json_encode($res);exit;
?>
