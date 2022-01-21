<?php require_once("includes/initialize.php");
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
if (!isset($_GET['id']) && isset($_SESSION['set_plan_id'])) {
    redirectUrl();
}

$ward_address=WardWiseAddress();
$address= getAddress();
$plan_details=Plandetails1::find_by_id($_GET['id']);
$invest_details=Plantotalinvestment::find_by_plan_id($_GET['id']);
$profile_details = EstimateLagatProfile::find_by_plan_id($_GET['id']);
$sql = "select * from estimate_lagat_anuman where plan_id=".$_GET['id']." order by sno asc";
$lagat_details = Estimatelagatanuman::find_by_sql($sql);
$data1 = Plandetails1::find_by_id($_GET['id']);
$postnames      = Postname::find_all();
$units          = Units::find_all();
$work_details   = Worktopic::find_all();
$estimate_adds = Estimateadd::find_all();
$estimate_details = Estimateanudandetails::find_by_plan_id($_GET['id']);
$added_investment = $data1->investment_amount+ $estimate_details->other_source + $estimate_details->other_agreement;
$con = get_contingency_for_plan($_GET['id']);
$contingency = $added_investment* $con;

//$data2      =  Plantotalinvestment::find_by_plan_id($_GET['id']);
//$data3      = Moreplandetails::find_by_plan_id($_GET['id']);
//$data4      = Costumerassociationdetails0::find_by_plan_id($_GET['id']);
$fiscal     = FiscalYear::find_by_id($data1->fiscal_id);

$abstract_profile = AbstractProfile::find_by_plan_version($_GET['id']);
$sql = "select * from abstract_cost where plan_id=".$_GET['id']." and version=".$abstract_profile->version." order by id asc";
$abstract_details = AbstractCost::find_by_sql($sql);
if (empty($abstract_profile)) {
    $abstract_profile = EstimateLagatProfile::setEmptyObjects();
}

include("menuincludes/header.php");
?>
<!-- js ends -->
<title>लागत अनुमान फाराम । print page:: <?php echo SITE_SUBHEADING;?>
</title>

</head>

<body onload="window.print()">
    <?php // include("menuincludes/topwrap.php");?>
    <div id="body_wrap_inner">

        <div class="maincontent">
            <div class="OurContentFull">

                <div class="mydate myFont10">म.ले.प. फाराम नं १६७</div>
                <div class="userprofiletable" id="div_print">
                    <div class="printPage">
                        <div class="printlogo"><img src="images/emblem_nepal.png" alt="Logo"></div>
                        <h1 class="marginright1 letter_title_one"><?php echo SITE_LOCATION;?>
                        </h1>
                        <h4 class="margin1em letter_title_two"><?php echo $address;?>
                        </h4>
                        <h4 class="margin1em letter_title_three"><?php echo SITE_ADDRESS;?>
                        </h4>
                        <div class="myspacer"></div>
                        <div class="subjectbold1 myCenter letter_subject">लागत अनुमान फाराम </div>
                        <div class="myspacer10"></div>
                        <div class="textdetails">
                            <div class="mydate">मिति : <?=convertedcit($profile_details->date_nepali)?>
                            </div>
                            <div><b>आर्थिक बर्ष :- </b> <?=convertedcit($fiscal->year)?>
                            </div>
                            <div>योजनाको नाम :- </b> <?=$data1->program_name?>
                            </div>
                            <div class="mydate">योजना दर्ता नं:- </b> <?=convertedcit($data1->id)?>
                            </div>

                            <div> ठेगाना :- </b> <?=SITE_FIRST_NAME?>
                                - <?=convertedcit($data1->ward_no)?>
                            </div>



                            <!-- table ends -->
                        </div>
                        <div class="printContent">



                            <div class="myWidth100">

                                <table class="table-bordered myWidth100" style="font-size:10px;">
                                    <thead>
                                        <tr>
                                            <th>सि.नं.</th>
                                            <th colspan="3">विवरण</th>
                                            <th>परिमाण</th>
                                            <th>इकाई</th>
                                            <th>दर</th>
                                            <th>जम्मा लागत रु.</th>
                                        </tr>
                                    </thead>

                                    <?php
                                    $count = 1;
                                    foreach ($abstract_details as $lagat_detail):
                                ?>
                                    <tr>
                                        <td><?=convertedcit($count)?>
                                        </td>
                                        <td colspan="3"><?=$lagat_detail->name?>
                                        </td>
                                        <td><?=convertedcit($lagat_detail->quantity)?>
                                        </td>
                                        <td>
                                            <?php
                                        foreach ($units as $unit):
                                            if ($lagat_detail->unit_id==$unit->id) {
                                                echo $unit->name;
                                            }
                                    endforeach; ?>
                                        </td>
                                        <td><?=convertedcit($lagat_detail->rate)?>
                                        </td>
                                        <td><?=convertedcit($lagat_detail->total)?>
                                        </td>
                                    </tr>
                                    <?php $count++; endforeach; ?>
                                </table>

                                <table class="table table-bordered table-responsive myWidth100 myFont10">
                                    <tr>
                                        <td colspan="10" id="task_name-1" style="text-align: right;"><?=SITE_TYPE?>बााट अनुदान
                                        </td>
                                        <td><input readonly="true" type="text"
                                                value="<?php echo $invest_details->agreement_gauplaika ? convertedcit($invest_details->agreement_gauplaika) : convertedcit($plan_details->investment_amount)?>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="10" id="task_name-1" style="text-align: right;">कार्यदेश दिएको
                                            रकम</td>
                                        <td><input type="text" readonly="true"
                                                value="<?=convertedcit($invest_details->bhuktani_anudan)?>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="10" id="task_name-1" style="text-align: right;">उपभोक्ताबाट
                                            जनश्रमदान </td>
                                        <td><input type="text" readonly="true"
                                                value="<?=convertedcit($invest_details->costumer_investment)?>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="10" id="task_name-1" style="text-align: right;">कुल लागत अनुमान
                                            जम्मा</td>
                                        <td>
                                            <input type="text" readonly="true" name="sub_total" readonly="true"
                                                value="<?=convertedcit($profile_details->sub_total)?>"
                                                id="sub_total" />
                                        </td>
                                    <tr>
                                    <tr>
                                        <td colspan="10" id="task_name-1" style="text-align: right;">कन्टिन्जेन्सी
                                        </td>
                                        <td><input readonly="true" type="text"
                                                value="<?=convertedcit($invest_details->contingency)?>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="10" id="task_name-1" style="text-align: right;">मर्मत संहार
                                        </td>
                                        <td><input type="text" readonly="true"
                                                value="<?=convertedcit($invest_details->marmat)?>" />
                                        </td>
                                    </tr>

                                    </tr>
                                    </tr>
                                </table>

                            </div>
                            <div class="myspacer30"></div>

                            <div class="oursignature"> <b>सदर गर्ने </b></div>

                            <div class="oursignatureleft mymarginright"><b> पेश गर्ने </b></div>
                            <div class="oursignatureleft margin20"> <b> जाँच गर्ने </b></div>
                            <div class="myspacer"></div>
                        </div>
                        <!--<div class="settingsMenu1"><a href="settings_topic_add_sub.php">सह शिर्षक थप्नुहोस +</a></div>-->
                    </div>
                </div>
            </div>
        </div><!-- main menu ends -->

    </div><!-- top wrap ends -->
    <?php // include("menuincludes/footer.php");
