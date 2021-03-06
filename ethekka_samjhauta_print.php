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
$data1=  Plandetails1::find_by_id($_GET['id']);
$fiscal = FiscalYear::find_by_id($data1->fiscal_id);
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
$print_history->worker4 = $_GET['worker4'];
$print_history->worker5 = $_GET['worker5'];
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
if(!empty($_GET['worker3']))
{
    $worker3 = Workerdetails::find_by_id($_GET['worker3']);
}
else
{
    $worker3 = Workerdetails::setEmptyObject();
}
if(!empty($_GET['worker4']))
{
    $worker4 = Workerdetails::find_by_id($_GET['worker4']);
}
else
{
    $worker4 = Workerdetails::setEmptyObject();
}
if(!empty($_GET['worker5']))
{
    $worker5 = Workerdetails::find_by_id($_GET['worker5']);
}
else
{
    $worker5 = Workerdetails::setEmptyObject();
}
?>
<?php $invest_details =  Plantotalinvestment::find_by_plan_id($_GET['id']);
if(empty($invest_details))
{
    $invest_details = Plantotalinvestment::setEmptyObjects();
}
!empty($invest_details->id)? $value="अपडेट गर्नुहोस" : $value="सेभ गर्नुहोस";
?>
<?php include("menuincludes/header1.php"); ?>
<?php
$data1 =  Plandetails1::find_by_id($_GET['id']);
$thekka_lagat = Ethekka_lagat::find_by_plan_id($_GET['id']);
$ethekka_info = Ethekkainfo::find_by_plan_id($_GET['id']);
?>
<title>विषय:- सम्झौता गर्न आउने सम्बन्धमा । print page:: <?php echo SITE_SUBHEADING;?>.</title>
<style>
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
            <div class="printlogo"><img src="images/emblem_nepal.png" alt="Logo"></div>
            <h1 class="margin1em letter_title_one" style="margin-right: 85px;"><?php echo SITE_LOCATION;?></h1>
            <h4 class="margin1em letter_title_two"><?php echo $address;?></h4>
            <h5 class="margin1em letter_title_three"><?php echo SITE_FIRST_NAME?>, <?php echo SITE_ZONE?></h5>
            <h5 class="margin1em letter_title_four"><?php echo SITE_SECONDSUBHEADING?></h5>
            <div class="myspacer"></div>
                <div class="myspacer"></div>
                <div class="printContent">
            <div class="mydate">मिति : <?php echo convertedcit($date_selected); ?></div>
            <div class="chalanino">योजना दर्ता नं : <?php echo convertedcit($_GET['id'])?></div>
                    <div class="chalanino">चलानी नं :</div>
            <div class="myspacer20"></div>
            <div class="subject">   <u>बिषय:- सम्झौता गर्न आउने सम्बन्धमा ।</u></div>
                    <div class="bankname">श्री, <strong><?php echo $ethekka_info->firm_name?></strong></div>
                    <div class="bankname"><strong><?php echo $ethekka_info->firm_address.','?></strong></div>
            <div class="myspacer"></div>
            <div class="banktextdetails">
                यस <strong><?php echo SITE_LOCATION.' '.SITE_HEADING.' '.SITE_ADDRESS;?></strong>को
                <strong><?php echo $data1->program_name.','.' '.$ethekka_info->thekka_no;?></strong> खरिद कार्यका लागि मिति
                <strong><?php echo convertedcit($ethekka_info->bolpatra_miti)?></strong> गतेको
                <strong><?php echo $ethekka_info->bolpatra_m?></strong>मा प्रकाशित बोलपत्र आह्यान सम्बन्धी सूचना अनुसार दर्ता हुन आएका सिलबन्दी बोलपत्रहरु मध्ये
                न्युनतम कबोल रकम (भ्याट र पि.एस. सहित) रु. <strong><?php echo convertedcit($ethekka_info->kabol_rakam)?></strong>
                राखी ठेक्‍का सकार गर्ने तपाई श्री <strong><?php echo $ethekka_info->firm_name.','.' '.$ethekka_info->firm_address?></strong>
                को बोलपत्र न्युनतम मुल्यांकित तथा सारभुतरूपमा प्रभावग्रही भई सार्वजनिक खरिद ऐन, २०६३ दफा २७ बमोजिम स्वीकृत भएको
                हुँदा सोही ऐन बमोजिम रु. <strong><?php echo convertedcit($thekka_lagat->agreement_gaupalika)?></strong> यस कार्यालयको
                धरौटी खाता नं. <strong><?php echo $ethekka_info->dharauti_no?></strong> मा नगद दाखिला गरेको बैंक भौचर वा तेह्र महिनाको कार्यसम्पादन जमानत सहित १५ (पन्ध्र)
                दिन भित्र यस कार्यालयमा सम्झौता गर्न आउनुहुन अनुरोध छ ।
            </div>
            <div class="myspacer30"></div>
            <div class="oursignature mymarginright" style="margin-left:20px">सदर गर्ने<br/>
                <?php
                if(!empty($worker2))
                {
                    echo $worker2->authority_name."<br/>";
                    echo $worker2->post_name;
                }
                ?>
            </div>
        </div>
    </div>
</div>
