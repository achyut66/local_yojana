<?php require_once("includes/initialize.php"); 
if(!$session->is_logged_in()){ redirect_to("logout.php");}
if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
{
  redirectUrl();
}
	$datas= Bankinformation::find_all();
        $data=Plandetails1::find_by_id($_GET['id']);
         $result = Ethekka_lagat::find_by_plan_id($_GET['id']);
        if(!empty($result))
        {
            $data3=  Ethekka_lagat::find_by_plan_id($_GET['id']);
            $data1= Ethekkainfo::find_by_plan_id($_GET['id']);
             $name = "उपभोक्ताबाट";
             
        }
        else
        {
            $data3= AmanatLagat::find_by_plan_id($_GET['id']);
            $data1= Amanat_more_details::find_by_plan_id($_GET['id']);
             $name = "";
             
        }
        $data4=Planstartingfund::find_by_plan_id($_GET['id']);
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
$print_history->save();
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
$new_data1 = $_GET['data1'];
$new_data2 = $_GET['data2'];
//dynamic data
$fiscal = FiscalYear::find_by_id(1); //print_r($fiscal);
$ward_address=WardWiseAddress();
$address= getAddress();
?>
<?php
$peski = $_GET['peski_type'];
$data5 = Planstartingfund::find_by_plan_id($_GET['id']);//print_r($data5);
?> 
<?php include("menuincludes/header1.php"); ?>
<title>पेश्की संझौताको टिप्पणी print page:: <?php echo SITE_SUBHEADING;?></title>
<style>
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

                                    <h5 class="marginright1.5 letter-title-four">
                                        <?php
                                        if($user->mode=='user'){
                                            echo $user->ward_add;
                                        }else {
                                            echo $ward_address;
                                        }
                                        ?>
                                    </h5>
									<h5 class="marginright1.5 letter-title-three"><?php echo SITE_SECONDSUBHEADING;?></h5>
                                </div> 
                                   
									<div class="myspacer"></div>
									<div class="subjectboldright letter_subject">टिप्पणी आदेश</div>
									<div class="printContent">
										<div class="mydate">मिति :<?php echo convertedcit($date_selected); ?> </div>
										<div class="patrano">पत्र संख्या: <?php echo convertedcit($fiscal->year);?> </div>
										<div class="chalanino">योजना दर्ता नं : <?php echo convertedcit($_GET['id'])?></div>
										<div class="chalanino"> चलानी नं . : </div>
                                        <div class="subject">
                                            <u>विषय:-
                                                <?php if(!empty($_GET['subject'])){
                                                    echo $_GET['subject'];
                                                }else{
                                                    echo "योजना संझौता गरी पेश्की उपलब्ध गराउने सम्बन्धमा ।";
                                                }?>
                                            </u>
                                        </div>
										<div class="bankname">श्रीमान्</div>
										
										<div class="banktextdetails">
                                        यस कार्यालयको स्वीकृत बार्षिक कार्यक्रम अनुसार <b><?php echo SITE_LOCATION;?></b> वडा नं.<b>
											    <?php echo convertedcit($data->ward_no);?></b> मा <b><?php echo convertedcit($data->program_name);?></b>  
											    स्वीकृत भइ उक्त योजनामा प्राबिधिकबाट रु <b><?php echo convertedcit($data3->contract_total_investment  );?></b> 
											    बराबरको लगत ईस्टमेट पेश भइ स्वीकृत भएकोमा मिति <b><?php echo convertedcit($data3->yojanaa_samjhauta_date);?></b>
											    मा कुल लागत रु <b><?php echo convertedcit($data3->contract_total_investment);?></b> मा 
                                                <b><?php echo SITE_TYPE;?></b>
											    बाट अनुदान रु <b><?php echo convertedcit($data3->agreement_gaupalika);?></b>  
											    तथा अन्य निकायबाट  (<?=$data3->anya_nikaya?>) अनुदान रु <b><?php echo convertedcit($data3->anya_nikaya_amount);?></b>									    
                                                भएकोमा मिति 
											    <b><?php echo convertedcit($data3->yojana_start_date);?></b> देखी काम सुरु गरी मिति 
                                                <b><?php echo convertedcit($data3->yojana_end_date);?> 
											    </b> भित्रमा योजनाको काम  सम्पन्न गर्नेगरी निवेदन पेश भएकोमा  यस कार्यालयको निर्णय अनुसार मिति 
                                                <b><span id="advance_date"><?php echo convertedcit($data4->advance_return_date);?></span></b>
											    </b> भित्रमा पेश्की फर्छयौट  गरी 
                                                <input type="hidden" id="data1" name="data1"
                                                    value="<?=$newdata1?>">
                                                <span style="border-bottom: 1px solid #6c6b6b;" id="data1_new"
                                                    contenteditable="true"><?=$newdata1?></span> 
                                                र 
											    <strong><?=SITE_LOCATION;?></strong> 
                                                <input type="hidden" id="data2" name="data2"
                                                    value="<?=$newdata2?>">
                                                <span style="border-bottom: 1px solid #6c6b6b;" id="data2_new"
                                                    contenteditable="true"><?=$newdata2?></span> 
											    बमोजिम 
											    उक्त योजना संचालनका लागी रु 
                                                <b><span id="advance"><?php echo convertedcit($data4->advance);?></span></b>
											    पेश्की उपलब्ध गराइ दिनु हुन श्रीमान समक्ष यो टिप्पणी पेश गरेको छु ।
										</div>  
										<div style="margin-top:50px;"> </div>
										<div class="myspacer30"></div>
                                                                                <div class="oursignature"> सदर गर्ने <br/>
                                                                                <?php 
                                                                                    if(!empty($worker1))
                                                                                    {
                                                                                        echo $worker1->authority_name."<br/>";
                                                                                        echo $worker1->post_name;
                                                                                    }
                                                                                ?>
                                                                                </div>
                                                                                <div class="oursignatureleft">पेस गर्ने <br/>
                                                                                    <?php 
                                                                                        if(!empty($worker2))
                                                                                        {
                                                                                            echo $worker2->authority_name."<br/>";
                                                                                            echo $worker2->post_name;
                                                                                        }
                                                                                    ?>
                                                                                </div>
										<div class="myspacer"></div>
									</div><!-- print content ends -->
                                
                            </div>
                        </div>
                  </div>
</div>
            


                