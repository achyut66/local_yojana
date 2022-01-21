<?php require_once("includes/initialize.php");
if(!$session->is_logged_in()){ redirect_to("logout.php");}
if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
{
  redirectUrl();
}
error_reporting(1);
$ward_address=WardWiseAddress();
$address= getAddress();

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
$data4= Costumerassociationdetails0::find_by_plan_id($_GET['id']);
$fiscal = FiscalYear::find_by_id($data1->fiscal_id); 
$group_heading = Costumerassociationdetails::find_by_plan_id($_GET['id']);
?>
<?php include("menuincludes/header1.php"); ?>
<!-- js ends -->
<title>विषय:- योजना संझौता सम्बन्धमा । print page:: <?php echo SITE_SUBHEADING;?>.</title>
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
               
                   <!-- <div class="myspacer"></div> -->
                   <!-- <div class="subjectboldright letter_subject">टिप्पणी आदेश</div><div class="myspacer"></div> -->
                   <div class="printContent">
                      <div class="mydate">मिति : <?php echo convertedcit($date_selected); ?></div>
                      <!-- <div class="patrano">आ.व. : <?php echo convertedcit($fiscal->year); ?></div>
                      <div class="chalanino">योजना दर्ता नं : <?php echo convertedcit($_GET['id'])?></div>
                      <div class="myspacer"></div> -->
                      <!-- <div class="myspacer"></div> -->
                      <!-- <div class="bankname" style="margin-top: 15px;">श्रीमान , </div> -->

                        <div class="subject" border="none" style="margin-top:30px;">
                                <div class="text-center"><u><?php echo SITE_LOCATION?> र उपभोक्ता समितिविच भाएको योजना हस्तान्तरण सम्झौता</u></div>
                        </div>
                        <hr>
                        <div class="myspacer20"></div>
                            <div class="text-left">
                                <p>१.) योजनाको नाम / दर्ता नं :- <strong><?php echo $data1->program_name.' '.':-:'.' '.convertedcit($data1->id)?></strong></p>
                                <p>२.) योजना रहेको स्थान :- <strong><?=$data4->address_new?></strong></p>
                                <p>३.) लागत अनुमान :- <strong><?=convertedcit($result->total_investment)?>/-</strong></p>
                                <p>४.) खुद लागत :- <strong><?=convertedcit($result->total_investment)?>/-</strong></p>
                                <p>५.) योजना सम्पन्न मिति :- <strong><?=convertedcit($data3->yojana_sakine_date)?></strong></p>
                                <p>६.) जांचपास मिति :- <strong><?=convertedcit(dateEngToNep($_GET['pass_date']))?></strong></p>
                                <p>७.) हस्तान्तरणका सर्तहरु :- </p>
                            </div>
                            <hr>
                            <div class="text-left">
                                <p>क). <?php echo SITE_TYPE?> समेतको श्रोतबाट निर्मित योजनाको संरक्षण उपभोक्ता समिति / उपभोक्ता स्वयमले गर्नुपर्ने छ ।</p>
                                <p>ख). स्तरोन्नतीको काम बाहेक मर्मत संहारकोलागि <?php echo SITE_DESC.'बाट';?> श्रोत लगानी गरिने छैन । </p>
                                <p>ग). उपभोक्ताबाट पूर्ण संरक्षण, नियमित र्मतसंहार गरिएको योजनाहरुमात्र आगामी आ.ब. हरुमा योजना स्तरोन्नतीकोलागि <?php echo SITE_DESC.'ले';?> प्राथमिकता दिने छ ।</p>
                                <p>घ). नयाँ ट्रयाक खोलिएको सडकको हकमा सडकको भित्ता तर्फ नाली निर्माणगरि सडकको संरक्षण, खाल्टा खुल्टी पुर्ने जस्ता मर्मत संभारका कार्य उपभोक्ताले गर्नुपर्ने छ, नगरेमा उक्त नयाँ सडकको पुन निर्माण र भविश्यमा स्तरोन्नती <?php echo SITE_DESC.'बाट'?> गरिने छैन । </p>
                                <p>ङ). सिचाइ कुलोको हकमा उक्त कूलोबाट सिंचित खेतधनी मात्र उपभोक्ता मानिने छ । </p>
                                <p>च). खाने पानीे वितरण लाइनको मर्मत संभार गा.पा. श्रोतबाट हुने छैन, उपभोक्ता स्वयंले गर्नु पर्ने छ ।</p>
                                <p>छ). खानेपानी पूर्ण ब्यवस्थित भइ धारा वितरण पश्चात दर्तावाल उ.स.द्वारा सशुल्क वितरण गर्ने र उठेको शुल्कबाट एक कोष खडागरी नियमित मर्मत संभारको ब्यावस्था समन्धित उ.स.ले उक्त कोषबाट गर्नु पर्ने छ ।</p>
                            </div>
                            <hr>
                            <div class="col-md-12">
                                <!-- <div class="row"> -->
                                    <!-- <div class="col-md-6"> -->
                                        <div class="text-left"><u><strong><?php echo SITE_TYPE.'को';?> तर्फबाट :-</strong></u></div>
                                        <br>
                                        <?php 
                                            if(!empty($worker3))
                                            {
                                                echo $worker3->authority_name."<br/>";
                                                echo $worker3->post_name;
                                            }
                                        ?>
                                        <br>वडा नं :- <?php echo convertedcit($data1->ward_no);?>
                                    <!-- </div> -->
                                    <!-- <div class="col-md-6"> -->
                                        <hr>
                                        <div class="text-left"><u><strong>उपभोक्ताको तर्फबाट :-</strong></u></div>
                                        <br>
                                        <label>
                                        <table class="table-bordered">
                                        <?php $i=1;foreach($group_heading as $gh):?>
                                        <tr>
                                            <td><?=$i;?></td>
                                            <td><?=$gh->name;?></td>
                                            <td style="width: 60%;"></td>
                                        </tr>
                                        <?php $i++;endforeach;?>
                                        </table>
                                        </label>
                                    <!-- </div> -->
                                <!-- </div> -->
                            </div>
        <!--<div class="settingsMenu1"><a href="settings_topic_add_sub.php">सह शिर्षक थप्नुहोस +</a></div>-->
    </div>
</div>
</div>
