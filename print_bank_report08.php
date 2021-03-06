<?php require_once("includes/initialize.php");
if(!$session->is_logged_in()){ redirect_to("logout.php");}
if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
{
    redirectUrl();
}

$ward_address=WardWiseAddress();
$address= getAddress();
$workers = Workerdetails::find_all();
$url = get_base_url(1);
$print_history = PrintHistory::find_by_url_and_plan_id($url, $_GET['id']);
$date = !empty($print_history)? $print_history->nepali_date : generateCurrDate();
//static data
$newdata1 = 'सार्वजनिक खरिद ऐन, २०६३ को दफा ४४';
$newdata2 = 'सार्वजनिक खरिद नियमावली, २०७६ को नियम १०७ को उपनियम १';
//dynamic data
$upabhokta_letter_content = UpabhoktaLetterContent::find_by_letter_plan_id('upabhokta_tippani_patra',$_GET['id']);
// pp($upabhokta_letter_content);

if (!empty($upabhokta_letter_content)) {
    if (!empty($upabhokta_letter_content->data1)) {
        $newdata1 = $upabhokta_letter_content->data1;
    }
    if (!empty($upabhokta_letter_content->data2)) {
        $newdata2 = $upabhokta_letter_content->data2;
    }
}
// pp($upabhokta_letter_content);
if(!empty($print_history))
{
    $worker1 = Workerdetails::find_by_id($print_history->worker1);
    $worker2 = Workerdetails::find_by_id($print_history->worker2);
    $worker3 = Workerdetails::find_by_id($print_history->worker3);
    $worker4 = Workerdetails::find_by_id($print_history->worker4);
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
}
?>
<?php $data1=  Plandetails1::find_by_id($_GET['id']);
$result = Plantotalinvestment::find_by_plan_id($_GET['id']);
if(!empty($result))
{
    $data2=  Plantotalinvestment::find_by_plan_id($_GET['id']);
    $data3= Moreplandetails::find_by_plan_id($_GET['id']);
    $name = "उपभोक्ताबाट";

}
else
{
    $data2= AmanatLagat::find_by_plan_id($_GET['id']);
    $data3= Amanat_more_details::find_by_plan_id($_GET['id']);
    $name = "";
}
$percent = ($data2->costumer_agreement / $data1->investment_amount ) * 100;
$percent1 = ($data2->agreement_gauplaika / $data1->investment_amount) * 100;
$percent_final = round( $percent, 2, PHP_ROUND_HALF_UP);
$percent_final1 = round( $percent1, 2, PHP_ROUND_HALF_UP);
$link = get_return_url($_GET['id']);
?>
<?php
$data4= Costumerassociationdetails0::find_by_plan_id($_GET['id']);
$fiscal = FiscalYear::find_by_id($data1->fiscal_id);
$group_heading = Costumerassociationdetails0::find_by_plan_id($_GET['id']);
?>
<?php include("menuincludes/header.php"); ?>
    <!-- js ends -->
    <title>विषय:- योजना संझौता सम्बन्धमा । print page:: <?php echo SITE_SUBHEADING;?></title>
    <style>
        table {

            width: 100%;
            border: none;
        }
        input {
            background-color: #eee;
        }
        #div_print
        {
        background-image: url("images/nepali_paper.jpg");
        }
</style>
</head>
<body>
<?php include("menuincludes/topwrap.php"); ?>
<div id="body_wrap_inner" class="body_wrap">
    <div class="maincontent">
    <form method="get" id="form" action="print_bank_report08_final.php?>">
    <h2 class="headinguserprofile">विषय:- योजना सम्झौता गर्ने सम्बन्धमा  ।
        <a href="<?=$link?>" class="btn">पछि जानुहोस </a>
        <div class="myPrint">
            <input type="hidden" name="id" value="<?=$_GET['id']?>" />
            <input type="submit" value="प्रिन्ट" name="submit" /></div>
    </h2>
    <div class="OurContentFull" >
        <div class="userprofiletable" id="div_print">
            <div class="printPage">
                <div class="image-wrapper">
                    <a href="#" ><img src="images/janani.png" align="left" class="scale-image"/></a>
                    <div />

                    <div class="image-wrapper">
                        <a href="#" target="_blank" ><img src="images/janani.png" align="right" class="scale-image"/></a>
                        <div />
                        <h1 class="marginright1.5 letter-title-one"><?php echo SITE_LOCATION;?></h1>
                        <h5 class="marginright1.5 letter-title-two"><?php echo $address;?></h5>

                        <h5 class="marginright1.5 letter-title-four"><?php echo $ward_address;?></h5>
                        <h5 class="marginright1.5 letter-title-three"><?php echo SITE_SECONDSUBHEADING;?></h5>

                        <div class="myspacer"></div>
                        <div class="subjectbold letter_subject">टिप्पणी आदेश</div>
                        <div class="printContent">
                            <div class="mydate"><input type="text" name="date_selected" value="<?php echo $date;?>" id="nepaliDate5" /></div>
                            <div class="patrano">आ.व. : <?php echo convertedcit($fiscal->year); ?></div>
                            <div class="chalanino">योजना दर्ता नं : <?php echo convertedcit($_GET['id'])?></div>
                            <div class="myspacer20"></div>
                            <div class="subject" border="none">
                                <u>बिषय :- <label style="margin-left: 5px;">
                                        <input type="text" style="border:none" class="no-outline" name="subject" value="योजना सम्झौता सम्बन्धमा"/></label></u>
                            </div>
                            <div class="bankname">श्रीमान , </div>
                            <div class="banktextdetails">
                                यस कार्यालयको स्वीकृत वार्षिक कार्यक्रम अनुसार देहायको योजना संचालनको लागि देहायको विवरण अनुसारको यसै साथ संलग्न स्पेसिफिकेशन, परिमाण, दर र कुल रकम अनुसारको लागत अनुमान स्वीकृत गरि देहायको उपभोक्ता समितसंग यसैसाथ संलग्न शर्तहरुको अधिनमा रही उपभोक्ता समितसंग योजना सम्झौता गरि योजना निर्माण / संचालन कार्यदेश दिन तथा उपभोक्ता समितिको बैंक खाता खोल्न सिफारिस गर्न मनासिब देखि निर्णयार्थ पेश गरेको छु।
                            </div>
                            <div class="myspacer"></div>
                            <table class="table table-bordered table-responsive">

                                <tr>
                                    <td class="myWidth50 myTextalignLeft">योजनाको नाम :</td>
                                    <td><b><?php echo $data1->program_name;?></b></td>
                                </tr>
                                <tr>
                                    <td class="myWidth50 myTextLeft">बिनियोजन श्रोत र ब्याख्या :</td>
                                    <td><b><?php echo $data1->parishad_sno;?></b></td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">ठेगाना :</td>
                                    <td><b><?php echo SITE_NAME?>-<?php echo convertedcit($group_heading->program_organizer_group_address);?></b> </td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">योजनाको बिषयगत क्षेत्रको नाम : </td>
                                    <td><b><?php echo Topicarea::getName($data1->topic_area_id); ?></b></td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">योजनाको शिर्षकगत नाम : </td>
                                    <td><b><?php echo Topicareatype::getName($data1->topic_area_type_id); ?></b></td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">समितिको नाम :</td>
                                    <td><b><?php echo $data4->program_organizer_group_name; ?></b></td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">ठेगाना :</td>
                                    <td><b><?php echo SITE_NAME.convertedcit($data4->program_organizer_group_address); ?></b></td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">विनियोजन किसिम :</td>
                                    <td><b><?php echo Topicareainvestment::getName($data1->topic_area_investment_id); ?></b></td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">उपभोक्ताबाट जनश्रमदान :</td>
                                    <td><b>रु. <?php echo convertedcit($result->costumer_investment);?>/-</b></td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">कार्यादेश रकम (<?php echo SITE_TYPE;?> बाट छुटाइएको):</td>
                                    <td><b>रु. <?php echo convertedcit($result->agreement_gauplaika);?>/-</b></td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">कन्टेन्जेन्सी
                                    </td>
                                    <td><b>रु. <?php echo convertedcit($result->contingency);?>/-</b></td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">मर्मत
                                        (<?php echo convertedcit($result->marmat_old)?>%)</td>
                                    <td><b>रु. <?php echo convertedcit($result->marmat_new);?>/-</b></td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">अन्य निकायबाट प्राप्त अनुदान रकम :</td>
                                    <td><b>रु. <?php echo convertedcit($data2->other_agreement)  ;?>/-</b></td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft"><?=$name?> नगद साझेदारी रकम:</td>
                                    <td><b>रु. <?php echo convertedcit($data2->agreement_other);?>/-</b> </td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">अन्य साझेदारी रकम :</td>
                                    <td> <b>रु. <?php echo convertedcit($data2->other_agreement);?>/-</b></td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">कुल लागत अनुमान जम्मा रकम :</td>
                                    <td> <b>रु. <?php echo convertedcit($data2->total_investment );?>/-</b> </td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">कार्यदेश रकम :</td>
                                    <td> <b>रु. <?php echo convertedcit($data2->bhuktani_anudan);?>/-</b> </td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">योजना शुरु हुने मिति :</td>
                                    <td><b><?php echo convertedcit($data3->yojana_start_date);?></b></td>
                                </tr>
                                <tr>
                                    <td class="myTextalignLeft">योजना सम्पन्न हुने मिति :</td>
                                    <td><b><?php echo convertedcit($data3->yojana_sakine_date);?></b></td>
                                </tr>
                            </table>
                            <div class="banktextdetails">
                                उपरोक्तानुसार पेश भइ आएकोमा 
                                <input type="hidden" id="data1" name="data1"
                                        value="<?=$newdata1?>">
                                    <span style="border-bottom: 1px solid #6c6b6b;" id="data1_new"
                                        contenteditable="true"><?=$newdata1?></span>
                                र
                                <strong><?=SITE_LOCATION?></strong>को 
                                <input type="hidden" id="data2" name="data2"
                                        value="<?=$newdata2?>">
                                    <span style="border-bottom: 1px solid #6c6b6b;" id="data2_new"
                                        contenteditable="true"><?=$newdata2?></span> 
                                रु. १ करोड सम्मको लागत अनुमान भयको 
                                निर्माण सम्बन्धि कार्य उपभोक्ता समिति वा लाभग्राही  समुदाय संग गराउन सकिने व्यवस्था रहेकोले रु 
                                <strong><?=convertedcit($data2->total_investment)?></strong>
                                लागत अनुमान स्वीकृत गरि श्री 
                                <strong><?=$group_heading->program_organizer_group_name?></strong>
                                संग योजनाको सम्झौता तथा कार्यादेश गर्न निर्णयार्थ पेश गरेको छु ।
                                
                            </div>
                            <div class="myspacer"></div>
                            <div class="bankdetails"><i>"माथि उल्लेखित उपभोक्ता समितिसँग सम्झौताको लागि सिफारिस गर्दछु ।"</i>	</div>
                            <div class="myspacer30"></div>
                            <div class="oursignature mymarginright"> सदर गर्ने <br>
                                <select name="worker1" class="form-control worker" id="worker_1" >
                                    <option value="">छान्नुहोस्</option>
                                    <?php foreach($workers as $worker){?>
                                        <option value="<?=$worker->id?>" <?php if($print_history->worker1 == $worker->id){echo 'selected="selected"';}?>><?=$worker->authority_name?></option>
                                    <?php }?>
                                </select>
                                <input type="text" name="post" class="form-control" id="post_1" value="<?=$worker1->post_name?>">
                            </div>
                            <div class="oursignatureleft mymarginright"> योजना शाखा   <br/>
                                <select name="worker3" class="form-control worker" id="worker_3">
                                    <option value="">छान्नुहोस्</option>
                                    <?php foreach($workers as $worker){?>
                                        <option value="<?=$worker->id?>" <?php if($print_history->worker3 == $worker->id){echo 'selected="selected"';}?>><?=$worker->authority_name?></option>
                                    <?php }?>
                                </select>
                                <input type="text" name="post" class="form-control" id="post_3" value="<?=$worker3->post_name?>">
                            </div>
                            <div class="myspacer"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
    </div>
</div>
</body>
<?php include("menuincludes/footer.php"); ?>
<script>
    JQ(document).ready(function() {
            JQ(document).on("submit", "#form", function(e) {
                JQ("#data1").val(JQ("#data1_new").text());
                JQ("#data2").val(JQ("#data2_new").text());
            });
        });
</script>