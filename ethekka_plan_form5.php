<?php require_once("includes/initialize.php");
if(!$session->is_logged_in()){ redirect_to("logout.php");}
if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
{
    redirectUrl();
}
$setting =KattiWiwarn::find_by_sql("select * from settings_katti_wiwarn where what_is = 7");
error_reporting(0);
$units = Units::find_all();
$settingbhautikPariman = SettingbhautikPariman::find_all();
$bhautik_details = Bhautik_lakshya::find_by_plan_id_and_type($_GET['id'],1);
$mode=getUserMode();
$units = Units::find_all();
if($mode!="administrator" && $mode!="superadmin")
{
    die("ACCESS DENIED");
}
$inst_array = array(
    1=>"पहिलो",
    2=>"दोस्रो",
    3=>"तेस्रो",
    4=>"चौथो",
    5=>"पाचौ",
    6=>"छैठो",
);
if(isset($_POST['submit']))
{
        if(strtotime(DateNepToEng($_POST['plan_end_date'])) > strtotime(DateNepToEng($_POST['yojana_sakine_date'])))
    {
        $link="plan_form5.php";
        echo alertBox("योजनाको काम सम्पन्न भएको मिति योजना सम्पन्न हुने मिति भन्दा धेरै भयो , कृपया म्याद थप गरि आउनु होला...!!!", $link);
        return false;
    }
    else
    {

        for($i=0;$i<count($_POST['topic']);$i++)
        {
            $kar_bibran = new Kar_Bibran();
            $kar_bibran->darta_id = $_GET['id'];
            $kar_bibran->kar_rakam = $_POST['karrakam'][$i];
            $kar_bibran->kar_percent = $_POST['precent'][$i];
            $kar_bibran->total_kar_amount = $_POST['total_amt'][$i];
            $kar_bibran->kar_topic = $_POST['topic'][$i];
            $kar_bibran->save();
        }
        $data = new Publicinvestigationdetails();
        $data->survey_date=$_POST['survey_date'];
        $data->survey_date_english = DateNepToEng($data->survey_date);
        $data->population=$_POST['population'];
        $data->plan_id=$_POST['plan_id'];
        $data->save();
        $data = new Planamountwithdrawdetails();
        $data->get_qty=$_POST['get_qty'];
        $data->doc_name=$_POST['doc_name'];
        $data->other_kaifiyet=$_POST['other_kaifiyet'];
        $data->get_unit_id=$_POST['get_unit_id'];
        $data->plan_end_date = $_POST['plan_end_date'];
        $data->yojana_sakine_date=$_POST['yojana_sakine_date'];
        $data->yojana_sakine_date_english=$_POST['yojana_sakine_date_english'];
        $data->upabhokta_aproved_date=$_POST['upabhokta_aproved_date'];
        $data->upabhokta_aproved_date_english = DateNepToEng($_POST['upabhokta_aproved_date']);
        $data->expenditure_approved_date = $_POST['expenditure_approved_date'];
        $data->expenditure_approved_date_english = DateNepToEng($_POST['expenditure_approved_date']);
        $data->plan_evaluated_date=$_POST['plan_evaluated_date'];
        $data->plan_evaluated_date_english = DateNepToEng($_POST['plan_evaluated_date']);
        $data->plan_evaluated_amount=$_POST['plan_evaluated_amount'];
        $data->final_bhuktani_ghati_amount = $_POST['final_bhuktani_ghati_amount'];
        $data->final_payable_amount=$_POST['final_payable_amount'];
        $data->payment_till_now=$_POST['payment_till_now'];
        $data->advance_payment=$_POST['advance_payment'];
        $data->remaining_payment_amount=$_POST['remaining_payment_amount'];
        $data->final_contengency_amount=$_POST['final_contengency_amount'];
        $data->final_renovate_amount=$_POST['final_renovate_amount'];
        $data->final_due_amount=$_POST['final_due_amount'];
        $data->final_disaster_management_amount=$_POST['final_disaster_management_amount'];
        $data->final_total_amount_deducted=$_POST['final_total_amount_deducted'];
        $data->final_total_paid_amount=$_POST['final_total_paid_amount'];
        $data->final_dpr_amount = $_POST['final_dpr_amount'];
        $data->estimated_amount = $_POST['estimated_amount'];
        $data->plan_id=$_POST['plan_id'];
        $data->created_date =$_POST['created_date'];
        $data->bank_acc = $_POST['bank_acc'];
        $data->chalani_no = $_POST['chalani_no'];
        $data->us_bank_acc = $_POST['us_bank_acc'];
        $data->bank_lagat_date = $_POST['bank_lagat_date'];
        $data->us_bank_name = $_POST['us_bank_name'];
        $data->created_date_english=DateNepToEng($_POST['created_date']);
        // calculated amount 
        $data->agreement_gauplaika_calc = $_POST['agreement_gauplaika_calc'];
        $data->agreement_other_calc     = $_POST['agreement_other_calc'];
        $data->other_agreement_calc     = $_POST['other_agreement_calc'];
        $data->customer_agreement_calc  = $_POST['customer_agreement_calc'];
        $data->save();
        for($i=0;$i<count($_POST['qty']);$i++)
        {
            $detail = new Bhautik_lakshya();
            $detail->details_id = $_POST['details_id'][$i];
            $detail->prev_qty = $_POST['prev_qty'][$i];
            $detail->qty = $_POST['qty'][$i];
            $detail->unit_id = $_POST['unit_id'][$i];
            $detail->plan_id = $_POST['plan_id'];
            $detail->type = 3;
            $detail->miti=$_POST['created_date'];
            $detail->miti_english=DateNepToEng($_POST['created_date']);
            $detail->save();
        }
        for($i=0;$i<count($_POST['katti']);$i++)
        {
            $data= new KattiDetails();
            $data->plan_id = $_POST['plan_id'];
            $data->created_date = $_POST['created_date'];
            $data->created_date_english = DateNepToEng($_POST['created_date']);
            $data->katti_id = $_POST['katti_id'][$i];
            $data->katti_amount = $_POST['katti'][$i];
            $data->type = 2;
            $data->save();
        }

        echo alertBox("भुक्तानी गर्न सफल ","plan_form5.php");
    }

}
$plan_total = Ethekka_lagat::find_by_plan_id($_GET['id']);
// pp($plan_total);
$data_selected_public = Publicinvestigationdetails::find_by_plan_id($_GET['id']);
$data_selected_final = Planamountwithdrawdetails::find_by_plan_id($_GET['id']);
$plan_selected = Plandetails1::find_by_id($_GET['id']);
$total_investment = Ethekkainfo::find_by_plan_id($_GET['id']);
// pp($total_investment);
if(!empty($total_investment))
{
    $net_investment = $total_investment->agreement_gauplaika + $total_investment->agreement_other + $total_investment->other_agreement;
    $hid_agreement_other = $total_investment->agreement_other;
    $hid_other_agreement = $total_investment->other_agreement;
    $hid_costumer_agreement = $total_investment->costumer_agreement;
    $hid_agreement_gauplaika = $total_investment->agreement_gauplaika;

//    $unit_id = $total_investment->unit_id;
    $completion_date=getcompletiondate($_GET['id']);
    $costumer_agreement = $total_investment->costumer_agreement;
    if(!empty($plan_total->marmat_new)){
    $karyadesh = $total_investment->bhuktani_anudan + $plan_total->marmat_new;
    }else{
    $karyadesh = $total_investment->bhuktani_anudan;
    }
//  $lakshya = $total_investment->unit_total;
    $estimated_amount = $total_investment->kabol_rakam;
    //print_r($estimated_amount);
    $hid_agreement_other = $total_investment->agreement_other;
    $hid_other_agreement = $total_investment->other_agreement;
    $hid_costumer_agreement = $total_investment->costumer_agreement;
    $hid_agreement_gauplaika = $total_investment->agreement_gauplaika;

    $link="bhuktani_select.php";
    $name = "उपभोक्ताबाट";
    $name1="उपभोक्ताको";
}
$advance = Planstartingfund::find_by_plan_id($_GET['id']);
if(!empty($advance))
{
    $advance_amount = $advance->advance;
}
else
{
    $advance_amount = 0;
}
$net_payable_amount = $net_investment;
$inst_count = Analysisbasedwithdraw::getMaxInsallmentByPlanId($_GET['id']);
empty($inst_count)? $inst_count=0 : '';
$total_paid_amount = array();
if(empty($advance))
{
    $advance = Planstartingfund::setEmptyObjects();
}
if($inst_count==0)
{
    $check_advance =1;
    $net_payable_amount-= $advance_amount;
}

// check for installment amount and calculating the total paid amount i.e. payable amount without contingency amount
// but including advance amount in the first installment
$inst_amount = array();
$inst_selected = array();
$payable_amount = array();

$inst_selected = array();
$check_inst = 0;
if($inst_count>0):
    $check_inst = 1;
    for($i=1; $i<=$inst_count; $i++):
        $inst_data = Analysisbasedwithdraw::find_by_payment_count($i,$_GET['id']);
        array_push($inst_amount, $inst_data->total_paid_amount);
        array_push($payable_amount, $inst_data->payable_amount);
        array_push($inst_selected, $inst_array[$i]);
        $net_payable_amount -= $inst_data->payable_amount;
    endfor;
endif;
if($inst_count==0)
{
    $contingency = get_contingency_for_plan($_GET['id']);
    $final_total_deducted_amount = ($net_payable_amount * $contingency)+$advance->advance;
    $final_total_paid_amount = $net_payable_amount +$costumer_agreement - $final_total_deducted_amount;
}
else
{
    $contingency = get_contingency_for_plan($_GET['id']);
    $final_total_deducted_amount = ($net_payable_amount * $contingency);
    $final_total_paid_amount = $net_payable_amount +$costumer_agreement- $final_total_deducted_amount;
}
$data_1 = Analysisbasedwithdraw::find_by_plan_id($_GET['id']);
$invest_details =  Plantotalinvestment::find_by_plan_id($_GET['id']);
?>
<?php include("menuincludes/header.php"); ?>

<style>
    table {
        border-collapse: collapse;
        border-spacing: 0;
        width: 100%;
        border: 1px solid #ddd;
    }
    .borderless table {
        border-top-style: none;
        border-left-style: none;
        border-right-style: none;
        border-bottom-style: none;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
</style>
<body>
<?php include("menuincludes/topwrap.php"); ?>
<div id="body_wrap_inner">

    <div class="maincontent">
        <h2 class="headinguserprofile"><?=$plan_selected->program_name?> , दर्ता न :<?=convertedcit($_GET['id'])?> | <a href="<?=$link?>" class="btn">पछि जानुहोस </a></h2>
        <h2 class="headinguserprofile">योजनाको कुल भुक्तानी दिनु पर्ने रकम: रु <span id="net_investment"><?php echo convertedcit($net_investment); ?></span></h2>

        <?php echo $message;?>
        <div class="OurContentFull">

            <!--<h2>बिषयगत क्षेत्रको नाम </h2>-->
            <div class="userprofiletable">
                <?php if(!empty($data_selected_public) && !empty($data_selected_final)):?>
                <div class="myCenter">
                    <h3>योजनाको अन्तिम भुक्तानी </h3>
                    <?php
                    if($mode=="superadmin"){?>
                        <a onClick="return confirm('के तपाई डेटा हाटाउन चाहनुहुन्छ ?');" href="delete_final_payment.php?plan_id=<?php echo $_GET['id'];?>"><button class="btn">अन्तिम भुक्तानी हटाउनु होस्</button></a>
                    <?php }
                    $katti_bibaran_payment = KattiDetails::find_by_plan_id_and_type($_GET['id'],2);
                    //                               print_r($katti_bibaran_payment);exit;
                    ?>
                    <table id="plan_amount_withdraw" class="table table-bordered table-hover">
                        
                        <tr>
                            <td class="myTextalignRight">सार्बजनिक परिक्षण भेलमामा उपस्थित संख्या</td>
                            <td><?=convertedcit($data_selected_public->population)?></td>
                        </tr>
                        <tr>
                            <td class="myTextalignRight">योजना सम्पन्न हुने मिति</td>
                            <td><?=convertedcit($data_selected_final->yojana_sakine_date);?></td>
                        </tr>
                        <tr>
                            <td class="myTextalignRight">योजनाको काम सम्पन्न भएको मिति</td>
                            <td><?=convertedcit($data_selected_final->plan_end_date)?></td>
                        </tr>
                        <tr>
                            <td class="myTextalignRight"><?php if($var!=1){ ?><?=$name1?> बैठक बसी<?php } ?> खर्च स्वीकृत गरेको मिति</td>
                            <td><?=convertedcit($data_selected_final->upabhokta_aproved_date)?></td>
                        </tr>
                        <tr>
                            <td class="myTextalignRight">अनुगमन समितिको बैठक बसी खर्च स्वीकृत गरेको मिति</td>
                            <td><?=convertedcit($data_selected_final->expenditure_approved_date)?></td>
                        </tr>
                        <tr>
                            <td class="myTextalignRight">योजनाको मुल्यांकन मिति</td>
                            <td><?=convertedcit($data_selected_final->plan_evaluated_date)?></td>
                        </tr>
                        <tr>
                            <td class="myTextalignRight">योजनाको मुल्यांकन रकम</td>
                            <td><?=convertedcit($data_selected_final->plan_evaluated_amount)?></td>
                        </tr>
                        <tr>
                            <td class="myTextalignRight"> भुक्तानी दिनु पर्ने कुल  रकम</td>
                            <td ><?=convertedcit($data_selected_final->final_payable_amount)?></td>
                        </tr>
                        <tr>
                            <td class="myTextalignRight"> मुल्यांकन अनुसार हाल सम्म भुक्तानी लगेको कुल  रकम <?=getInstText($inst_selected)?></td>
                            <td ><?=convertedcit($data_selected_final->payment_till_now)?></td>
                        </tr>
                        <tr>
                            <td class="myTextalignRight">पेश्की भुक्तानी लगेको कट्टी रकम</td>
                            <td><?=convertedcit($data_selected_final->advance_payment)?></td>
                        </tr>
                        <tr>
                            <td class="myTextalignRight">भुक्तानी दिनु पर्ने कुल बाँकी  रकम</td>
                            <td><?=convertedcit($data_selected_final->remaining_payment_amount)?></td>
                        </tr>
                        <tr>
                            <td class="myTextalignRight">भुक्तानी घटी कट्टी रकम</td>
                            <td><?=convertedcit($data_selected_final->final_bhuktani_ghati_amount)?></td>
                        </tr>
                        <tr>
                            <td class="myTextalignRight">कन्टेन्जेन्सी  कट्टी रकम</td>
                            <td><?=convertedcit($data_selected_final->final_contengency_amount)?></td>
                        </tr>
                        <tr>
                            <td class="myTextalignRight">मर्मत सम्हार कोष / सूचना पाटी कट्टी रकम</td>
                            <td><?php echo convertedcit($invest_details->marmat_new);?></td>
                        </tr>

                        <tr>
                            <td class="myTextalignRight">जम्मा कट्टी रकम</td>
                            <td><?=convertedcit($data_selected_final->final_total_amount_deducted)?></td>
                        </tr>
                        <tr>
                            <td class="myTextalignRight">भुक्तानी दिइएको खुद रकम</td>
                            <td><?=convertedcit($data_selected_final->final_total_paid_amount)?></td>
                        </tr>
                    </table>
                    <?php endif;?>
                </div>
                <?php $data=  Plandetails1::find_by_id($_GET['id']);
                $datas=Plantotalinvestment::find_by_plan_id($_GET['id']);
                if(!empty($datas))
                {
                    $add=$datas->agreement_gauplaika+$datas->agreement_other+$datas->other_agreement;
                    $costumer= $datas->costumer_agreement;
                }
                else
                {
                    $datas=  Samitiplantotalinvestment::find_by_plan_id($_GET['id']);
                    $add=$datas->agreement_gauplaika+$datas->agreement_other+$datas->costumer_agreement+$datas->other_agreement;
                    $costumer= $datas->costumer_agreement;
                }
                ?>
                <div <?php if(!empty($data_selected_final)): ?> style="display:none;" <?php endif; ?>>
                    <form method="post" enctype="multipart/form-data" >
                        <h3>योजनाको अन्तिम भुक्तानी </h3>
                        <div class="inputWrap33 inputWrapLeft">
                            <input type="hidden" name="plan_id" id="plan_id" value="<?php echo $_GET['id'];?>"/>
                            <input type="hidden" name="marmat_rate" id="marmat_rate" value="<?=Marmatsamhar::get_marmat_samhar_percent();?>"/>
                            <div class="titleInput">सार्बजनिक परिक्षण भेलमा उपस्थित संख्या</div>
                            <div class="newInput"><input type="text" name="population"/></div>
                            <div class="titleInput">योजना सम्पन्न हुने मिति</div>
                            <div class="newInput"><input type="text" class="yojana_sakine_date" name="yojana_sakine_date" value="<?=$completion_date;?>" readonly="true"/></div>

                            <div class="titleInput">योजनाको काम सम्पन्न भएको मिति</div>
                            <div class="newInput"><input type="text" class="plan_end_date" name="plan_end_date" id="nepaliDate5"/></div>
                            
                            <div class="titleInput">योजनाको मुल्यांकन मिति</div>
                            <div class="newInput"><input type="text" name="plan_evaluated_date" id="nepaliDate12"/></div>

                            <div class="titleInput">इष्टिमेट भएको रकम </div>
                            <div class="newInput"><input type="text" id="estimated_amount" name="estimated_amount" value="<?= $estimated_amount ?>"/></div>
                            
                        </div>
                        <div class="inputWrap33 inputWrapLeft">


                            <div class="titleInput">योजनाको हाल  मुल्यांकन रकम</div>
                            <div class="newInput"><input type="text" id="haal_mulyankan" name="haal_mulyankan"/></div>
                            <div class="titleInput">योजनाको खुद मुल्यांकन रकम</div>
                            <div class="newInput"><input readonly="true" type="text" id="plan_evaluated_amount" name="plan_evaluated_amount"/></div>
                            <!-- <div class="titleInput"> मुल्यांकन अनुसार हाल सम्म भुक्तानी लगेको कुल  रकम <?=getInstText($inst_selected)?></div>
                            <div class="newInput"><input type="text" id="payment_till_now" name="payment_till_now" readonly="true" value="<?=array_sum($payable_amount)?>" /></div> -->
                            <div class="titleInput">पेश्की भुक्तानी लगेको कट्टी रकम</div>
                            <div class="newInput"><input type="text" name="advance_payment" id="advance_payment" readonly="true" value="<?=$advance_amount?>" /></div>
                            
                            <div class="titleInput">भुक्तानी घटी कट्टी रकम</div>
                            <div class="newInput"><input type="text" name="final_bhuktani_ghati_amount"  id="final_bhuktani_ghati_amount" required  value="0"/></div>
                                 
                        </div>
                        <div class="inputWrap33 inputWrapLeft">

                            <div class="titleInput">हाल भुक्तानी दिनु पर्ने खुद रकम</div>
                            <div class="newInput"><input type="text" name="final_total_paid_amount" id="final_total_paid_amount"  value=""/>
                            </div>
                            <div class="titleInput">भुक्तानी भएको मिति </div>
                            <div class="newInput"><input type="text" name="created_date" id="nepaliDate9" value="<?=DateEngToNep(date("Y-m-d",time()))?>"  readonly="true"/></div>
                            
                            <?php
                            $group_details = Costumerassociationdetails::find_by_plan_id($_GET['id']);
                                    ?>
                        </div>
                        <div class="myspacer"></div>
                        
                        <table class="table borderless">
                            <thead>
                            <tr>
                                <th class="myCenter" style="border:3px double black;"><strong>सी.न </th>
                                <th class="myCenter" style="border:3px double black;"><strong>शिर्षक</th>
                                <th class="myCenter" style="border:3px double black;"><strong>कर योग्य रकम</strong></th>
                                <th class="myCenter" style="border:3px double black;"><strong>कर(%)</strong></th>
                                <th class="myCenter" style="border:3px double black;"><strong>कर रकम</strong></th>
                            <tr>
                            </thead>
                            <tbody>
                            <?php
                            $i = 1;
                            if(!empty($setting)) :
                                foreach ($setting as $key => $value) :?>
                                    <tr>
                                        <td><?php echo convertedcit($i++)?></td>
                                        <td><?php echo $value->topic?>
                                            <input type = "hidden" name="topic[]" value="<?php echo $value->topic?>">
                                        </td>
                                        <td><input type="text" name="karrakam[]
              " value=""  class="form-control karrakam"></td>
                                        <td><input type="text" name="precent[]"  class="percent" value="<?php echo $value->percent?>" readonly="true" style="background: #e5e5e5;"></td>
                                        <td><input type="text" name="total_amt[]" value="" class="form-control sum_item"></td>
                                    </tr>
                                <?php endforeach;endif;?>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td>हाल भुक्तानी दिनु पर्ने खुद रकम</td>
                                <td><input type="text" value="<?=$final_total_paid_amount?>" name= "final_t_amount" id="final_t_amount" readonly="readonly"> </td>
                                <td colspan =2></td>
                                <td>
                                    <input type="text" name="total_kar_rakam"  id = "total" readonly="true" style="background: #e5e5e5;">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">करपछि भुक्तानी दिनु पर्ने खुद रकम</td>
                                <td><input type="text" name="f_amount_after_tax" id="f_amount_after_tax" readonly="true" style="background: #e5e5e5"></td>
                            </tr>
                            </tfoot>
                        </table>
                        
                        <div>
                            <?php $bhautik = Bhautik_lakshya::find_by_plan_id_and_type_payment_count($_GET['id'],2,1);
                                foreach($bhautik as $bhautik):
                                endforeach;
                            
                            ?>
                            <h2>प्राप्त भौतिक लक्ष्य भर्नुहोस्</h2>
                            <table class="table table-bordered">
                                <tr>
                                    <th>सि. नं </th>
                                    <th>भौतिक लक्ष्यको शिर्षक </th>
                                    <th>अनुमानित लक्ष्य </th>
                                    <th>कुल प्राप्त लक्ष्य </th>
                                    <th>भौतिक इकाई </th>
                                </tr>
                                <?php
                                $i=1;
                                foreach($bhautik_details as $result):
                                    ?>
                                    <tr <?php if($i!=1){?>class="remove_plan_form_details"<?php }?>>
                                        <td><?=convertedcit($i)?></td>
                                        <td>
                                            <select name="details_id[]" readonly="true">
                                                <option value="">--------</option>
                                                <?php foreach($settingbhautikPariman as $data):?>
                                                    <option value="<?=$data->id?>" <?php if($data->id==$result->details_id){ echo 'selected="selected"';}?>><?=$data->name?></option>
                                                <?php endforeach;?>
                                            </select>
                                        </td>
                                        <td><input type="text" name="prev_qty[]" value="<?=$result->qty?>" readonly="true"/></td>
                                        <td><input type="text" name="qty[]" value="" /></td>
                                        <td>
                                            <select name="unit_id[]" readonly="true">
                                                <option value="">--छान्नुहोस् --</option>
                                                <?php foreach($units as $unit): ?>
                                                    <option value="<?=$unit->id?>" <?php if($unit->id==$result->unit_id){ echo 'selected="selected"';}?>><?=$unit->name?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </td>
                                    </tr>
                                    <?php $i++;endforeach;?>
                            </table>
                        </div>
                        <center>
                            <input type="submit"  name="submit" onClick="return confirm('कृपया पुनः डेटा आवलोकन गर्नुहोस हालिएको  डेटा सच्याउन  मिल्दैन');" value="सेभ गर्नुहोस"  id="final_date_check" class="submit btn btn-info">
                        </center>
                        <input type="hidden" name="customer_agreement" id="customer_agreement" value="<?php echo $costumer;?>" readonly="true"/>
                        <input type="hidden" name="karyadesh_amount" id="karyadesh_amount" value="<?php echo $karyadesh;?>" readonly="true"/>
                        <input type="hidden" name="hid_agreement_gauplaika" id="hid_agreement_gauplaika" value="<?php echo $hid_agreement_gauplaika;?>" readonly="true"/>
                        <input type="hidden" name="hid_agreement_other" id="hid_agreement_other" value="<?php echo $hid_agreement_other;?>" readonly="true"/>
                        <input type="hidden" name="hid_other_agreement" id="hid_other_agreement" value="<?php echo $hid_other_agreement;?>" readonly="true"/>
                        <input type="hidden" name="analysis_total_evaluated_amount" id="analysis_total_evaluated_amount" value="<?php echo Analysisbasedwithdraw::getevaluated_Amount($_SESSION['set_plan_id']);?>" readonly="true"/>
                        <input type="hidden" name="check_inst" value="<?=$check_inst?>" id="check_inst" />
                        <input type="hidden" name="check_advance" value="<?=$check_advance?>" id="check_advance" />
                        <!-- for calculated values -->
                        <input type="hidden" name="agreement_gauplaika_calc" value="<?=$total_investment->agreement_gauplaika?>" id="agreement_gauplaika_calc" />
                        <input type="hidden" name="agreement_other_calc" value="<?=$total_investment->agreement_other?>" id="agreement_other_calc" />
                        <input type="hidden" name="other_agreement_calc" value="<?=$total_investment->other_agreement?>" id="other_agreement_calc" />
                        <input type="hidden" name="customer_agreement_calc" value="<?=$total_investment->costumer_agreement?>" id="customer_agreement_calc" />
                    </form>
                </div>
            </div>
        </div>
    </div><!-- main menu ends -->
    <script src="js/bhuktani.js"></script>
</div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $(document).on('keyup change','.karrakam',function(){
            var karrakam = $(this).val();
            if(karrakam == '' || isNaN(karrakam)) {
                karrakam = 0;
                $(this).closest('tr').find('.karrakam').val(0);
            }
            var unit_other = $(this).closest('tr').find('.percent').val();
            var total_karRakam = unit_other*karrakam/100;
            if(total_karRakam != '' && total_karRakam !=NaN) {
                $(this).closest('tr').find('.sum_item').val(total_karRakam);
            }
            var sum = 0;
            $('.sum_item').each(function(){
                var item_val=parseFloat($(this).val());
                if(isNaN(item_val)){
                    item_val = 0 ;
                }
                sum+= item_val;
                $('#total').val(sum.toFixed(2));
            });
            var amount_final = $('#final_total_amount_deducted').val();
            var final_amt = $('#final_total_amount_deducted').val();
            var final_t_amount = amount_final - final_amt;
            //console.log(final_t_amount);
            var final_t_amount = $('#final_t_amount').val();
            if(isNaN(final_t_amount)) {
                final_t_amount = 0;
            }
            var final_amount_after_tax = parseFloat(final_t_amount)-parseFloat(sum);
            $('#f_amount_after_tax').val(final_amount_after_tax);
        });
        });
        JQ(document).on("input","#haal_mulyankan",function(){
            var mulyankan = JQ("#haal_mulyankan").val();
            JQ("#plan_evaluated_amount").val(mulyankan);
            var peski = JQ("#advance_payment").val();
            var estimate = JQ("#estimated_amount").val();
            var bhuktani_ghati = parseFloat(mulyankan)-parseFloat(estimate);
            JQ("#final_bhuktani_ghati_amount").val(bhuktani_ghati);
            var final_bhuktani_amount = parseFloat(mulyankan)-parseFloat(peski);
            JQ("#final_total_paid_amount").val(final_bhuktani_amount);
            JQ("#final_t_amount").val(final_bhuktani_amount);
        });
</script>