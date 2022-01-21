<?php require_once("includes/initialize.php");
if(!$session->is_logged_in()){ redirect_to("logout.php");}
if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
{
    redirectUrl();
}
$ward_address=WardWiseAddress();
$address= getAddress();
?>
<?php
$data1= Plandetails1::find_by_id($_GET['id']);
$data2= Ethekka_lagat::find_by_plan_id($_GET['id']);
//print_r($data2);
$data3= Ethekkainfo::find_by_plan_id($_GET['id']);
//print_r($data3);
$fiscal = Fiscalyear::find_by_sql("select * from fiscal_year where is_current=1");
//print_r($fiscal->year);
//print_r($data3);
$name = "";
$link = get_return_url($_GET['id']);
?>
<?php
$budget = Topicareainvestmentsource::find_all();
$fiscal = FiscalYear::find_by_id($data1->fiscal_id);
$workers = Workerdetails::find_all();
$url = get_base_url(1);
$print_history = PrintHistory::find_by_url_and_plan_id($url, $_GET['id']);
if(!empty($print_history))
{
    $worker1 = Workerdetails::find_by_id($print_history->worker1);
    $worker2 = Workerdetails::find_by_id($print_history->worker2);
    $worker3 = Workerdetails::find_by_id($print_history->worker3);
    $worker4 = Workerdetails::find_by_id($print_history->worker4);
    $worker5 = Workerdetails::find_by_id($print_history->worker5);
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
    if(empty($worker3))
    {
        $worker3 = Workerdetails::setEmptyObject();
    }
    if(empty($worker4))
    {
        $worker4 = Workerdetails::setEmptyObject();
    }
    if(empty($worker5))
    {
        $worker5 = Workerdetails::setEmptyObject();
    }
}
?>
<?php $invest_details =  Plantotalinvestment::find_by_plan_id($_GET['id']);

if(empty($invest_details))
{
    $invest_details = Plantotalinvestment::setEmptyObjects();
}
!empty($invest_details->id)? $value="अपडेट गर्नुहोस" : $value="सेभ गर्नुहोस";
?>
<?php include("menuincludes/header.php"); ?>
<?php
$data1 =  Plandetails1::find_by_id($_GET['id']);
$thekka_lagat = Ethekka_lagat::find_by_plan_id($_GET['id']);
$ethekka_info = Ethekkainfo::find_by_plan_id($_GET['id']);
//print_r($ethekka_info);
//print_r($data1);
?>
    <!-- js ends -->
    <title>विषय:- लागत अनुमान स्वीकृत गरि खरिद कार्य अगाडी बढाउने सम्बन्धमा । print page:: <?php echo SITE_SUBHEADING;?></title>
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
            <h2 class="headinguserprofile">विषय:- लागत अनुमान स्वीकृत गरि खरिद कार्य अगाडी बढाउने सम्बन्धमा ।<a href="<?=$link?>" class="btn">पछि जानुहोस </a></h2>
            <div class="OurContentFull" >
                <form method="get" action="ethekka_aashay_suchana_print.php?>" target="_blank" >
                    <div class="myPrint"><input type="hidden" name="id" value="<?=$_GET['id']?>" /><input type="submit" value="प्रिन्ट गर्नुहोस" name="submit" /></div>
                    <div class="userprofiletable" id="div_print">
                        <div class="printPage">
                            <div class="printlogo"><img src="images/emblem_nepal.png" alt="Logo"></div>
                            <h1 class="margin1em letter_title_one"><?php echo SITE_LOCATION;?></h1>
                            <h4 class="margin1em letter_title_two"><?php echo $address;?></h4>
                            <h5 class="margin1em letter_title_three"><?php echo SITE_FIRST_NAME?>, <?php echo SITE_ZONE?></h5>
                            <h5 class="margin1em letter_title_four"><?php echo SITE_SECONDSUBHEADING?></h5>
                            <div class="myspacer"></div>
                            <div class="subjectbold letter_subject"><h4><strong>टिप्पणी आदेश</strong></h4></div>
                            <div class="printContent">
                                <div class="mydate">मिति : <input type="text" name="date_selected" value="<?php
                                    if(!empty($print_history->nepali_date))
                                    {
                                        echo $print_history->nepali_date;
                                    }
                                    else
                                    {
                                        echo generateCurrDate();
                                    }?>" id="nepaliDate5" /></div>
                                <div class="chalanino">योजना दर्ता नं : <?php echo convertedcit($_GET['id'])?></div>
                                <div class="myspacer20"></div>
                                <div class="subject">   <u>विषय:- लागत अनुमान स्वीकृत गरि खरिद कार्य अगाडी बढाउने सम्बन्धमा ।</u></div>
                                <div class="bankname">श्रीमान, </div>
                                <div class="banktextdetails"  >
                                    यस <strong><?php echo SITE_LOCATION;?></strong> <strong><?php echo SITE_HEADING;?></strong>,
                                    <strong><?php echo SITE_ADDRESS;?></strong>को मिति <strong><?php echo convertedcit($ethekka_info->bolpatra_miti)?></strong> गतेको
                                    <strong><?php echo $ethekka_info->bolpatra_m?></strong>मा प्रकाशित बोलपत्र आह्वान सम्बन्धी सूचना अनुसार यस कार्यालयद्वारा सम्पादन हुन
                                    गइरहेको तपसिलको कार्यको लागी दर्ता हुन आएका सिलबन्दी बोलपत्रहरु मध्ये तपसिल बमोजिमको बोलपत्र न्युनतम
                                    मुल्यांकित तथा सारभुतरुपमा प्रभावग्राही भई बोलपत्र मुल्यांकन समितिबाट छनौट भई स्वीकृतीका लागी सिफारिस भई आएको
                                    हुँदा सार्वजनिक खरिद ऐन, २०६३ को दफा २७ को उपदफा २ (१) र दफा ४७ को प्रयोजनार्थ सम्बन्धित सबै बोलपत्रदाताहरुलाई
                                    सूचित गर्न ७ (सात) दिने आशयको सूचना प्रकाशित गर्न मनाशिव देखिएकोले निर्णयार्थ पेश गरेको छु ।
                                </div>
                                <div class="myspacer20"></div>
                                <div class="text-center"><strong><u>तपसिल</u></strong></div>
                                <div class="myspacer"></div>
                                <table class="table table-bordered table-responsive myWidth100 myHeight30">
                                    <thead>
                                    <th>क्र.स.</th>
                                    <th>कामको विवरण</th>
                                    <th>बोलपत्रदाताको नाम र ठेगाना</th>
                                    <th>कबोल गरेको रकम (भ्याट र पि.एस. सहित)</th>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>१.</td>
                                        <td><strong><?php echo $data1->program_name?> - <?php echo convertedcit($ethekka_info->thekka_no)?></strong></td>
                                        <td><strong><?php echo $ethekka_info->firm_name?> - (<?php echo $ethekka_info->firm_address?>)</strong></td>
                                        <td>रु. <strong><?php echo convertedcit($ethekka_info->kabol_rakam)?> - ()</strong></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="myspacer20"></div>
                                <div class="oursignatureleft mymarginright">पेश गर्ने<br/>
                                    योजना तथा अनुगमन उप-शाखा</br>
                                    <select name="worker2" class="form-control worker" id="worker_2">
                                        <option value="">छान्नुहोस्</option>
                                        <?php foreach($workers as $worker){?>
                                            <option value="<?=$worker->id?>" <?php if($print_history->worker2 == $worker->id){echo 'selected="selected"';}?>><?=$worker->authority_name?></option>
                                        <?php }?>
                                    </select>
                                    <input type="text" name="post" class="form-control" id="post_2" value="<?=$worker2->post_name?>">
                                </div>

                            </div>
                            <div class="myspacer"></div>
                        </div>
                        <!--<div class="settingsMenu1"><a href="settings_topic_add_sub.php">सह शिर्षक थप्नुहोस +</a></div>-->
                    </div>
            </div>
        </div>
    </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>