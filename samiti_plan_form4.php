<?php require_once("includes/initialize.php"); 
if(!$session->is_logged_in()){ redirect_to("logout.php");}
if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
{
  redirectUrl();
}
//get_access_form($_GET['id']);
$mode=getUserMode();
if($mode!="administrator" && $mode!="superadmin")
{
    die("ACCESS DENIED");
}
$data_selected_final = Samitiplanamountwithdrawdetails::find_by_plan_id($_GET['id']);
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
  for($i=0;$i<count($_POST['qty']);$i++)
        {
            $detail = new Bhautik_lakshya();
            $detail->details_id = $_POST['details_id'][$i];
            $detail->prev_qty = $_POST['prev_qty'][$i];
            $detail->qty = $_POST['qty'][$i];
            $detail->unit_id = $_POST['unit_id'][$i];
            $detail->plan_id = $_POST['plan_id'];
            $detail->payment_count = $_POST['payment_evaluation_count'];
            $detail->type = 2;
            $detail->miti=$_POST['created_date'];
            $detail->miti_english=DateNepToEng($_POST['created_date']);
            $detail->save();
        }
        //मुल्यांकन को आधारमा भुक्तानी दिनु पर्ने भएमा 
        $data8=new Samitianalysisbasedwithdraw();
        $data8->payment_evaluation_count = $_POST['payment_evaluation_count'];
        $data8->evaluated_date=$_POST['evaluated_date'];
        $data8->evaluated_date_english= DateNepToEng($_POST['evaluated_date']);
        $data8->evaluated_amount=$_POST['evaluated_amount'];
        $data8->payable_amount=$_POST['payable_amount'];
        $data8->advance_payment=$_POST['advance_payment'];
        $data8->contengency_amount=$_POST['contengency_amount'];
        $data8->renovate_amount=$_POST['renovate_amount'];
        $data8->due_amount=$_POST['due_amount'];
        $data8->disaster_management_amount=$_POST['disaster_management_amount'];
        $data8->total_amount_deducted=$_POST['total_amount_deducted'];
        $data8->total_paid_amount = $_POST['total_paid_amount'];
        $data8->plan_id=$_POST['plan_id'];
        $data8->created_date=date("Y-m-d",time());
        $data8->save();
        for($i=0;$i<count($_POST['katti']);$i++)
        {
             $data= new KattiDetails();
             $data->plan_id = $_POST['plan_id'];
             $data->payment_count = $_POST['payment_evaluation_count'];
             $data->created_date = $_POST['created_date'];
             $data->created_date_english = DateNepToEng($_POST['created_date']);
             $data->katti_id = $_POST['katti_id'][$i];
             $data->katti_amount = $_POST['katti'][$i];
             $data->type = 1;
             $data->save();
        }
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
}
$setting =KattiWiwarn::find_by_sql("select * from settings_katti_wiwarn where what_is = 4");
$value = "सेभ गर्नुहोस";
 $plan_selected = Plandetails1::find_by_id($_GET['id']);
 $total_investment = Samitiplantotalinvestment::find_by_plan_id($_GET['id']);
$net_investment=0;
 if(!empty($total_investment))
 {
    $net_investment = $total_investment->agreement_gauplaika + $total_investment->agreement_other + $total_investment->costumer_agreement + $total_investment->other_agreement;
 }
 $advance = Samitiplanstartingfund::find_by_plan_id($_GET['id']);
 $inst_count = Samitianalysisbasedwithdraw::getMaxInsallmentByPlanId($_GET['id']);
 $settingbhautikPariman = SettingbhautikPariman::find_all();
 $units = Units::find_all();
 $bhautik_details = Bhautik_lakshya::find_by_plan_id_and_type($_GET['id'],1);
 empty($inst_count)? $inst_count=0 : '';    
 $total_paid_amount = array();
 if(empty($advance))
 {
  $advance = Samitiplanstartingfund::setEmptyObjects();
 }
?>
<?php include("menuincludes/header.php"); ?>
<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
<div class="">
    <div class="">
        <div class="maincontent">
            <h2 class="headinguserprofile"><?=$plan_selected->program_name?> | दर्ता न :<?=convertedcit($_GET['id'])?></h2>
            <h2 class="headinguserprofile">योजनाको कुल भुक्तानी दिनु पर्ने रकम: रु <span id="net_investment"><?php echo convertedcit($net_investment); ?></span></h2>
            <div class="OurContentLeft">
                   <?php include("menuincludes/samiti_bhuktani_dashboard.php");?>
            </div>	
                <?php echo $message;?>
            <div class="OurContentRight">

                <!--<h2>बिषयगत क्षेत्रको नाम </h2>-->
                <div class="userprofiletable">
                    <?php if(!empty($data_selected_final)): ?>
                    <h3 class="myheader">अन्तिम भुक्तानी भइ सकेको छ | <a href="plan_form5.php">विवरण हेर्नुहोस</a>   </h3>
                   
                   <?php  endif; ?>
                     <div>
                                 <h3>मुल्यांकन को आधारमा भुक्तानी दिनु पर्ने भएमा</h3>
                                 <?php $net_payable_amount = $net_investment; if($inst_count>0):
                                     $inst_amount = array();
                                     $inst_payable_amount = array();
                                     $inst_selected = array();
                                     
                                 ?>
                                 <?php for($i=1; $i<=$inst_count; $i++): 
                                        $inst_data = Samitianalysisbasedwithdraw::find_by_payment_count($i,$_GET['id']);
                                        array_push($inst_amount, $inst_data->total_paid_amount);
                                        array_push($inst_selected, $inst_array[$i]);
                                        $net_payable_amount -= $inst_data->payable_amount;
                                     ?>
                                 
                                 <h3 class="myheader"><?=$inst_array[$i]?> भुक्तानी विवरण</h3>
                    <div class="mycontent"  style="display:none;">
                     <table class="table table-bordered table-responsive">
                                        
                                        <tr>
                                            <td>योजनाको मुल्यांकन किसिम</td>
                                            <td><?php echo $inst_array[$i]; ?></td>
                                        </tr>
                                        <tr>
                                <td width="176">योजनाको मुल्यांकन  मिती</td>
                                <td width="243"><?php echo convertedcit($inst_data->evaluated_date); ?></td>
                              </tr>
                               <tr>
                                <td width="176">योजनाको मुल्यांकन  रकम</td>
                                <td width="243"><?php echo convertedcit($inst_data->evaluated_amount); ?></td>
                              </tr>

                              <tr>
                                <td width="176">भुक्तानी दिनु पर्ने कुल  रकम</td>
                                <td width="243"><?php echo convertedcit($inst_data->payable_amount); ?></td>
                              </tr>
                            </table>
                            <table class="table table-bordered">
                              <tr>
                                <th>पेश्की भुक्तानी लगेको कट्टी रकम</th>
                                <th>कन्टेन्जेन्सी  कट्टी रकम</th>
                                <th>मर्मत सम्हार कोष कट्टी रकम</th>
                                <th>धरौटी कट्टी रकम</th>
                                <th>विपद व्यबसथापन कोष कट्टी रकम</th>
                               </tr>
                               <tr>
                                <td><?php echo convertedcit($inst_data->advance_payment); ?></td>
                                <td><?php echo convertedcit($inst_data->contengency_amount); ?></td>
                                <td><?php echo convertedcit($inst_data->renovate_amount); ?></td>
                                <td><?php echo convertedcit($inst_data->due_amount); ?></td>
                                <td><?php echo convertedcit($inst_data->disaster_management_amount); ?></td>
                              </tr>
                              <tr>
                                <td>जम्मा कट्टी रकम</td>
                                <td><?php echo convertedcit($inst_data->total_amount_deducted); ?></td>
                              </tr>
                              <tr>
                                <td>हाल भुक्तानी दिनु पर्ने खुद रकम</td>
                                <td><?php echo convertedcit($inst_data->total_paid_amount); ?></td>
                              </tr>
                       </table>
                     </div>
                         <?php 
                            $total_paid_amount[$i]=$inst_data->total_paid_amount;
                            $total_payable_amount[$i]=$inst_data->payable_amount;
                         ?>
                         <?php endfor; ?>        
                         <?php endif; ?>
                          <?php if(!empty($data_selected_final)){ exit;}?>
                          <h3><?=$inst_array[$inst_count+1]?> भुक्तानी भर्नुहोस्  </h3>
                          <form method="post" enctype="multipart/form_data" id="analysis_form" >
                             <input type="hidden" name="plan_id" value="<?php echo $_GET['id'];?>"/>
                                   
                                <table class="table table-bordered">
                                   <?php for($i=1; $i<=$inst_count; $i++): ?>
                                        <tr>
                                         <td width="176"><?=$inst_array[$i]?> भुक्तानी रकम</td>
                                         <td width="243"><input type="text" class="inst_amount" value="<?=$total_payable_amount[$i]?>" name="inst_amount[]" readonly="true" required/></td>
                                       </tr>
                              <?php endfor; ?> 
                                 <tr>
                                <td width="176">योजनाको मुल्यांकन किसिम</td>
                                <td width="243">
                                    <select name="payment_evaluation_count" id="payment_evaluation_count" required>
                                            <option value="<?=$inst_count+1?>"><?=$inst_array[$inst_count+1]?></option>
                                       </select>
                                </td>
                              </tr>
                               <tr>
                                <td width="176">भुक्तानी दिन बाकी रकम</td>
                                <td width="243" id="net_payable_amount"><?=$net_payable_amount?></td>
                              </tr>
                               <tr>
                                <td width="176">योजनाको मुल्यांकन  मिती</td>
                                <td width="243"><input type="text" name="evaluated_date" required id="nepaliDate3" /></td>
                              </tr>
                               <tr>
                                <td width="176">योजनाको मुल्यांकन  रकम</td>
                                <td width="243"><input type="text" name="evaluated_amount" id="evaluated_amount" required/></td>
                              </tr>
                              <tr>
                                <td width="176">भुक्तानी दिनु पर्ने कुल  रकम</td>
                                <td width="243"><input type="text" name="payable_amount" id="payable_amount" required/></td>
                              </tr>
                            </table>
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
                                        <td><input type="text" name="karrakam[]"
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
                            <table class="table table-bordered"> 
                             <?php 
                             $cont = Contingency::find_by_id($_GET['id']);
                             $bipat = Bipat::find_by_id($_GET['id']);
                             $marmat = Marmatsamhar::find_by_id($_GET['id']);
                             ?>
                            <tr>
                                <td>पेश्की भुक्तानी लगेको कट्टी रकम</td>
                                <td><input type="text" id="advance_payment" name="advance_payment" readonly="true" value="<?php echo $advance->advance;?>" /></td>
                              </tr>
                            <tr>
                                <td>कन्टिनजेन्सी</td>
                                <td><input type="text" id="contengency_amount" name="contengency_amount"/></td>
                              </tr>
                              <tr>
                                <td>विपत</td>
                                <td><input type="text" id="renovate_amount" name="renovate_amount"/></td>
                              </tr>
                              <tr>
                                <td>मर्मत</td>
                                <td><input type="text" id="disaster_management_amount" name="disaster_management_amount"/></td>
                              </tr>
                              <input type="hidden" id="jamma">
                              <input type="hidden" id="new_value">
                              <?php if($inst_count>0): ?>
                              <tr>
                                  <td>जम्मा किस्ता रकम ( <?= implode(" + ", $inst_selected)?> )</td>
                                <td><input type="text" value="<?= array_sum($inst_amount)?>" readonly="true" name="inst_amount"/></td>
                              </tr>
                              <?php endif; ?>
                              <tr>
                                <td>हाल भुक्तानी दिनु पर्ने खुद रकम</td>
                                <td><input type="text" name="total_paid_amount" id="total_paid_amount" /></td>
                              </tr>
                            </table></br>
                            <h2>प्राप्त भौतिक लक्ष्य भर्नुहोस्</h2>
                                <table class="table table-bordered">
                                <tr>
                                    <th>सि. नं </th>
                                     <th> भौतिक लक्ष्य को शिर्षक </th>
                                     <th>अनुमानित लक्ष्य </th>
                                    <th>प्राप्त लक्ष्य </th>
                                    <th>भौतिक इकाई </th>
                                    
                                </tr>
                            <?php 
                                    $i=1;
                                    foreach($bhautik_details as $result):
                                    ?>
                                <tr <?php if($i!=1){?>class="remove_plan_form_details"<?php }?>>
                                <td><?=$i?></td>
                                    <td>
                                        <select name="details_id[]" readonly="true">
                                            <option value="">--------</option>
                                            <?php foreach($settingbhautikPariman as $data):?>
                                            <option value="<?=$data->id?>" <?php if($data->id==$result->details_id){ echo 'selected="selected"';}?>><?=$data->name?></option>
                                            <?php endforeach;?>
                                        </select>
                                    </td>
                                    <td><input type="text" name="prev_qty[]" value="<?php echo $result->qty; ?>">
                                    </td>
                                    <td><input type="text" name="qty[]"  /></td>
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
                            <input type="hidden" name="costumer_agreement" id="costumer_agreement" value="<?php echo $total_investment->costumer_agreement;?>" />
                        <input type="submit" name="submit" onclick="return confirm('कृपया पुनः डेटा आवलोकन गर्नुहोस हालिएको  डेटा सच्याउन  मिल्दैन');" value="सेभ गर्नुहोस" class="submithere">                               
                  </form>
                </div>
                  </div>
                </div><!-- main menu ends -->
            </div>
         </div>   
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>
     <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
     <script>
       JQ(document).ready(function() {
        JQ(document).on('keyup change','.karrakam',function(){
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
            $('#new_value').val(final_amount_after_tax);
            $('#total_paid_amount').val(final_amount_after_tax);
        });
        $(document).on('change','#final_total_paid_amount',function(){
            var t_amt = JQ("#final_total_paid_amount").val();
            //console.log(t_amt);
            JQ("#final_t_amount").val(t_amt);
        });
        JQ(document).on("input","#evaluated_amount",function(){
          // alert('hkjhhjh');
          var evaluated_amt = JQ("#evaluated_amount").val();
          JQ("#payable_amount").val(evaluated_amt);
          JQ("#final_t_amount").val(evaluated_amt);
        });
        JQ(document).on("input","#contengency_amount,#renovate_amount,#disaster_management_amount",function(){
          var cont = JQ("#contengency_amount").val();
          var renovate = JQ("#renovate_amount").val();
          var disaster = JQ("#disaster_management_amount").val();
          var tot = parseFloat(cont)+parseFloat(renovate)+parseFloat(disaster);
          JQ("#jamma").val(tot);
          var new_vl = JQ("#new_value").val();
          var katti_bahek = parseFloat(new_vl)-parseFloat(tot);
          $('#total_paid_amount').val(katti_bahek);
        });
      });
     </script>