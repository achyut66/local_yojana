<?php require_once("includes/initialize.php");
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}

if (!isset($_GET['id']) && isset($_SESSION['set_plan_id'])) {
    redirectUrl();
}
if ($_GET['id']!=$_SESSION['set_plan_id']):
    die('Invalid Format');
endif;
$plan_details=Plandetails1::find_by_id($_GET['id']);
$invest_details=Plantotalinvestment::find_by_plan_id($_GET['id']);
$profile_details = EstimateLagatProfile::find_by_plan_id($_GET['id']);
$sql = "select * from estimate_lagat_anuman where plan_id=".$_GET['id']." order by sno asc";
$lagat_details = Estimatelagatanuman::find_by_sql($sql);
if (empty($profile_details)) {
    $profile_details = EstimateLagatProfile::setEmptyObjects();
}
$data1 = Plandetails1::find_by_id($_GET['id']);
$estimate_details = Estimateanudandetails::find_by_plan_id($_GET['id']);
$added_investment = $data1->investment_amount+ $estimate_details->other_source + $estimate_details->other_agreement;
$con = get_contingency_for_plan($_GET['id']);
$contingency = $added_investment* $con;
$units          = Units::find_all();
?>

<?php include("menuincludes/header.php"); ?>

<title>योजनाको कुल लागत अनुमान</title>

<body>

    <?php include("menuincludes/topwrap.php"); ?>

    <div class="maincontent">
        <h2 class="headinguserprofile myHeadingone">योजनाको इष्टिमेटको कुल लागत अनुमान | </h2>


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
                    <h3 class="myHeading3">योजनाको इष्टिमेटको कुल लागत अनुमान</h3>
                    <div class="myPrint"><a href="print_estimate_lagat_final.php" target="_blank"> प्रिन्ट गर्नुहोस</a>
                    </div>
                    <div class="myspacer"></div>
                    <table class="table table-bordered table-responsive myWidth100 myFont10">
                        <tr>
                            <th>सि.नं.</th>
                            <th>&nbsp;</th>
                            <th></th>
                            <th>विवरण</th>
                            <th>संख्या</th>
                            <th>लम्बाई</th>
                            <th>चौडाई</th>
                            <th>उचाई</th>
                            <th>परिमाण</th>
                            <th>इकाई</th>
                            <th>दर</th>
                            <th>जम्मा लागत रु.</th>
                            <th></th>
                        </tr>
                        <?php  
                            $count = 1; 
                            foreach ($lagat_details as $lagat_detail): 
                                $break_lagats = ''; 
                                if ($lagat_detail->break_type==2) {
                                    $break_lagats = Estimatelagatanumanbreak::find_by_plan_id_sno($_GET['id'], $count);
                                }
                         
                                if (!empty($break_lagats)): 
                                $task_name = Worktopic::find_by_id($lagat_detail->task_id);
                        ?>
                        <tr>
                            <td><?=$count?></td>
                            <td></td>
                            <td></td>
                            <td><?=$lagat_detail->main_work_name?></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td id="unit-1"><?php echo Units::getName($lagat_detail->unit_id);?></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <?php 
                            $j = 1; 
                            foreach ($break_lagats as $break_lagat): 
                        ?>
                        <tr>
                            <td></td>
                            <td><?=$count?>.<?=$j?></td>
                            <td><?php if ($break_lagat->deduct_part==1) {
                                 echo  "घटाएको भाग";
                             } ?>
                            </td>
                            <td><?=$break_lagat->break_work_name?></td>
                            <td><?=$break_lagat->task_count+0?></td>
                            <td><?=$break_lagat->length+0?></td>
                            <td><?=$break_lagat->breadth+0?></td>
                            <td><?=$break_lagat->height+0?></td>
                            <td><?php if ($break_lagat->deduct_part==1) {
                                 echo "-".($break_lagat->total_evaluation+0);
                             } else {
                                 echo $break_lagat->total_evaluation+0;
                             } ?>
                            </td>
                            <td id="unit-1"><?php echo Units::getName($lagat_detail->unit_id);?></td>
                            <td><?=$break_lagat->task_rate+0?></td>
                            <td><?=$break_lagat->total_rate+0?></td>
                            <td></td>
                        </tr>
                        <?php $j++; endforeach; ?>
                        <!-- sub total row in case of break starts here -->
                        <?php endif; // break row ends here?>
                        <?php if (empty($break_lagats)):// without break single row starts here
                                    $single_break = Estimatelagatanumanbreak::find_single_row($_GET['id'], $count);
                                    $task_name = Worktopic::find_by_id($lagat_detail->task_id);
                             ?>
                        <tr id="remove_estimate_detail-<?=$count?>"
                            <?php if ($count>1): ?>
                            class="remove_estimate_detail" <?php endif; ?> >
                            <td><?=$count?>
                            </td>
                            <td></td>
                            <td id="task_name_column-1"></td>
                            <td id="estimate_sub-1"><?=$lagat_detail->main_work_name?>
                            </td>
                            <td><?=$single_break->task_count+0?>
                            </td>
                            <td><?=$single_break->length+0?>
                            </td>
                            <td><?=$single_break->breadth+0?>
                            </td>
                            <td><?=$single_break->height+0?>
                            </td>
                            <td><?=$lagat_detail->total_evaluation+0?>
                            </td>
                            <td id="unit-1"><?php echo Units::getName($lagat_detail->unit_id); ?>
                            </td>
                            <td><?=$lagat_detail->task_rate+0?>
                            </td>
                            <td><?=$lagat_detail->total_rate+0?>
                            </td>
                            <td></td>
                        </tr>
                        <?php endif;// without break single row ends here?>
                        <?php $count++; endforeach; ?>


                    </table>

                    <table class="table table-bordered table-responsive myWidth100 myFont10">
                            <tr>
                                <td colspan="10"  id="task_name-1" style="text-align: right;"><?=SITE_TYPE?>बााट अनुदान</td>
                                <td><input readonly="true"  type="text"  value="<?php echo $invest_details->agreement_gauplaika ? $invest_details->agreement_gauplaika : $plan_details->investment_amount?>" /></td>
                            </tr>
                            <tr>
                               <td colspan="10"  id="task_name-1" style="text-align: right;">कार्यदेश दिएको रकम</td>
                               <td><input   type="text" readonly="true"  value="<?=$invest_details->bhuktani_anudan?>" /></td>
                            </tr>
                            <tr>
                                <td colspan="10"  id="task_name-1" style="text-align: right;">उपभोक्ताबाट जनश्रमदान </td>
                                <td><input  type="text" readonly="true"  value="<?=$invest_details->costumer_investment?>" /></td>
                            </tr>
                            <tr>
                                <td colspan="10" id="task_name-1" style="text-align: right;">कुल लागत अनुमान जम्मा</td>
                                <td>
                                    <input 
                                        type="text" 
                                        readonly="true" 
                                        name="sub_total"
                                        readonly="true"
                                        value="<?=$profile_details->sub_total?>"
                                        id="sub_total" 
                                    />
                                </td>
                            <tr>
                            <tr>
                                <td colspan="10"  id="task_name-1" style="text-align: right;">कन्टिन्जेन्सी</td>
                                <td><input  readonly="true" type="text"  value="<?=$invest_details->contingency?>" /></td>
                            </tr>
                            <tr>
                                <td colspan="10"  id="task_name-1" style="text-align: right;">मर्मत संहार</td>
                                <td><input  type="text" readonly="true" value="<?=$invest_details->marmat?>" /></td>
                            </tr>

                            </tr>
                            </tr>
                        </table>



                </div>
                <div id="dialog_show" class="modal show" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">


                </div><!-- main menu ends -->
            </div>
        </div>
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php");
