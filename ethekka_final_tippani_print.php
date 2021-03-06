<?php require_once("includes/initialize.php");
if(!$session->is_logged_in()){ redirect_to("logout.php");}
if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
{
  redirectUrl();
}
$date_selected= $_GET['date_selected'];
$url = get_base_url();
$ward_address=WardWiseAddress();
$address= getAddress();
$user = getUser();
$print_history = PrintHistory::find_by_url_and_plan_id($url, $_GET['id']);
if(empty($print_history))
{
    $print_history = new PrintHistory;
}
$print_history->url = get_base_url();
$print_history->nepali_date = $date_selected;
$print_history->english_date = DateNepToEng($date_selected);
$print_history->user_id = $user->id;
$print_history->worker1 = $_GET['worker1'];
$print_history->worker2 = $_GET['worker2'];
$print_history->worker3 = $_GET['worker3'];
$print_history->save();
$worker1 = Workerdetails::find_by_id($_GET['worker1']);
if(!empty($_GET['worker1']))
{
$worker1 = Workerdetails::find_by_id($_GET['worker1']);
}
else
{
    $worker1 = Workerdetails::setEmptyObject();
}
if(!empty($_GET['worker2']))
{
$worker2 = Workerdetails::find_by_id($_GET['worker2']);
}
else
{
    $worker2 = Workerdetails::setEmptyObject();
}

if(!empty($_GET['worker3']))
{
   $worker3 = Workerdetails::find_by_id($_GET['worker3']);
}
else
{
    $worker3 = Workerdetails::setEmptyObject();
}
?>
   <?php $data1=  Plandetails1::find_by_id($_GET['id']);
    $investment_data = Ethekka_lagat::find_by_plan_id($_GET['id']);
    $data2= Ethekkainfo::find_by_plan_id($_GET['id']);
    $data4=  Planamountwithdrawdetails::find_by_plan_id($_GET['id']);
    $myad_thap = Plantimeadditionaffiliation::find_by_sql("select * from plan_time_addition_affiliation where period=1 and plan_id=".$_GET['id']);
    $kar_rakam_details = Kar_Bibran::find_by_plan_id($_GET['id']);
	$fiscal = FiscalYear::find_by_id($data1->fiscal_id); ?>
<?php include("menuincludes/header1.php"); ?>
<!-- js ends -->
<title>अन्तिम भुक्तानी सम्बन्धमा ।  print page:: <?php echo SITE_SUBHEADING;?></title>
<style>
                          table {

                            width: 100%;
                            border: none;
                          }
                          #div_new{
                              background-image: url("images/nepali_paper.jpg");
                              height: 150%;
                          }
                        </style>
</head>

<body>
    <div class="myPrintFinal" id="div_new"> 
    	<div class="userprofiletable">
             <div class="printPage">
             <div class="image-wrapper">
                    <a href="#" ><img src="images/janani.png" align="left" class="scale-image"/></a>
                    <div />
                    
                    <div class="image-wrapper">
                    <a href="#" target="_blank" ><img src="images/bhaire.png" align="right" class="scale-image"/></a>
                    <div />
                                    <div style="color:red">
									<h1 class="marginright1.5 letter-title-one"><?php echo SITE_LOCATION;?></h1>
									<h5 class="marginright1.5 letter-title-two"><?php echo $address;?></h5>
									
									<h5 class="marginright1.5 letter-title-four"><?php echo $ward_address;?></h5>
									<h5 class="marginright1.5 letter-title-three"><?php echo SITE_SECONDSUBHEADING;?></h5>
                                    </div>
                                                <div class="myspacer"></div>
                                    <div class="subjectboldright letter_subject">टिप्पणी आदेश</div>
                                    </div>
									<div class="myspacer"></div>
									
									<div class="printContent">
										<div class="mydate">मिति : <?php echo convertedcit($date_selected); ?></div>
										<div class="patrano">पत्र संख्या : <?php echo convertedcit($fiscal->year); ?></div>
										
<div class="chalanino">योजना दर्ता नं :<?php echo convertedcit($_GET['id']);?></div>
										<div class="myspacer"></div>
										
										<div class="subject">   विषय:-अन्तिम भुक्तानी सम्बन्धमा ।</div>
										<div class="myspacer"></div>
										<div class="bankname">श्रीमान् 
                                        </div>
                                                                               
										<div class="banktextdetails"  >
                                        यस <strong><?php echo SITE_LOCATION;?></strong>को स्वीकृत वार्षिक कार्यक्रम  
                                            अनुसार मिति <?php echo convertedcit($investment_data->yojanaa_samjhauta_date);?>
                                            <!--(योजना संझौताको मिति)--> मा यस 
                                            कार्यलय र  <b><u> <?php echo $data2->firm_name;?></u></b><!--(योजनाको संचालन गर्ने उपभोक्ता समितिको नाम)-->
                                            बिच संझौता भई यस <?=SITE_TYPE.'को'?> वडा नं <?php echo convertedcit($data1->ward_no);?><!--(योजना संचालन हुने वडा नं)-->  
                                            मा <b><u><?php echo $data1->program_name;?></u></b><!--(योजनाको नाम)--> योजना संचालनको कार्यदेश 
                                            दिइएकोमा मिति 
                                            <?php 
                                            if(!empty($myad_thap)){
                                                foreach($myad_thap as $mt):
                                                echo convertedcit($mt->extended_date);
                                                endforeach;
                                            }else{
                                                echo convertedcit($investment_data->plan_end_date);
                                            }
                                            ?>
                                            <!--(योजनाको काम सम्पन्न भएको 
                                            मिति)--> मा तोकिएको कार्य सम्पन्न गरिसकियेकोले विनियोजित रकम भुक्तानी पाउँ भनि सम्बन्धित निर्माण व्यावसायी/ कम्पनी/ 
                                            फर्मबाट 
                                            भुक्तानी माग भइ आएको छ| <br>
                                            सो सम्बन्धमा प्राबिधिकबाट सम्बन्धित योजनाको स्थलगत निरिक्षण गरि पेश हुन आएको प्राबिधिक मुल्यांकन प्रतिबेदन, 
                                            <?php echo STARIY;?> 
                                            स्तरीय अनुगमन समितिको प्रतिबेदन, सम्बन्धित वडा कार्यालयको सिफारिस, सम्पन्न योजनाको फोटो, कार्यालय प्रमुखको तोक 
                                            आदेश लगायत निर्माण व्यवसायी/ कम्पनी/ फर्मबाट पेश हुन आएका अन्य संलग्न कागजातहरुको आधारमा खुद भुक्तानी दिनु 
                                            पर्ने रकममा आय कर/ रिटेन्सन एमाउण्ट/ घर बहाल कर/ मु.अ. कर लगायत नियमानुसार कट्टी गर्नु पर्ने सम्पूर्ण करहरु कट्टी 
                                            गरि बाँकी रकम मात्र भुक्तानी हुन निर्णयार्थ पेश गरिएको छ| 
                                        </div>
                                        	<div class="subject">तपशिल</div>
                                                <table class="table-bordered myWidth100">
                                                <tr>
                                                    <td class="myWidth50">बिनियोजन श्रोत र व्याख्या: </td>
                                                    <td> <?php echo $data1->parishad_sno;?></td>
                                                </tr>
                                                <tr>
                                                    <td class="myWidth50">योजनाको नाम / ठेक्का नं : </td>
                                                    <td> <?php echo $data1->program_name;?> / <?php echo convertedcit($contract_info->thekka_no);?></td>
                                                </tr>
                                                <tr>
                                                	<td class="myWidth50">योजना सम्पन्न हुने मिति : </td>
                                                    <td><?php echo convertedcit($data4->yojana_sakine_date);?></td>
                                                </tr>
                                                <tr>
                                                	<td class="myWidth50">योजनाको काम सम्पन्न भएको मिति : </td>
                                                    <td><?php echo convertedcit($data4->plan_end_date);?></td>
                                                </tr>
                                            	<tr>
                                                	<td class="myWidth50">योजनाको मुल्यांकन मिति : </td>
                                                    <td><?php echo convertedcit($data4->plan_evaluated_date);?></td>
                                                </tr>
                                                <?php if(!empty($data4->advance_payment)){?>
                                                <tr>
                                                	<td>पेश्की भुक्तानी लगेको कट्टी रकम : </td>
                                                    <td>रु. <?php echo convertedcit($data4->advance_payment);?>/-</td>
                                                </tr>
                                                <?php }else{?>
                                                <?php }?>
                                                <?php if(!empty($data4->contingency)){?>
                                                <tr>
                                                    <td>कन्टिनजेन्सि कट्टी रकम </td>
                                                    <td>रु. <?php echo convertedcit($data4->contingency);?>/-</td>
                                                </tr>
                                                <?php }else{?>
                                                <?php }?>
                                                <?php if(!empty($data4->bipat)){?>
                                                <tr>
                                                    <td>विपत व्यवस्थापन कर कट्टी रकम</td>
                                                    <td>रु. <?php echo convertedcit($data4->bipat);?>/-</td>
                                                </tr>
                                                <?php }else{?>
                                                <?php }?>
                                                <?php if(!empty($data4->marmat)){?>
                                                <tr>
                                                    <td>मर्मत कट्टी रकम </td>
                                                    <td>रु. <?php echo convertedcit($data4->marmat);?>/-</td>
                                                </tr>
                                                <?php }else{?>
                                                <?php }?>
                                                
                                                	<td>काम घटी बढी रकम : </td>
                                                    <td>रु. <?php echo convertedcit($data4->final_bhuktani_ghati_amount);?>/-</td>
                                                </tr>
                                                 <!-- change made-->
                                                <tr>
                                                	<td>हाल भुक्तानी दिनु पर्ने खुद रकम : </td>
                                                    <td> रु.<?php echo convertedcit($data4->final_total_paid_amount);?>/-</td>
                                                </tr>
                                                <tr>
                                                    <td>भुक्तानी भएको मिति : </td>
                                                    <td><?php echo convertedcit($data4->created_date);?></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="myspacer"></div>
										<table class="table-bordered">
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
										<div class="myspacer20"></div>
										<div class="oursignature">सदर गर्ने <br>
                                                                                    <?php 
                                                                                        if(!empty($worker1))
                                                                                        {
                                                                                            echo $worker1->authority_name."<br/>";
                                                                                            echo $worker1->post_name;
                                                                                        }
                                                                                    ?>

                                                                                </div>
                                                                                 <div class="oursignature" style="margin-right:150px">लेखा शाखा <br/>
                                                                                    <?php 
                                                                                        if(!empty($worker3->authority_name))
                                                                                        {
                                                                                            echo $worker3->authority_name."<br/>";
                                                                                            echo $worker3->post_name;
                                                                                        }
                                                                                    ?>
                                                                                </div>
										<div class="oursignatureleft">पेस गर्ने<br>
                                                                                    <?php 
                                                                                        if(!empty($worker2))
                                                                                        {
                                                                                            echo $worker2->authority_name."<br/>";
                                                                                            echo $worker2->post_name;
                                                                                        }
                                                                                    ?>

                                                                                </div>
									</div><!-- print page ends -->
                            </div><!-- userprofile table ends -->
                        </div><!-- my print final ends -->