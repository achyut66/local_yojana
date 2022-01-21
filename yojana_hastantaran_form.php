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
// print_r($data1);
$result = Plantotalinvestment::find_by_plan_id($_GET['id']);
if(!empty($result))
{
    $data2=  Plantotalinvestment::find_by_plan_id($_GET['id']);
    // print_r($data2);
    $data3= Moreplandetails::find_by_plan_id($_GET['id']);
    // print_r($data3);
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
// echo $percent_final;exit;
$link = get_return_url($_GET['id']);
?>
<?php
$data4= Costumerassociationdetails0::find_by_plan_id($_GET['id']);
// print_r($data4);
$fiscal = FiscalYear::find_by_id($data1->fiscal_id);
$group_heading = Costumerassociationdetails::find_by_plan_id($_GET['id']);
// print_r($group_heading);
// 	$data7=Plantotalinvestment::find_by_plan_id($data->id);
// 	print_r($data7);
?>
<?php include("menuincludes/header.php"); ?>
    <!-- js ends -->
    <title>विषय:- योजना हस्तान्तरण सम्झौता। print page:: <?php echo SITE_SUBHEADING;?></title>
    <style>
        table {

            width: 100%;
            border: none;
        }
        
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


    <div class="maincontent" id="div_new">
    <form method="get" action="yojana_hastantaran_form_print.php?>">
    <h2 class="headinguserprofile">विषय:- योजना हस्तान्तरण सम्झौता टिप्पणी ।
        <a href="<?=$link?>" class="btn">पछि जानुहोस </a>
        <div class="myPrint"><input type="hidden" name="id" value="<?=$_GET['id']?>" /><input type="submit" value="प्रिन्ट" name="submit" /></div>
    </h2>

    <div class="OurContentFull" >

        <!--<div class="myPrint"><input type="hidden" name="id" value="<?=$_GET['id']?>" /><input type="submit" value="प्रिन्ट गर्नुहोस" name="submit" /></div>-->
        <div class="userprofiletable" id="div_print">
            <div class="printPage">
                <div class="image-wrapper">
                    <a href="#" ><img src="images/janani.png" align="left" class="scale-image"/></a>
                    <div />

                    <div class="image-wrapper">
                        <a href="#" target="_blank" ><img src="images/bhaire.png" align="right" class="scale-image"/></a>
                        <div />
                        <h1 class="marginright1.5 letter-title-one"><?php echo SITE_LOCATION;?></h1>
                        <h5 class="marginright1.5 letter-title-two"><?php echo $address;?></h5>

                        <h5 class="marginright1.5 letter-title-four"><?php echo $ward_address;?></h5>
                        <h5 class="marginright1.5 letter-title-three"><?php echo SITE_SECONDSUBHEADING;?></h5>

                        <div class="myspacer"></div>
                        <div class="printContent">
                            <div class="mydate"><input type="text" name="date_selected" value="<?php echo $date;?>" id="nepaliDate5" /></div>
                            <div class="myspacer20"></div>
                            <div class="subject" border="none">
                                <div class="text-center"><u><?php echo SITE_LOCATION?> र उपभोक्ता समितिविच भाएको योजना हस्तान्तरण सम्झौता</u></div>
                            </div>
                            <div class="myspacer20"></div>
                            <div class="text-left" style="margin-left: 200px;">
                                <p>१.) योजनाको नाम / दर्ता नं :- <strong><?php echo $data1->program_name.' '.':-:'.' '.convertedcit($data1->id)?></strong></p>
                                <p>२.) योजना रहेको स्थान :- <strong><?=$data4->address_new?></strong></p>
                                <p>३.) लागत अनुमान :- <strong><?=convertedcit($result->total_investment)?>/-</strong></p>
                                <p>४.) खुद लागत :- <strong><?=convertedcit($result->total_investment)?>/-</strong></p>
                                <p>५.) योजना सम्पन्न मिति :- <strong><?=convertedcit($data3->yojana_sakine_date)?></strong></p>
                                <p>६.) जांचपास मिति :- <strong><input type="date" name="pass_date" /></strong></p>
                                <p>७.) हस्तान्तरणका सर्तहरु :- </p>
                            </div>
                            <hr><hr>
                            <div class="text-left">
                                <p>क). <?php echo SITE_TYPE?> समेतको श्रोतबाट निर्मित योजनाको संरक्षण उपभोक्ता समिति / उपभोक्ता स्वयमले गर्नुपर्ने छ ।</p>
                                <p>ख). स्तरोन्नतीको काम बाहेक मर्मत संहारकोलागि <?php echo SITE_DESC.'बाट';?> श्रोत लगानी गरिने छैन । </p>
                                <p>ग). उपभोक्ताबाट पूर्ण संरक्षण, नियमित र्मतसंहार गरिएको योजनाहरुमात्र आगामी आ.ब. हरुमा योजना स्तरोन्नतीकोलागि <?php echo SITE_DESC.'ले';?> प्राथमिकता दिने छ ।</p>
                                <p>घ). नयाँ ट्रयाक खोलिएको सडकको हकमा सडकको भित्ता तर्फ नाली निर्माणगरि सडकको संरक्षण, खाल्टा खुल्टी पुर्ने जस्ता मर्मत संभारका कार्य उपभोक्ताले गर्नुपर्ने छ, नगरेमा उक्त नयाँ सडकको पुन निर्माण र भविश्यमा स्तरोन्नती <?php echo SITE_DESC.'बाट'?> गरिने छैन । </p>
                                <p>ङ). सिचाइ कुलोको हकमा उक्त कूलोबाट सिंचित खेतधनी मात्र उपभोक्ता मानिने छ । </p>
                                <p>च). खाने पानीे वितरण लाइनको मर्मत संभार गा.पा. श्रोतबाट हुने छैन, उपभोक्ता स्वयंले गर्नु पर्ने छ ।</p>
                                <p>छ). खानेपानी पूर्ण ब्यवस्थित भइ धारा वितरण पश्चात दर्तावाल उ.स.द्वारा सशुल्क वितरण गर्ने र उठेको शुल्कबाट एक कोष खडागरी नियमित मर्मत संभारको ब्यावस्था समन्धित उ.स.ले उक्त कोषबाट गर्नु पर्ने छ ।</p>
                            </div>
                            <hr><hr>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="text-left"><u><strong><?php echo SITE_TYPE.'को';?> तर्फबाट :-</strong></u></div>
                                        <p>वडाध्यक्ष :- 
                                            <label>
                                            <div class="text-left" style="margin-top:-4%;"><br/>
                                                <select name="worker3" class="form-control worker" id="worker_3">
                                                    <option value="">छान्नुहोस्</option>
                                                    <?php foreach($workers as $worker){?>
                                                        <option value="<?=$worker->id?>" <?php if($print_history->worker3 == $worker->id){echo 'selected="selected"';}?>><?=$worker->authority_name?></option>
                                                    <?php }?>
                                                </select>
                                                <input type="text" name="post" class="form-control" id="post_3" value="<?=$worker3->post_name?>">
                                            </div>
                                            </label>
                                        </p>
                                        <p>वडा नं :- <?php echo convertedcit($data1->ward_no);?></p>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="text-left"><u><strong>उपभोक्ताको तर्फबाट :-</strong></u></div>
                                        <div class="myspacer"></div>
                                        <table style="border: none;">
                                        <?php $i=1;foreach($group_heading as $gh):?>
                                        <tr>
                                            <td style="width: 5px;"><?=$i;?></td>
                                            <td style="width: 15px;"><?=$gh->name;?></td>
                                        </tr>
                                        <?php $i++;endforeach;?>
                                        </table>
                                    </div>
                                </div>
                            </div>
                </div>
            </div>
        </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>