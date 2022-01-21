<?php require_once("includes/initialize.php"); 
if(!$session->is_logged_in()){ redirect_to("logout.php");}
if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
{
  redirectUrl();
}
$user = getUser();
	$datas= Bankinformation::find_all();
        $data=Plandetails1::find_by_id($_GET['id']);
        $result = Plantotalinvestment::find_by_plan_id($_GET['id']);
         if(!empty($result))
        {
            $data3=  Plantotalinvestment::find_by_plan_id($_GET['id']);
            $data1= Moreplandetails::find_by_plan_id($_GET['id']);
             $name = "उपभोक्ताबाट";  
        }
        else
        {
            $data3= AmanatLagat::find_by_plan_id($_GET['id']);
            $data1= Amanat_more_details::find_by_plan_id($_GET['id']);
             $name = "";
        }
       $data4=Planstartingfund::find_by_plan_id($_GET['id']);
//        print_r($data4);exit;
       $link = get_return_url($_GET['id']);
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
//static data
$newdata1 = 'सार्वजनिक खरिद ऐन २०६३ को दफा ५२ (क), सार्वजनिक खरिद नियमावली २०६४ को निएम ५२';
$newdata2 = 'नियमावली २०७६ को नियम १०२ बमोजिम';
//dynamic data
$upabhokta_letter_content = UpabhoktaLetterContent::find_by_letter_plan_id('peski_tippani',$_GET['id']);
// pp($upabhokta_letter_content);

if (!empty($upabhokta_letter_content)) {
    if (!empty($upabhokta_letter_content->data1)) {
        $newdata1 = $upabhokta_letter_content->data1;
    }
    if (!empty($upabhokta_letter_content->data2)) {
        $newdata2 = $upabhokta_letter_content->data2;
    }
}
$fiscal = FiscalYear::find_by_id(1); //print_r($fiscal);
$ward_address=WardWiseAddress();
$address= getAddress();
$ward1 = Costumerassociationdetails0::find_by_plan_id($_GET['id']);
$worker_ward = Workerdetails::find_by_sql("select * from worker_details where authority_ward_no =".$user->ward);
?>
<?php include("menuincludes/header.php"); ?>
<!-- js ends -->
<title>पेश्की संझौताको टिप्पणी print page:: <?php echo SITE_SUBHEADING;?></title>
<style>
    input {
        background-color: #eee;
    }
    #div_new{
        background-image: url("images/nepali_paper.jpg");
    }
</style>
</head>
<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
    	<div class="">
            <div class="">
                <div class="maincontent" id="div_new">
                    <form method="get" id="form" action="print_bank_report03_final.php?id=<?=$_GET['id']?>">
                    <h2 class="headinguserprofile">पेश्की संझौताको टिप्पणी      
                    <a href="<?=$link?>" class="btn">पछि जानुहोस्</a> 
                    <div class="myPrint"><input type="hidden" name="id" value="<?=$_GET['id']?>" />
                    <input type="submit" value="प्रिन्ट गर्नुहोस" name="submit" /></div>
                    </h2>
                    <div class="OurContentFull">
                    	<h2>
                        <div class="text-left">
                                <select name="peski_type" id="peski_type">
                                    <option value="1">प्रथम</option>
                                    <option value="2">दोश्रो</option>
                                    <option value="3">तेस्रो</option>
                                    <option value="4">चौथो</option>
                                </select>
                        </div>  
                        </h2>
                        <?php if(!empty($data4->peski_stat)){?>
                        <div class="userprofiletable">
                        	<div class="printPage">
									<div class="image-wrapper">
                                    <a href="#" ><img src="images/janani.png" align="left" class="scale-image"/></a>
                                    <div />
                                    <div class="image-wrapper">
                                    <a href="#" target="_blank" ><img src="images/bhaire.png" align="right" class="scale-image"/></a>
                                    <div />
									<h1 class="marginright1.5 letter-title-one"><?php echo SITE_LOCATION;?></h1>
									<h5 class="marginright1.5 letter-title-two"><?php echo $address;?></h5>

                                        <h5 class="marginright1.5 letter-title-four">
                                            <?php
                                            if ($user->mode=='user') {
                                                echo $user->ward_add;
                                            } else {
                                                echo $ward_address;
                                            }
                                            ?>
                                        </h5>
									<h5 class="marginright1.5 letter-title-three"><?php echo SITE_SECONDSUBHEADING;?></h5>
									<div class="myspacer"></div>
									<div class="subjectBold letter_subject">टिप्पणी आदेश</div>
									<div class="printContent">
										<div class="mydate">मिति <input type="text" name="date_selected" value="<?php echo generateCurrDate();?>" id="nepaliDate5" /></div>
										<div class="patrano">पत्र संख्या:<?php echo convertedcit($fiscal->year);?> </div>
										<div class="chalanino">योजना दर्ता नं : <?php echo convertedcit($_GET['id'])?></div>
										<div class="chalanino"> चलानी नं . : </div>
                                        <div class="subject" border="none">
                                            <u>बिषय :- <label style="margin-left: 5px;">
                                            <input type="text" style="border:none" class="no-outline" name="subject" value="योजना संझौता गरी पेश्की उपलब्ध गराउने सम्बन्धमा"/></label></u>
                                        </div>
										<div class="bankname">श्रीमान्</div>
										<div class="banktextdetails">
                                        यस कार्यालयको स्वीकृत बार्षिक कार्यक्रम अनुसार <b><?php echo SITE_LOCATION;?></b> वडा नं.<b>
											    <?php echo convertedcit($ward1->program_organizer_group_address);?></b> मा <b><?php echo convertedcit($data->program_name);?></b>  
											    स्वीकृत भइ उक्त योजनामा प्राबिधिकबाट रु <b><?php echo convertedcit($data3->total_investment  );?></b> 
											    बराबरको लगत ईस्टमेट पेश भइ स्वीकृत भएकोमा मिति <b><?php echo convertedcit($data1->samiti_gathan_date);?></b>
											    मा उपभोक्ता समिति गठन भइ समितिको तर्फबाट  बैठकको निर्णय प्रतिलिपी,निबेदन लगायत अन्य कागज पत्र सहित योजनाको
											    कुल लागत रु <b><?php echo convertedcit($data3->total_investment);?></b> मा <b><?php echo SITE_TYPE;?></b>
											    बाट अनुदान रु <b><?php echo convertedcit($data3->agreement_gauplaika);?></b>  
											    तथा अन्य निकायबाट अनुदान रु <b><?php echo convertedcit($data3->agreement_other);?></b> र उपभोक्ताबाट नगद साझेदारी रु <b> 
											    <?php echo convertedcit($data3->costumer_agreement);?></b> तथा  अन्य साझेदारी रु <b><?php echo convertedcit($data3->other_agreement);?>
											    </b> र  उपभोक्ताबाट जनश्रमदान रु <b><?php echo convertedcit($data3->costumer_investment);?></b> भएकोमा मिति 
											    <b><?php echo convertedcit($data1->yojana_start_date);?></b> देखी काम सुरु गरी मिति 
                                                <b><?php echo convertedcit($data1->yojana_sakine_date);?> 
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
											    उक्त योजना संचालनका लागी माथी उल्लेखित उपभोक्ता समिति लाई रु 
                                                <b><span id="advance"><?php echo convertedcit($data4->advance);?></span></b>
											    पेश्की उपलब्ध गराइ दिनु हुन श्रीमान समक्ष यो टिप्पणी पेश गरेको छु ।
										</div> 
										<div class="myspacer20"></div>
                                        <?php if (empty($user->mode=='user')) {?>
										                                        <div class="oursignature">सदर गर्ने <br/>
                                                                                    <select name="worker1" class="form-control worker" id="worker_1" >
                                                                                        <option value="">छान्नुहोस्</option>
                                                                                        <?php foreach ($workers as $worker) {?>
                                                                                        <option value="<?=$worker->id?>" <?php if ($print_history->worker1 == $worker->id) {
                                                echo 'selected="selected"';
                                            }?>><?=$worker->authority_name?></option>
                                                                                        <?php }?>
                                                                                    </select>
                                                                                    <input type="text" name="post" class="form-control" id="post_1" value="<?=$worker1->post_name?>">
                                                                                </div>
                                        <?php } else {?>
                                                                                <div class="oursignature">सदर गर्ने <br/>
                                                                                    <select name="worker1" class="form-control worker" id="worker_1" >
                                                                                        <option value="">छान्नुहोस्</option>
                                                                                        <?php foreach ($worker_ward as $worker) {?>
                                                                                            <option value="<?=$worker->id?>" <?php if ($print_history->worker1 == $worker->id) {
                                                echo 'selected="selected"';
                                            }?>><?=$worker->authority_name?></option>
                                                                                        <?php }?>
                                                                                    </select>
                                                                                    <input type="text" name="post" class="form-control" id="post_1" value="<?=$worker1->post_name?>">
                                                                                </div>
                                        <?php }?>
                                        <?php if (empty($user->mode==user)) {?>
                                                                                <div class="oursignatureleft">पेस गर्ने <br/>
                                                                                     <select name="worker2" class="form-control worker" id="worker_2">
                                                                                        <option value="">छान्नुहोस्</option>
                                                                                        <?php foreach ($workers as $worker) {?>
                                                                                        <option value="<?=$worker->id?>" <?php if ($print_history->worker2 == $worker->id) {
                                                echo 'selected="selected"';
                                            }?>><?=$worker->authority_name?></option>
                                                                                        <?php }?>
                                                                                    </select>
                                                                                    <input type="text" name="post" class="form-control" id="post_2" value="<?=$worker2->post_name?>"></form>
                                                                                </div>
                                        <?php } else {?>
                                                                                <div class="oursignatureleft">पेस गर्ने <br/>
                                                                                    <select name="worker2" class="form-control worker" id="worker_2">
                                                                                        <option value="">छान्नुहोस्</option>
                                                                                        <?php foreach ($worker_ward as $worker) {?>
                                                                                            <option value="<?=$worker->id?>" <?php if ($print_history->worker2 == $worker->id) {
                                                echo 'selected="selected"';
                                            }?>><?=$worker->authority_name?></option>
                                                                                        <?php }?>
                                                                                    </select>
                                                                                    <input type="text" name="post" class="form-control" id="post_2" value="<?=$worker2->post_name?>"></form>
                                                                                </div>
                                        <?php }?>
										<div class="myspacer"></div>
									</div>
                                <!--<div class="settingsMenu1"><a href="settings_topic_add_sub.php">सह शिर्षक थप्नुहोस +</a></div>-->
                            </div>
                        </div>
                        <?php }else{}?>
                  </div>
                </div><!-- main menu ends -->
            </div>
         </div>   
    </div><!-- top wrap ends -->
    <script>
        JQ(document).ready(function(){
            JQ(document).on('change','#peski_type', function() {
                var obj = JQ(this).val();
                param = {};
                param.name = obj;
                var advance_date = JQ('#advance_date').text();
                var advance = JQ('#advance').text();
                //alert(advance_date);
                JQ.post('get_peski_data.php', param, function (res) {
                    var obj1 = JSON.parse(res);
                    JQ('#advance_date').text(obj1.advance_return_date);
                    JQ('#advance').text(obj1.advance);
                });
            });
            JQ(document).ready(function() {
            JQ(document).on("submit", "#form", function(e) {
                JQ("#data1").val(JQ("#data1_new").text());
                JQ("#data2").val(JQ("#data2_new").text());
            });
        });
        });
    </script>
    <?php include("menuincludes/footer.php"); ?>
   