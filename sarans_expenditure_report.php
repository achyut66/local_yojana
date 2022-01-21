<?php require_once("includes/initialize.php");
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
error_reporting(1);
$mode=getUserMode();
$user = getUser();
$max_ward = Ward::find_max_ward_no();
//error_reporting(1);
$topic_area_agreement= Topicareaagreement::find_all();
$topic_area_investment= Topicareainvestment::find_all();
$fiscals=  Fiscalyear::find_all();
$topic_area=  Topicarea::find_all();
$budget_result=  Topicbudget::find_all();
$fiscals=  Fiscalyear::find_all();
$type="";
$aayojana="";
if (isset($_POST['submit'])) {
    ini_set('max_execution_time', 300);
    $type=$_POST['type'];
    $fiscal_id=$_POST['fiscal_id'];
    $aayojana = $_POST['aayojana'];
}
$loop_data = '';
if ($type == 1) {
    $loop_data = $topic_area;
} elseif ($type == 2) {
    $loop_data = $budget_result;
} elseif ($type == 3) {
    $loop_data = $topic_area_investment;
}
?>

<?php include("menuincludes/header.php"); ?>

<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner">
        <div class="">
            <div class="">
                <div class="maincontent">
                    <h2 class="headinguserprofile">सारांसमा रिपोर्ट हेर्नुहोस /<a href="anusuchi_dashboard.php"
                            class="btn">पछि जानुहोस </a></h2>
                    <div class="OurContentFull">
                        <!--<h2>बिषयगत क्षेत्रको नाम </h2>-->
                        <div class="userprofiletable">
                            <form method="post">
                                <table class="table table-responsive table-bordered">
                                    <tr>
                                        <td>आर्थिक वर्ष </td>
                                        <td>
                                            <select id="fiscal_id" name="fiscal_id">
                                                <option value="">--छान्नुहोस्--</option>
                                                <?php foreach ($fiscals as $data):?>
                                                <option
                                                    value="<?php echo $data->id;?>"
                                                    <?php if ($data->is_current==1) {?>
                                                    selected="selected" <?php }?>><?php echo convertedcit($data->year);?>
                                                </option>
                                                <?php endforeach;?>
                                            </select>
                                        </td>
                                        <td>छान्नुहोस्</td>
                                        <td><select disabled id="type" name="type" required>
                                                <option value="">--छान्नुहोस्--</option>
                                                <option value="1" <?php if ($type==1) {?>selected="selected"<?php } ?>>बिषयगत
                                                    क्षेत्र</option>
                                                <!-- <option value="2" <?php if ($type==2) {?>selected="selected"<?php } ?>>बजेट उपशीर्षक
                                                <option value="3" <?php if ($type==3) {?>selected="selected"<?php } ?>>विनियोजन -->
                                                    <!-- किसिम
                                                </option> -->
                                            </select></td>

                                        <td>वार्ड छान्नुहोस् :</td>
                                        <td>
                                            <?php if ($mode=="user"):?>
                                            <select name="ward_no">
                                                <option
                                                    value="<?=$user->ward?>">
                                                    <?=convertedcit($user->ward)?>
                                                </option>
                                            </select>
                                            <?php else:?>
                                            <select name="ward_no">
                                                <option value="">-छान्नुहोस्-</option>
                                                <?php for ($i=1;$i<=$max_ward;$i++):?>
                                                <option
                                                    value="<?=$i?>"
                                                    <?php if ($ward==$i) {
    echo 'selected="selected"';
} ?>
                                                    ><?=convertedcit($i)?>
                                                </option>
                                                <?php endfor;?>
                                            </select>
                                            <?php endif;?>
                                        </td>
                                        <td>आयोजना छान्नुहोस् :</td>
                                        <td>
                                            <select id="aayojana" name="aayojana">
                                                <option value="">-छान्नुहोस्-</option>
                                                <?php foreach ($loop_data as $topic) {?>
                                                <option <?=$aayojana == $topic->id ? ' selected="selected"' : ''?>
                                                    value="<?=$topic->id?>">
                                                    <?=$topic->name?>
                                                    <?php } ?>
                                                </option>
                                            </select>
                                        </td>
                                        <td><input type="submit" name="submit" value="खोज्नुहोस" class="btn"></td>
                                    </tr>
                                </table>
                            </form>
                            <?php if (isset($_POST['submit'])):
                             if ($_POST['type']==1) {
                                 $name="बिषयगत क्षेत्र";
                             } elseif ($_POST['type']==2) {
                                 $name="बजेट शिर्षक";
                             } else {
                                 $name = "विनियोजन किसिम";
                             }?>
                            <?php if ($aayojana) { ?>
                            <table class="table table-bordered table-responsive mytable">
                                <tr>
                                    <td rowspan="2">क्र.सं.</td>
                                    <td rowspan="2"> कार्यक्रम/आयोजनाको बिषयगत क्षेत्रको किसिम </td>
                                    <td rowspan="2"> विनियोजित रकम </td>
                                    <td rowspan="2">खर्च रकम</td>
                                    <td rowspan="2">बाँकि रकम</td>
                                    <td rowspan="2">खर्च प्रतिशत</td>
                                    <td rowspan="2">योजना संचालन स्थिति</td>
                                    <td rowspan="2"> संचालन विवरण</td>
                                    <td rowspan="2" width="172"> कैफियत</td>
                                </tr>
                                <tr>
                                </tr>

                                <?php $i=1;
//    $topic_area_investment_array=array();
    $total_count=0;
    $final_investment=0;
    $total_var =0;
    $total_kharcha=0;
    $clause = "topic_area_id";
    if ($type == 2) {
        $clause = "budget_id";
    } elseif ($type == 3) {
        $clause = "topic_area_investment_id";
    }
    $topics=  Plandetails1::get_by_topic_area_id($clause, $aayojana, $_POST['fiscal_id'], $_POST['ward_no']);
    foreach ($topics as $topic) {
        if ($topic->type==0) {
            $budget=  Ekmustabudget::find_by_plan_id($topic->id);
            if (!empty($budget)) {
                $net_payable_amount =$budget->total_expenditure;
                $remaining_amount= $topic->investment_amount - $net_payable_amount;
            } else {
                $contract_result= Contract_total_investment::find_by_plan_id($topic->id);
                if (empty($contract_result)) {
                    $topic->investment_amount = get_investment_amount($topic->id);
                    if (in_array($topic->id, $final_array)) {
                        $net_payable_amount=get_upobhokta_net_kharcha_amount($topic->id);
                        $remaining_amount=$topic->investment_amount - $net_payable_amount;
                    } else {
                        $net_payable_amount=Planamountwithdrawdetails::get_payement_till_now($topic->id);
                        //                                             echo $net_payable_amount;exit;
                        $remaining_amount= $topic->investment_amount - $net_payable_amount;
                    }
                } else {
                    if (in_array($topic->id, $final_array)) {
                        $net_payable_amount=get_contract_net_kharcha_amount($topic->id);

                        $remaining_amount=$topic->investment_amount - $net_payable_amount;
                    } else {
                        $net_payable_amount=  Contractamountwithdrawdetails::get_payement_till_now($topic->id);
                        $remaining_amount=$topic->investment_amount - $net_payable_amount;
                    }
                }
            }
        } else {
            $budget=  Ekmustabudget::find_by_plan_id($topic->id);
            if (!empty($budget)) {
                $net_payable_amount =$budget->total_expenditure;
                $remaining_amount= $topic->investment_amount - $net_payable_amount;
            } else {
                $program_result=Programpaymentfinal::find_by_program_id1($topic->id);
                $advance_total = Programpayment::get_total_payment_amount($topic->id);
                $net_total_amount_total = Programpaymentfinal::get_net_total_amount_sum($topic->id);
                $net_payable_amount = $advance_total + $net_total_amount_total;
                if (empty($net_payable_amount)) {
                    $remaining_amount=$topic->investment_amount;
                } else {
                    $remaining_amount=($topic->investment_amount)-($net_payable_amount);
                }
            }
        }
        $customer_lagat = Plantotalinvestment::find_by_plan_id($topic->id);
        $samiti_plan_total=Samitiplantotalinvestment::find_by_plan_id($topic->id);
        $contract_plan_total= Contractinfo::find_by_plan_id($topic->id);
        $amanat_lagat = AmanatLagat::find_by_plan_id($topic->id);
        $quotation_lagat = Quotationtotalinvestment::find_by_plan_id($topic->id);
        $if_bhuk = Planamountwithdrawdetails::find_by_plan_id($topic->id);
        $if_contract_bhuk = Contractamountwithdrawdetails::find_by_plan_id($topic->id);
        $if_samiti_bhuk = Samitiplanamountwithdrawdetails::find_by_plan_id($topic->id);
        if ($topic->type==1) {
            $link = "program_total_view.php?id=".$topic->id;
            $sanchalan_prakiya = "कार्यक्रम मार्फत ";
        } elseif ($topic->type==0 && !empty($samiti_plan_total)) {
            $link="view_samiti_plan_form.php?id=".$topic->id;
            $sanchalan_prakiya = "संस्था / समिति मार्फत ";
        } elseif ($topic->type==0 && !empty($contract_plan_total)) {
            $link="view_all_contract.php?id=".$topic->id;
            $sanchalan_prakiya = "ठेक्का मार्फत ";
        } elseif ($topic->type==0 && !empty($amanat_lagat)) {
            $link= "view_all_amanat.php?id=".$topic->id;
            $sanchalan_prakiya = "अमानत मार्फत ";
        } elseif ($topic->type==0 && !empty($customer_lagat)) {
            $link="view_plan_form.php?id=".$topic->id;
            $sanchalan_prakiya = "उपभोक्ता मार्फत ";
        } elseif ($topic->type==0 && !empty($quotation_lagat)) {
            $link ="view_quotation_form.php?id=".$topic->id;
            $sanchalan_prakiya = "कोटेसन मार्फत";
        } else {
            $link="";
            $sanchalan_prakiya = "सम्झौता हुन बाँकि";
        }
        if ($topic->investment_amount==0) {
            $vaar=0;
        } else {
            $vaar=($net_payable_amount/$topic->investment_amount) *100;
        } ?>
                                <tr>
                                    <td><?php echo convertedcit($i); ?>
                                    </td>
                                    <td><?php echo $topic->program_name; ?>
                                    </td>
                                    <td><?php echo convertedcit($topic->investment_amount); ?>
                                    </td>
                                    <td><?php echo convertedcit($net_payable_amount); ?>
                                    <td><?php echo convertedcit($topic->investment_amount - $net_payable_amount); ?>
                                    </td>
                                    <td><?php echo convertedcit(round($vaar, 2, PHP_ROUND_HALF_UP)); ?>
                                        %</td>
                                    <td style="width:10%;background-color:#C9EDFF;">
                                        <?php if (!empty($customer_lagat)) {?>
                                        <div style="color:blue;"> <?php echo $sanchalan_prakiya ?>
                                            <?php if (!empty($if_bhuk)) {?>
                                            <div style="background-color:lime;">(भुक्तानी भैसकेको)</div>
                                            <?php } else {?>
                                            <div style="background-color:#FAF884;">(सम्झौता भएको)</div>
                                            <?php }?>
                                        </div>
                                        <?php } elseif (!empty($amanat_lagat)) {?>
                                        <div style="color:#FF00FF;"> <?php echo $sanchalan_prakiya ?>
                                            <?php if (!empty($if_bhuk)) {?>
                                            <div style="background-color:lime;">(भुक्तानी भैसकेको)</div>
                                            <?php } else {?>
                                            <div style="background-color:#FAF884;">(सम्झौता भएको)</div>
                                        </div>
                                        <?php }?>
                                        <?php } elseif (!empty($samiti_plan_total)) {?>
                                        <div style="color:black;"> <?php echo $sanchalan_prakiya ?>
                                            <?php if (!empty($if_samiti_bhuk)) {?>
                                            <div style="background-color:lime;">(भुक्तानी भैसकेको)</div>
                                            <?php } else {?>
                                            <div style="background-color:#FAF884;">(सम्झौता भएको)</div>
                                        </div>
                                        <?php }?>
                                        <?php } elseif (!empty($contract_plan_total)) {?>
                                        <div style="color:#999999;"> <?php echo $sanchalan_prakiya ?>
                                            <?php if (!empty($if_contract_bhuk)) {?>
                                            <div style="background-color:lime;">(भुक्तानी भैसकेको)</div>
                                            <?php } else {?>
                                            <div style="background-color:#FAF884;">(सम्झौता भएको)</div>
                                        </div>
                                        <?php }?>
                                        <?php } elseif (!empty($quotation_lagat)) {?>
                                        <div style="color:#800080;"> <?php echo $sanchalan_prakiya ?>
                                            <?php if (!empty($if_bhuk)) {?>
                                            <div style="background-color:lime;">(भुक्तानी भैसकेको)</div>
                                            <?php } else {?>
                                            <div style="background-color:#FAF884;">(सम्झौता भएको)</div>
                                        </div>
                                        <?php }?>
                                        <?php } elseif ($data->type==1) {?>
                                        <div style="color:#FA84E8;"> <?php echo $sanchalan_prakiya ?>
                                        </div>
                                        <?php } else {?>
                                        <div style="color:red;"> <?php echo $sanchalan_prakiya ?>
                                        </div>
                                        <?php } ?>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td><?php if ($link) {
                                                    ?>
                                        <a
                                            href="<?php echo $link; ?>"><input
                                                type="button" class="btn-success" value="पुरा विवरण"></a>
                                        <?php
                                            } ?>
                                    </td>
                                </tr>
                                <?php $i++;
        $total_count +=$net_payable_amount;
        $final_investment +=$topic->investment_amount;
        $total_var +=$vaar;
        $total_kharcha+=$topic->investment_amount - $net_payable_amount;
        $total_vaar+=$vaar;
    } ?>
                                <tr>
                                    <td colspan="2" align="left">जम्मा</td>
                                    <td><?php echo convertedcit(placeholder($final_investment));?>
                                    </td>
                                    <td><?php echo convertedcit($total_count);?>
                                    </td>
                                    <td><?php echo convertedcit(placeholder($total_kharcha));?>
                                    </td>
                                    <td><?php echo convertedcit(round($total_vaar, 2, PHP_ROUND_HALF_UP));?>
                                        %</td>
                                    <td>&nbsp;</td>
                                    <td>

                                </tr>

                            </table>
                            <?php } else {?>


                            <!-- <div class="myPrint"><a target="_blank"
                                    href="sarans_expenditure_report_print.php?ward_no=<?=$_POST['ward_no']?>&fiscal_id=<?php echo $fiscal_id;?>&type=<?php echo $type;?> ">प्रिन्ट
                            गर्नुहोस</a> <a
                                href="sarans_expenditure_report_excel.php?ward_no=<?=$_POST['ward_no']?>&fiscal_id=<?php echo $fiscal_id;?>&type=<?php echo $type;?> ">Export
                                to excel</a>
                        </div> -->
                        <br><br>
                        <div class="ourHeader"><?php if (empty($_POST['ward_no'])) {
        echo $name." अनुसार सारांसमा रिपोर्ट हेर्नुहोस ";
    } else {
        echo "वार्ड नं ".convertedcit($_POST['ward_no'])." अन्तर्गत ".$name."को  सारांसमा रिपोर्ट हेर्नुहोस ";
    }?>
                        </div>

                        <table class="table table-bordered table-responsive mytable">
                            <tr>
                                <td rowspan="2">क्र.सं.</td>
                                <td rowspan="2"> कार्यक्रम/आयोजनाको बिषयगत क्षेत्रको किसिम </td>
                                <td rowspan="2" width="40">एकाई</td>
                                <td rowspan="2">कार्यक्रम/आयोजनाको संख्या </td>
                                <td rowspan="2"> विनियोजित रकम </td>
                                <td rowspan="2">खर्च रकम</td>
                                <td rowspan="2">खर्च प्रतिशत</td>
                                <td rowspan="2" width="172"> कैफियत</td>
                            </tr>
                            <tr>
                            </tr>

                            <?php $i=1;
//    $topic_area_investment_array=array();
    $total_count=0;
    $final_investment=0;
    $total_var =0;
    $total_kharcha=0;
    $clause = "topic_area_id";
    if ($type == 2) {
        $clause = "budget_id";
    } elseif ($type == 3) {
        $clause = "topic_area_investment_id";
    }
    foreach ($loop_data as $topic) {
//        echo $topic->id;exit;
        $count_data=  Plandetails1::count_by_topic_area_id($clause, $topic->id, $_POST['fiscal_id'], $_POST['ward_no']);
        $amount=get_total_expenditure_from_ekmusta_budget($clause, $topic->id, $_POST['fiscal_id'], $_POST['ward_no']);
        if ($amount==0) {
            $kharcha_amount=0;
            $vaar=0;
        } else {
            $kharcha_amount = $amount;
            $vaar=($kharcha_amount/$count_data['total_investment']) *100;
        } ?>
                            <tr>
                                <td><?php echo convertedcit($i); ?>
                                </td>
                                <td><?php echo $topic->name; ?>
                                </td>
                                <td>वटा</td>
                                <td><?php echo convertedcit($count_data['total_plans']); ?>
                                </td>
                                <td><?php echo convertedcit(placeholder($count_data['total_investment'])); ?>
                                </td>
                                <td><?php echo convertedcit($kharcha_amount); ?>
                                </td>
                                <td><?php echo convertedcit(round($vaar, 2, PHP_ROUND_HALF_UP)); ?>
                                    %</td>
                                <td>&nbsp;</td>
                            </tr>
                            <?php $i++;
        $total_count +=$count_data['total_plans'];
        $final_investment +=$count_data['total_investment'];
        $total_var +=$vaar;
        $total_kharcha+=$kharcha_amount;
        $total_vaar=($total_kharcha/$final_investment)*100;
    } ?>
                            <tr>
                                <td colspan="2" align="left">जम्मा</td>
                                <td>वटा</td>
                                <td><?php echo convertedcit($total_count);?>
                                </td>
                                <td><?php echo convertedcit(placeholder($final_investment));?>
                                </td>
                                <td><?php echo convertedcit(placeholder($total_kharcha));?>
                                </td>
                                <td><?php echo convertedcit(round($total_vaar, 2, PHP_ROUND_HALF_UP));?>
                                    %</td>
                                <td>&nbsp;</td>
                            </tr>

                        </table>

                        <?php } endif;?>
                    </div>
                </div>
            </div>
        </div><!-- main menu ends -->
    </div>
    </div>
    </div><!-- top wrap ends -->
    <script>
        JQ(document).ready(function() {
            JQ('#type').prop('disabled', function(i, v) {
                return !v;
            });
            JQ(document).on('change', '#type', function() {
                JQ('#aayojana').html('<option value="">-छान्नुहोस्-</option>');
            })
        })
    </script>
    <?php include("menuincludes/footer.php");
