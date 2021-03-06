<?php require_once("includes/initialize.php");
if(!$session->is_logged_in()){ redirect_to("logout.php");}
if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
{
  redirectUrl();
}
$date_selected= $_GET['date_selected'];
$url = get_base_url();
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
$print_history->plan_id = $_GET['id'];
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
    $data2= Contractmoredetails::find_by_plan_id($_GET['id']);
    $investment_data = Contract_total_investment::find_by_plan_id($_GET['id']);
    $contractor_details=  Contractentryfinal::find_by_status(1,$_GET['id']);
    $data3= Contractordetails::find_by_id($contractor_details->contractor_id);
    $fiscal = FiscalYear::find_by_id($data1->fiscal_id); 
    $data4= Contractanalysisbasedwithdraw::getMaxInsallmentByPlanId($_GET['id']);
    $data5=  Contractanalysisbasedwithdraw::find_by_max($data4,$_GET['id']);
    $ward_address=WardWiseAddress();
$address= getAddress();
    ?>
 
<?php include("menuincludes/header1.php"); ?>
<!-- js ends -->
<title>मुल्यांकनको आधारमा भुक्तानीको टिप्पणी । print page:: <?php echo SITE_SUBHEADING;?></title>
<style>
                          table {

                            width: 100%;
                            border: none;
                          }
                          #div_new{
                              background-image: url("images/nepali_paper.jpg");
                              height: 100%;
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
                                    </div>
									<div class="myspacer"></div>
									<div class="subjectboldright letter_subject">टिप्पणी आदेश</div>
									<div class="printContent">
										<div class="mydate">मिति : <?php echo convertedcit($date_selected); ?></div>
										<div class="patrano">पत्र संख्या : <?php echo convertedcit($fiscal->year); ?></div>
										<div class="chalanino">योजना दर्ता नं : <?php echo convertedcit($_GET['id'])?></div>
										<div class="myspacer"></div>
										
										<div class="subject"> <u> विषय:- मुल्यांकनको आधारमा रकम भुक्तानी सम्बन्धमा ।</u></div>
										<div class="myspacer"></div>
										<div class="bankname">श्रीमान् </div>
                                                                               
										<div class="banktextdetails"  >
											 यस <?php echo SITE_LOCATION;?>को स्वीकृत वार्षिक कार्यक्रम  
                                                                                         अनुसार मिति <?php echo convertedcit($data2->miti);?><!--(योजना संझौताको मिति)--> मा यस 
                                                                                         कार्यलय र  <b><u> <?php echo $data3->contractor_name;?></u></b><!--(योजनाको संचालन गर्ने उपभोक्ता समितिको नाम)-->
                                                                                         बिच संझौता भई यस गाँउपालिकाको वडा नं <?php echo convertedcit($data1->ward_no);?><!--(योजना संचालन हुने वडा नं)-->  
                                                                                         मा <b><u><?php echo $data1->program_name;?></u></b><!--(योजनाको नाम)--> योजना संचालनको कार्यदेश दिइएकोमा मिति <?php echo convertedcit($data5->evaluated_date);?><!--(योजनाको काम सम्पन्न भएको 
                                                                                         मिति)--> मा प्राबिधिक मुल्याकन गरि नियमानुसारको रकम भुक्तानी गर्न प्राबिधिकबाट प्रतिबेदन पेश हुन आएको हुँदा उक्त प्राबिधिक प्रतिबेदन, कार्यालय प्रमुखको तोक आदेश, सम्बन्धित निर्माण ब्यवसायी/ कम्पनि/ फर्मको रकम भुक्तानीको माग निबेदन एबं अन्य संलग्न कागजातहरुको आधारमा खुद भुक्तानी दिनु पर्ने रकममा आय कर/ रिटेन्सन एमाउण्ट/ घर बहाल कर/ मु.अ. कर लगायत नियमानुसार कट्टी गर्नु पर्ने सम्पूर्ण करहरु कट्टी गरि बाँकी रकम मात्र भुक्तानी हुन निर्णयार्थ पेश गरिएको छ|   
</div>                       
										
                                        
                                        	<div class="subject">तपशिल</div>
                                            <table class="table-bordered myWidth100">
                                               
    <?php 
    if($data5->payment_evaluation_count==1)
    {
        $period="पहिलो";
    }
    if($data5->payment_evaluation_count==2)
    {
        $period="दोस्रो";
    }
    if($data5->payment_evaluation_count==3)
    {
        $period="तेस्रो";
    }
     if($data5->payment_evaluation_count==4)
    {
        $period="चौथो";
    }
     if($data5->payment_evaluation_count==5)
    {
        $period="पाचौ";
    }
     if($data5->payment_evaluation_count==5)
    {
        $period="छैठो";
    }
?>
                                            <?php $vat_with = $data5->evaluated_amount + ($data5->evaluated_amount*13/100);?>
                                               <tr>
                                                    <td class="myWidth50">बिनियोजन श्रोत र व्याख्या: </td>
                                                    <td> <?php echo $data1->parishad_sno;?></td>
                                                </tr>
                                                <tr>
                                                    <td class="myWidth50">अनुदानको किसिम / बिषयगत क्षेत्र : </td>
                                                    <td> <?php echo Topicareaagreement::getName($data1->topic_area_agreement_id);?> / <?php echo Topicarea::getName($data1->topic_area_id);?></td>
                                                </tr>
                                                <tr>
                                                    <td class="myWidth50">कार्यदेश दिएको रकम: </td>
                                                    <td>रु. <?php echo convertedcit(placeholder($investment_data->bhuktani_anudan));?>/-</td>
                                                </tr>
                                            	<tr>
                                                    <td class="myWidth50">योजनाको मुल्यांकन किसिम : </td>
                                                    <td> <?php echo $period;?></td>
                                                </tr>
                                                <tr>
                                                	<td>योजनाको मुल्यांकन मिति : </td>
                                                    <td><?php echo convertedcit($data5->evaluated_date);?></td>
                                                </tr>
                                                <tr>
                                                	<td>योजनाको मुल्यांकन रकम(भ्याट सहित) : </td>
                                                    <td>रु. <?php echo convertedcit($vat_with);?>/-</td>
                                                </tr>
                                                <tr>
                                                	<td>योजनाको मुल्यांकन रकम(भ्याट बाहेक ) : </td>
                                                    <td>रु.<?php echo convertedcit($data5->evaluated_amount);?>/-</td>
                                                </tr>
                                                <?php if(!empty($data5->contingency)){?>
                                                <tr>
                                                	<td>कन्टिनजेन्सि कट्टी रकम : </td>
                                                    <td>रु.<?php echo convertedcit($data5->contingency);?>/-</td>
                                                </tr>
                                                <?php }else{?>
                                                <?php }?>
                                                <?php if(!empty($data5->bipat)){?>
                                                <tr>
                                                	<td>विपत व्यवस्थापन कर कट्टी रकम : </td>
                                                    <td>रु.<?php echo convertedcit($data5->bipat);?>/-</td>
                                                </tr>
                                                <?php }else{?>
                                                <?php }?>
                                                <?php if(!empty($data5->marmat)){?>
                                                <tr>
                                                	<td>मर्मत कट्टी रकम : </td>
                                                    <td>रु.<?php echo convertedcit($data5->marmat);?>/-</td>
                                                </tr>
                                                <?php }else{?>
                                                <?php }?>
                                                <tr>
                                                	<td>मुल्य अभिवृद्धि कर रकम (<?php echo convertedcit(13);?>% ) : </td>
                                                    <td>रु.<?php echo convertedcit($data5->vat_amt);?>/-</td>
                                                </tr>
                                                <?php if(!empty($data5->dharauti_per)){?>
                                                <tr>
                                                	<td>धरौटी कर कट्टी रकम (<?php echo convertedcit($data5->dharauti_per);?>% ) : </td>
                                                    <td>रु.<?php echo convertedcit($data5->dharauti);?>/-</td>
                                                </tr>
                                                <?php }else{?>
                                                <?php }?>
                                                <tr>
                                                	<td>मूल्य अभिव्रिधि कर (६.५%) : </td>
                                                    <td>रु.<?php echo convertedcit($data5->vat_per);?>/-</td>
                                                </tr>
                                                <?php if(!empty($data5->agrim_kar_per)){?>
                                                <tr>
                                                	<td>अग्रिम आय कर रकम (<?php echo convertedcit($data5->agrim_kar_per);?>% ) : </td>
                                                    <td>रु.<?php echo convertedcit($data5->agrim_kar_amt);?>/-</td>
                                                </tr>
                                                <?php }else{?>
                                                <?php }?>
                                                <!--<tr>-->
                                                <!--	<td>बहाल कर रकम (<?php echo convertedcit($data5->bahal_per);?>% ) : </td>-->
                                                <!--    <td>रु.<?php echo convertedcit($data5->bahal_amt);?></td>-->
                                                <!--</tr>-->
                                                <!--<tr>-->
                                                <!--	<td>पारिश्रमीक कर कट्टी रकम (<?php echo convertedcit($data5->paris_per);?>% ) : </td>-->
                                                <!--    <td>रु.<?php echo convertedcit($data5->paris_amt);?></td>-->
                                                <!--</tr>-->
                                                <!--<tr>-->
                                                <!--	<td>सामाजिक सुरक्षा कर रकम (<?php echo convertedcit($data5->samajik_per);?>% ) : </td>-->
                                                <!--    <td>रु.<?php echo convertedcit($data5->samajik_amt);?></td>-->
                                                <!--</tr>-->
                                                <?php if(!empty($data5->advance_payment)){?>
                                                <tr>
                                                	<td>पेश्की भुक्तानी लगेको कट्टी रकम : </td>
                                                    <td>रु.<?php echo convertedcit($data5->advance_payment);?>/-</td>
                                                </tr>
                                                <?php }else{?>
                                                <?php }?>
                                                <tr>
                                                	<td>जम्मा कट्टी रकम : </td>
                                                    <td>रु.<?php echo convertedcit(placeholder($data5->total_amount_deducted));?>/-</td>
                                                </tr>
                                                <tr>
                                                	<td>हाल भुक्तानी दिनु पर्ने खुद रकम : </td>
                                                    <td>रु.<?php echo convertedcit(placeholder($data5->total_paid_amount));?>/-</td>
                                                </tr>
                                                <tr>
                                                	<td>निर्माण ब्याबसायी फर्मको विवरण : </td>
                                                    <td><?php echo $data3->contractor_name;?>,<?php echo $data3->contractor_address;?>-<?php echo convertedcit($data3->contractor_contact);?></td>
                                                </tr>
                                            
                                            </table>
                                        </div>
										
										<div class="myspacer30"></div>

										<div class="oursignature">सदर गर्ने <br>
                                                                                    <?php 
                                                                                        if(!empty($worker1->authority_name))
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
										<div class="oursignatureleft">पेस गर्ने<br/>
                                                                                        <?php 
                                                                                            if(!empty($worker2->authority_name))
                                                                                            {
                                                                                                echo $worker2->authority_name."<br/>";
                                                                                                echo $worker2->post_name;
                                                                                            }
                                                                                        ?>
                                                                                 </div>
										<div class="myspacer"></div>
</div><!-- print page ends -->
                            </div><!-- userprofile table ends -->
                        </div><!-- my print final ends -->
