<?php require_once("includes/initialize.php");
error_reporting(1);
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
$user=getUser();
if (!isset($_GET['id']) && isset($_SESSION['set_plan_id'])) {
    redirectUrl();
}
if ($_GET['id']!=$_SESSION['set_plan_id']):
    die('Invalid Format');
endif;
$plan_details=Plandetails1::find_by_id($_GET['id']);
$invest_details=Plantotalinvestment::find_by_plan_id($_GET['id']);
$abstract_profile = AbstractProfile::find_by_plan_version($_GET['id']);
$sql = "select * from abstract_cost where plan_id=".$_GET['id']." and version=".$abstract_profile->version." order by id asc";
$abstract_details = AbstractCost::find_by_sql($sql);
if (empty($abstract_profile)) {
    $abstract_profile = EstimateLagatProfile::setEmptyObjects();
}
$units              = Units::find_all();
?>
<?php include("menuincludes/calculator_header.php"); ?>
<title>योजनाको कुल लागत अनुमान </title>

<body>
    <?php include("menuincludes/topwrap.php"); ?>

    <div class="maincontent">
        <h2 class="headinguserprofile myHeadingone">योजनाको इष्टिमेटको कुल लागत अनुमान | <a class="btn"
                href="estimatedashboard.php" class="btn"> पछि जानुहोस </a> </h2>


        <div class="OurContentFull title_wrap">
            <div class="myMessage"><?php echo $message;?>
            </div>
            <h1 class="myHeading1">दर्ता न :<?=convertedcit($_GET['id'])?>
            </h1>
            <div class="userprofiletable">

                <?php $data = Plandetails1::find_by_id($_GET['id']);?>

                <div>
                    <h3 class="myHeading3"><?php echo $data->program_name; ?>
                    </h3>
                    <form method="post" enctype="multipart/form_data">
                        <h3 class="myHeading3">योजनाको इष्टिमेटको कुल लागत अनुमान</h3>
                        <div class="myPrint"><a href="print_abstract_of_cost_final.php" target="_blank"> प्रिन्ट
                                गर्नुहोस</a>
                        </div>

                        <table class="table table-bordered myWidth100">
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
                                <td><?=$count?>
                                </td>
                                <td colspan="3"><?=$lagat_detail->name?>
                                </td>
                                <td><?=$lagat_detail->quantity?>
                                </td>
                                <td>
                                    <?php
                                        foreach ($units as $unit):
                                            if ($lagat_detail->unit_id==$unit->id) {
                                                echo $unit->name;
                                            }
                                    endforeach; ?>
                                </td>
                                <td><?=$lagat_detail->rate+0?>
                                </td>
                                <td><?=$lagat_detail->total+0?>
                                </td>
                            </tr>
                            <?php $count++; endforeach; ?>
                        </table>
                        <table class="table table-bordered table-responsive myWidth100 myFont10">
                            <tr>
                                <td colspan="10" id="task_name-1" style="text-align: right;"><?=SITE_TYPE?>बााट अनुदान</td>
                                <td><input readonly="true" type="text"
                                        value="<?php echo $invest_details->agreement_gauplaika ? $invest_details->agreement_gauplaika : $plan_details->investment_amount?>" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10" id="task_name-1" style="text-align: right;">कार्यदेश दिएको रकम</td>
                                <td><input type="text" readonly="true"
                                        value="<?=$invest_details->bhuktani_anudan?>" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10" id="task_name-1" style="text-align: right;">उपभोक्ताबाट जनश्रमदान </td>
                                <td><input type="text" readonly="true"
                                        value="<?=$invest_details->costumer_investment?>" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10" id="task_name-1" style="text-align: right;">कुल लागत अनुमान जम्मा</td>
                                <td>
                                    <input type="text" readonly="true" name="sub_total" readonly="true"
                                        value="<?=$abstract_profile->sub_total?>"
                                        id="sub_total" />
                                </td>
                            <tr>
                            <tr>
                                <td colspan="10" id="task_name-1" style="text-align: right;">कन्टिन्जेन्सी</td>
                                <td><input readonly="true" type="text"
                                        value="<?=$invest_details->contingency?>" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10" id="task_name-1" style="text-align: right;">मर्मत संहार</td>
                                <td><input type="text" readonly="true"
                                        value="<?=$invest_details->marmat?>" />
                                </td>
                            </tr>
                            </tr>
                            </tr>
                        </table>

                    </form>
                </div>

            </div>
        </div>
    </div>

    <?php include("menuincludes/footer.php");
