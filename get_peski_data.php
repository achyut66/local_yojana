<?php 
    require_once("includes/initialize.php");
    $peski_id = $_POST['name'];
    $data4 = Planstartingfund::find_by_peski($peski_id);
    // print_r($data4);
    echo json_encode($data4);

    
