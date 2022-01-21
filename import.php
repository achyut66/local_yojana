<?php require_once("includes/initialize.php");
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
global $new_plan_id;
global $sanchalan_prakiya;
$mode=getUserMode();
if ($mode!="administrator" && $mode!="superadmin") {
    die("ACCESS DENIED");
}

function toArray($db, $result_set)
{
    $object_array = array();
    while ($row = $db->fetch_array($result_set)) {
        $object_array[]= instantiate($row);
    }
    return $object_array;
}

function instantiate($record)
{
    $record = filter_indices($record);
    $object = new \stdClass();
    foreach ($record as $attribute=>$value) {
        if ($attribute) {
            $object->$attribute=$value;
        }
    }
    return $object;
}

function query($sql)
{
    global $database;
    $result_set=$database->query($sql);
    return toArray($database, $result_set);
}

function query_prev($sql)
{
    global $database_prev;
    $result_set=$database_prev->query($sql);
    return toArray($database_prev, $result_set);
}

function copy_data($table, $sql)
{
    // old database
    $results = query_prev($sql);
    
    if (!empty($results)) {
        // new database
        foreach ($results as $result) {
            if (!empty($result)) {
                create($table, $result);
            }
        }
    }
}

function create($table, $array)
{
    global $new_plan_id;
    $array = (array) $array;
    unset($array['id']);
    if (!empty($array['plan_id'])) {
        $array['plan_id'] = $new_plan_id;
    }
    global $database;
    $sql = "insert into ". $table ."(";
    $sql .= join(",", array_keys($array));
    $sql .=") values ('";
    $sql .= join("', '", array_values($array));
    $sql .= "')";
    if ($database->query($sql)) {
        $id = $database->insert_id();
        if ($table == 'plan_details1') {
            $new_plan_id = $id;
        }
        return $id;
    } else {
        return false;
    }
}

function filter_indices($arr)
{
    $keys = array_keys($arr);
    foreach ($keys as $key => $value) {
        if ($key%2==0) {
            unset($keys[$key]);
        }
    }
    $keys = array_values($keys);
    $r = [];
    foreach ($keys as $key => $value) {
        $r[$value] = $arr[$value];
    }
    return $r;
}

function print_arr($arr)
{
    echo "<pre>";
    print_r($arr);
    echo "</pre>";
}

if (isset($_POST['submit'])) {
    // find plan id in old db
    $plan_prev = query_prev("select * from plan_details1 where id={$_POST['plan_id']}");
    if (empty($plan_prev)) {
        echo alertBox("योजना भेटिएन", "import.php");
    }
    if (empty($plan_prev[0])) {
        echo alertBox("योजना भेटिएन", "import.php");
    }
    start_importing($plan_prev[0]);
    echo alertBox("सफलता पुर्वक सारिएको छ। ", "import.php?old_yojana_no={$_POST['plan_id']}&new_yojana_no={$new_plan_id}&sanchalan_prakiya={$sanchalan_prakiya}");
}

function start_importing($plan_prev)
{
    global $sanchalan_prakiya;
    $samiti_plan_total=query_prev("select * from samiti_plan_total_investment where plan_id={$plan_prev->id}");
    $contract_plan_total=query_prev("select * from contract_info where plan_id={$plan_prev->id}");
    $amanat_lagat=query_prev("select * from amanat_lagat where plan_id={$plan_prev->id}");
    $customer_lagat=query_prev("select * from plan_total_investment where plan_id={$plan_prev->id}");
    $quotation_lagat=query_prev("select * from quotation_total_investment where plan_id={$plan_prev->id}");
    if ($plan_prev->type==1) {
        $sanchalan_prakiya = "कार्यक्रम मार्फत ";
    } elseif ($plan_prev->type==0 && !empty($samiti_plan_total)) {
        $sanchalan_prakiya = "संस्था / समिति मार्फत ";
        sastha($plan_prev->id);
    } elseif ($plan_prev->type==0 && !empty($contract_plan_total)) {
        $sanchalan_prakiya = "ठेक्का मार्फत ";
        thekka($plan_prev->id);
    } elseif ($plan_prev->type==0 && !empty($amanat_lagat)) {
        $sanchalan_prakiya = "अमानत मार्फत ";
        amanat($plan_prev->id);
    } elseif ($plan_prev->type==0 && !empty($customer_lagat)) {
        $sanchalan_prakiya = "उपभोक्ता मार्फत ";
        upobhokta($plan_prev->id);
    } elseif ($plan_prev->type==0 && !empty($quotation_lagat)) {
        $sanchalan_prakiya = "कोटेसन मार्फत";
        quotation($plan_prev->id);
    } else {
        $sanchalan_prakiya = "सम्झौता हुन बाँकि";
    }

    return $sanchalan_prakiya;
    return $sanchalan_prakiya;
}

function build_query($table, $plan_id, $is_id=false)
{
    if ($is_id) {
        return "select * from {$table} where id={$plan_id}";
    } elseif ($table == 'letter_format') {
        return "select * from {$table} where plan_type={$plan_id}";
    } else {
        return "select * from {$table} where plan_id={$plan_id}";
    }
}

function query_and_copy($table, $plan_id, $is_id=false)
{
    $sql = build_query($table, $plan_id, $is_id);
    copy_data($table, $sql);
}

function amanat($plan_id)
{
    query_and_copy("plan_details1", $plan_id, true);
    query_and_copy("amanat_lagat", $plan_id);
    query_and_copy("amanat_more_details", $plan_id);
    query_and_copy("bhautik_lakshya", $plan_id);
    query_and_copy("analysis_based_withdraw", $plan_id);
    query_and_copy("plan_amount_withdraw_details", $plan_id);
    query_and_copy("plan_starting_fund", $plan_id);
}

function sastha($plan_id)
{
    query_and_copy("plan_details1", $plan_id, true);
    query_and_copy("samiti_analysis_based_withdraw", $plan_id);
    query_and_copy("samiti_costumer_association_details", $plan_id);
    query_and_copy("samiti_costumer_association_details_0", $plan_id);
    query_and_copy("samiti_investigation_association_details", $plan_id);
    query_and_copy("samiti_more_plan_details", $plan_id);
    query_and_copy("samiti_plan_amount_withdraw_details", $plan_id);
    query_and_copy("samiti_plan_starting_fund", $plan_id);
    query_and_copy("samiti_plan_time_addition_affiliation", $plan_id);
    query_and_copy("samiti_plan_total_investment", $plan_id);
    query_and_copy("samiti_profitable_family_details", $plan_id);
    query_and_copy("samiti_public_investigation_details", $plan_id);
}

function thekka($plan_id)
{
    query_and_copy("plan_details1", $plan_id, true);
    query_and_copy("contract_amount_withdraw_details", $plan_id);
    query_and_copy("contract_analysis_based_withdraw", $plan_id);
    query_and_copy("contract_bid", $plan_id);
    query_and_copy("contract_bid_final", $plan_id);
    // query_and_copy("contract_details", $plan_id);
    query_and_copy("contract_dharauti", $plan_id);
    query_and_copy("contract_dharuti_add", $plan_id);
    query_and_copy("contract_dharuti_firta", $plan_id);
    // query_and_copy("contract_document", $plan_id);
    query_and_copy("contract_entry_final", $plan_id);
    query_and_copy("contract_info", $plan_id);
    query_and_copy("contract_invitation_entry", $plan_id);
    query_and_copy("contract_invitation_for_bid", $plan_id);
    query_and_copy("contract_more_details", $plan_id);
    query_and_copy("contract_starting_fund", $plan_id);
    query_and_copy("contract_time_addition_affiliation", $plan_id);
    query_and_copy("contract_total_investment", $plan_id);
}

function quotation($plan_id)
{
    query_and_copy("plan_details1", $plan_id, true);
    query_and_copy("quotation_enlist_form", $plan_id);
    query_and_copy("quotation_letter_content", $plan_id);
    query_and_copy("quotation_more_details", $plan_id);
    query_and_copy("quotation_total_investment", $plan_id);
    query_and_copy("letter_format", $plan_id);
    // query_and_copy("letter_indices", $plan_id);
    query_and_copy("plan_amount_withdraw_details", $plan_id);
    query_and_copy("analysis_based_withdraw", $plan_id);
}

function upobhokta($plan_id)
{
    query_and_copy("plan_details1", $plan_id, true);
    query_and_copy("plan_total_investment", $plan_id);
    query_and_copy("plan_time_addition_affiliation", $plan_id);
    query_and_copy("plan_starting_fund", $plan_id);
    query_and_copy("profitable_family_details", $plan_id);
    query_and_copy("plan_amount_withdraw_details", $plan_id);
    query_and_copy("investigation_association_details", $plan_id);
    query_and_copy("costumer_association_details", $plan_id);
    query_and_copy("costumer_association_details_0", $plan_id);
    query_and_copy("bhautik_lakshya", $plan_id);
    query_and_copy("analysis_based_withdraw", $plan_id);
}

?>

<?php

if (!empty($_GET)) {
    $old_yojana_no = $_GET['old_yojana_no'];
    $s_p = $_GET['sanchalan_prakiya'];
    $new_yojana_no = $_GET['new_yojana_no'];
}

?>


<?php include("menuincludes/header.php");
include("menuincludes/calculator_header.php");?>

<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner">

        <div class="maincontent">
            <h2 class="headinguserprofile"> नया योजनाको विवरण | <a href="index.php" class="btn">पछि जानुहोस </a></h2>

            <div class="OurContentFull">
                <div class="myMessage"> <?php echo $message;?>
                </div>
                <form action="" method="post">
                    <div class="userprofiletable" style="height: 100vh">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">आर्थिक वर्ष</label>
                                    <select style="height:34px" class="form-control" name="" id="">
                                        <option value="">२०७७/७८</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">आर्थिक वर्ष</label>
                                    <select style="height:34px" class="form-control" name="" id="">
                                        <option value="">२०७८/७९</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">योजना दर्ता न.</label>
                                    <input type="text" required name="plan_id" class="form-control" placeholder="">
                                </div>
                                <div class="saveBtn myCenter">
                                    <input type="submit" id="first_check" name="submit" value="दाइत्तो सार्नुहोस"
                                        class="btn">
                                </div>
                            </div>
                            <?php
                                if (!empty($_GET)) {
                                    ?>
                            <div class="col-md-6">
                                <br>
                                <h3>दाइत्तो सारिएको विवरण </h3>
                                <table class="table">
                                    <tr>
                                        <td>पुरानो योजना दर्ता न.</td>
                                        <td><?=$old_yojana_no?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>योजना संचालन प्रकिरिया </td>
                                        <td><?=$s_p?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>नया योजना दर्ता न.</td>
                                        <td><?=$new_yojana_no?>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <?php
                                }
                            ?>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div><!-- main menu ends -->
    <!--</div><!-- top wrap ends -->-->
    <!--<?php include("menuincludes/footer.php"); ?>-->

    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Raleway'>
    <link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    <link rel="stylesheet" href="multiselect/css/style.css">
    <script src="multiselect/js/index.js"></script>