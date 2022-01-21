<?php require_once("includes/initialize.php");
if(!$session->is_logged_in()){ redirect_to("logout.php");}
if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
{
  redirectUrl();
}
?>
    <?php 
$data1=  Plandetails1::find_by_id($_GET['id']);
$result = Quotationtotalinvestment::find_by_plan_id($_GET['id']);
            $data2=  Quotationmoredetails::find_by_plan_id($_GET['id']);
            $investment_data=Quotationtotalinvestment::find_by_plan_id($_GET['id']);
            $name = "कोटेशनबाट";  
    $data3=  Quotationmoredetails::find_by_plan_id($_GET['id']);
    $data4=Planamountwithdrawdetails::find_by_plan_id($_GET['id']);
    $link = get_return_url($_GET['id']);
	$fiscal = FiscalYear::find_by_id($data1->fiscal_id);
    $workers = Workerdetails::find_all();
$url = get_base_url(1);
$print_history = PrintHistory::find_by_url_and_plan_id($url, $_GET['id']);

if(!empty($print_history))
{
    $worker1 = Workerdetails::find_by_id($print_history->worker1);
    $worker2 = Workerdetails::find_by_id($print_history->worker2);
}
else
{
    $print_history = PrintHistory::setEmptyObject();
    if(empty($worker1))
    {
        $worker1 = Workerdetails::setEmptyObject();
    }
    if(empty($worker2))
    {
        $worker2 = Workerdetails::setEmptyObject();
    }
    
}  
$katti_bibaran_payment = KattiDetails::find_by_plan_id_and_type($_GET['id'],2);
$kar_rakam_details = Kar_Bibran::find_by_plan_id($_GET['id']);
?>
<?php include("menuincludes/header.php"); ?>
<!-- js ends -->
<title>अन्तिम भुक्तानी सम्बन्धमा ।  print page:: <?php echo SITE_SUBHEADING;?></title>
<style>
    #div_new{
        background-image: url("images/nepali_paper.jpg");
    }
</style>
</head>

<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
    	        <div class="maincontent" id="div_new">
                    <h2 class="headinguserprofile">रकम भुक्तानी सम्बन्धमा । <a href="<?=$link?>" class="btn">पछि जानुहोस</a></h2>
                 
                   
                    <div class="OurContentFull" >
                    	 <form method="get" action="quotation_antim_bhuktani_print.php?id=<?=$_GET['id']?>" target="_blank" >
                            <div class="myPrint"><input type="hidden" name="id" value="<?=$_GET['id']?>" /><input type="submit" value="प्रिन्ट गर्नुहोस" name="submit" /></div>
                        <div class="userprofiletable" id="div_print">
                        	<div class="printPage">
                                    <div class="printlogo"><img src="images/janani.png" alt="Logo"></div>
                                    <h1 class="margin1em letter_title_one"><?php echo SITE_LOCATION;?></h1>
									<h4 class="margin1em letter_title_two"><?php echo SITE_HEADING;?> </h4>
									<h5 class="margin1em letter_title_three"><?php echo SITE_ADDRESS;?></h5>
                                    <!--<div class="subjectbold letter_subject">टिप्पणी आदेश</div>-->
                                    </div>
									<div class="myspacer"></div>
									
									<div class="printContent">
										<div class="mydate">मिति :<input type="text" name="date_selected" value="<?php echo generateCurrDate(); ?>" id="nepaliDate5" /></div>
										<div class="patrano">पत्र संख्या : <?php echo convertedcit($fiscal->year); ?></div>
										
                                        <div class="chalanino">योजना दर्ता नं :<?php echo convertedcit($_GET['id']);?></div>
                                        <div class="chalanino"> चलानी नं . : </div>
										<div class="myspacer20"></div>
										
										<div class="subject">   विषय:-अन्तिम भुक्तानी सम्बन्धमा ।</div>
										<div class="myspacer20"></div>
										<div class="bankname">श्रीमान् 
                                        </div>                                  
										<div class="banktextdetails"  >
										
                                            यस <strong><?php echo SITE_LOCATION;?></strong>को स्वीकृत वार्षिक  कार्यक्रम अनुसार मिति 
                                            <strong><?php echo convertedcit($data2->miti);?></strong><!--(योजना संझौताको मिति)--> मा यस 
                                            कार्यलय र  <b><u> <?php echo Contractordetails::getName($data2->samjhauta_party);?></u></b>
                                            <!--(योजनाको संचालन गर्ने उपभोक्ता समितिको नाम)--> बिच संझौता भई यस <?php echo SITE_TYPE;?>
                                            को वडा नं <strong><?php echo convertedcit($data3->yojana_place);?></strong><!--(योजना संचालन हुने वडा नं)-->  मा <b><u><?php echo $data1->program_name;?></u></b><!--(योजनाको नाम)-->
                                            योजना संचालनको कार्यदेश दिइएकोमा मिति <strong>
                                            <?php echo convertedcit($data2->yojana_end_date);?></strong>
                                            <!--(योजनाको काम सम्पन्न भएको मिति)--> मा तोकिएको कार्य सम्पन्न गरिसकिएकोले 
                                            उक्त योजनाको आम्दानी
                                            तथा खर्चको अनुमोदन गरि सार्बजनिक 
                                            परिक्षण समेत गरिसकेको र 
                                            योजनाको अन्तिम भुक्तानीको लागि सिफारिस गरिसकेको हुँदा विनियोजित रकम 
                                            भुक्तानी पाउँ भनि माग भई आएको छ|<br>
                                            सो सम्बन्धमा प्राबिधिकबाट सम्बन्धित योजनाको स्थलगत निरिक्षण गरि पेश हुन आएको 
                                            प्राबिधिक मुल्यांकन प्रतिबेदन, <strong><?php echo SITE_TYPE;?></strong> स्तरीय/ वडा 
                                            स्तरीय अनुगमन समितिको प्रतिबेदन, सम्बन्धित वडा कार्यालयको सिफारिस, सम्पन्न योजनाको फोटो, 
                                            कार्यालय प्रमुखको तोक आदेश लगायत उपभोक्ता समिति बाट पेश हुन आएको अन्य संलग्न कागजातहरुको 
                                            आधारमा खुद भुक्तानि दिनु पर्ने रकममा आय कर/ घर बहाल कर/ मु.अ. कर लगायत नियमानुसार 
                                            कट्टी गर्नु पर्ने सम्पूर्ण करहरु कट्टी गरि बाँकि रकम मात्र भुक्तानी हुन निर्णयार्थ पेश गरिएको छ|
                                                                                        
                                        </div>                               
                                        	<div class="subject">तपशिल</div>
                                            <?php   $datas=Plantotalinvestment::find_by_plan_id($_GET['id']);
                                            $add=$datas->agreement_gauplaika+$datas->agreement_other+$datas->costumer_agreement+$datas->other_agreement;?>
                                            <table class="table table-bordered table-responsive myWidth100">
                                            	<tr>
                                                    <td class="myWidth50 myTextalignRight">बिनियोजन श्रोत र व्याख्या : </td>
                                                    <td> <?php echo $data1->parishad_sno;?></td>
                                                </tr>
                                                <tr>
                                                	<td class="myTextalignRight">योजनाको कुल अनुदान रकम : </td>
                                                    <td>रु. <?php echo convertedcit($data1->investment_amount);?>/-</td>
                                                </tr>
                                                <tr>
                                                    <td class="myTextalignRight">कार्यदेश दिएको रकम: </td>
                                                    <td> <?php echo convertedcit($investment_data->kul_lagat_anudan);?>/-</td>
                                                </tr>
                                            	<tr>
                                                	<td class="myTextalignRight">योजनाको मुल्यांकन मिति : </td>
                                                    <td><?php echo convertedcit($data4->plan_evaluated_date);?></td>
                                                </tr>
                                                <tr>
                                                	<td class="myTextalignRight">योजनाको मुल्यांकन रकम : </td>
                                                    <td>रु. <?php echo convertedcit($data4->plan_evaluated_amount);?>/-</td>
                                                </tr>
                                                
                                                <tr>
                                                	<td class="myTextalignRight">मुल्यांकन अनुसार हाल सम्म भुक्तानी लगेको कुल  रकम : </td>
                                                    <td>रु. <?php echo convertedcit($data4->payment_till_now);?>/-</td>
                                                </tr>
                                                <tr>
                                                	<td class="myTextalignRight">पेश्की भुक्तानी लगेको कट्टी रकम : </td>
                                                    <td>रु. <?php echo convertedcit($data4->advance_payment);?>/-</td>
                                                </tr>
                                                <tr style="display:none;">
                                                	<td class="myTextalignRight">भुक्तानी दिनु पर्ने कुल बाँकी  रकम : </td>
                                                    <td>रु. <?php echo convertedcit($data4->remaining_payment_amount);?>/-</td>
                                                </tr>
                                                <!-- change made-->
                                                <tr>
                                                	<td class="myTextalignRight">VAT Amount : </td>
                                                    <td>रु. <?php echo convertedcit($data4->vat_amt);?>/-</td>
                                                </tr>
                                                <tr>
                                                	<td class="myTextalignRight">कन्टेन्जेन्सी  कट्टी रकम : </td>
                                                    <td>रु. <?php echo convertedcit($data4->final_contengency_amount);?>/-</td>
                                                </tr>
                                                <tr>
                                                	<td class="myTextalignRight">Retention Amount : </td>
                                                    <td>रु. <?php echo convertedcit($data4->retention);?>/-</td>
                                                </tr>
                                                <tr>
                                                	<td class="myTextalignRight">TDS Amount : </td>
                                                    <td>रु. <?php echo convertedcit($data4->tds);?>/-</td>
                                                </tr>
                                                 <!-- change made-->
                                                <tr>
                                                	<td class="myTextalignRight">जम्मा कट्टी रकम : </td>
                                                    <td>रु.<?php echo convertedcit($data4->final_contengency_amount+$data4->retention+$data4->tds);?>/-</td>
                                                </tr>
                                                <tr>
                                                	<td class="myTextalignRight">हाल भुक्तानी दिनु पर्ने खुद रकम : </td>
                                                    <td> रु.<?php echo convertedcit($data4->final_total_paid_amount);?>/-</td>
                                                </tr>
                                            </table>
                                            <table class="table table-bordered table-responsive">
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
                                         if(!empty($kar_rakam_details)) :
                                            $total_amount = '';
                                            foreach ($kar_rakam_details as $key => $value) :?>
                                                <tr>
                                                  <td><?php echo convertedcit($i++)?></td>
                                                  <td><?php echo !empty($value->kar_topic) ? convertedcit($value->kar_topic) : '--';?></td>
                                                  <td><?php echo !empty($value->kar_rakam) ? convertedcit($value->kar_rakam): convertedcit(0);?></td>
                                                  <td><?php echo !empty($value->kar_percent) ? convertedcit($value->kar_percent) : convertedcit(0);?></td>
                                                  <td><?php echo !empty($value->total_kar_amount) ? convertedcit($value->total_kar_amount) :convertedcit(0);?></td>
                                                  <?php $total_amount +=$value->total_kar_amount;?>
                                                  
                                              </tr>
                                          <?php endforeach;endif;?>
                                
                                      </tbody>
                                      <tfoot>
                                          <tr>
                                            <td>हाल भुक्तानी दिनु पर्ने खुद रकम</td>
                                            <td><?php echo convertedcit($data4->final_total_paid_amount);?> </td>
                                            <td colspan =2><b>जम्मा कर रकम</b> </td>
                                            <td> <?php echo convertedcit($total_amount)?></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4"><b>कर पछीको खुद भुक्तानी योग्य रकम </b></td>
                                            <td><?php $total_amount_after_tax =$data4->final_total_paid_amount - $total_amount;
                                            echo convertedcit($total_amount_after_tax) ?>
                                        </td>
                                    </tr>
                                </tfoot>
                                </table>
                                        </div>
										<div class="myspacer20"></div>
                                                                                <div class="oursignature">सदर गर्ने <br/>
                                                                                    <select name="worker1" class="form-control worker" id="worker_1" >
                                                                                        <option value="">छान्नुहोस्</option>
                                                                                        <?php foreach($workers as $worker){?>
                                                                                        <option value="<?=$worker->id?>" <?php if($print_history->worker1 == $worker->id){echo 'selected="selected"';}?>><?=$worker->authority_name?></option>
                                                                                        <?php }?>
                                                                                    </select>
                                                                                    <input type="text" name="post" class="form-control" id="post_1" value="<?=$worker1->post_name?>">
                                                                                </div>
                                                                                
                                                                                  <div class="oursignature" style="margin-right: 200px;">योजना शाखा<br/>
                                                                                    <select name="worker3" class="form-control worker" id="worker_3" >
                                                                                        <option value="">छान्नुहोस्</option>
                                                                                        <?php foreach($workers as $worker){?>
                                                                                        <option value="<?=$worker->id?>" <?php if($print_history->worker3 == $worker->id){echo 'selected="selected"';}?>><?=$worker->authority_name?></option>
                                                                                        <?php }?>
                                                                                    </select>
                                                                                    <input type="text" name="post" class="form-control" id="post_3" value="<?=$worker3->post_name?>">
                                                                                </div>
                                                                                
                                                                                <div class="oursignatureleft">पेस गर्ने <br/>
                                                                                    <select name="worker2" class="form-control worker" id="worker_2">
                                                                                        <option value="">छान्नुहोस्</option>
                                                                                        <?php foreach($workers as $worker){?>
                                                                                        <option value="<?=$worker->id?>" <?php if($print_history->worker2 == $worker->id){echo 'selected="selected"';}?>><?=$worker->authority_name?></option>
                                                                                        <?php }?>
                                                                                    </select>
                                                                                    <input type="text" name="post" class="form-control" id="post_2" value="<?=$worker2->post_name?>">
                                                                                </div>
										<div class="myspacer"></div>
									</div>
                                
                            </div>
                        </div>
                  </div>
                </div><!-- main menu ends -->
            </div>
         </div>   
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>