<?php
require_once("includes/initialize.php");
$data1 = $_POST['name'];
// pp($data1);
$data = ThekkaBail::find_by_id($data1);
echo json_encode($data);