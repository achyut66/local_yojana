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
// print_r($result);
if(!empty($result))
{
    $data2=  Plantotalinvestment::find_by_plan_id($_GET['id']);
    //print_r($data2);
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
$fiscal = FiscalYear::find_by_id($data1->fiscal_id);
$group_heading = Costumerassociationdetails0::find_by_plan_id($_GET['id']);
$antim_bhuktani = Planamountwithdrawdetails::find_by_plan_id($_GET['id']);
$bhautik = Bhautik_lakshya::find_by_sql("select * from bhautik_lakshya where type=1 and plan_id=".$_GET['id']);
$bhautik_antim = Bhautik_lakshya::find_by_sql("select * from bhautik_lakshya where type=3 and plan_id=".$_GET['id']);
$profitable = Profitablefamilydetails::find_by_plan_id($_GET['id']);

// echo "<pre>";
// print_r($profitable);
?>
<?php include("menuincludes/header.php"); ?>
    <!-- js ends -->
    <title>विषय:- योजना संझौता सम्बन्धमा । print page:: <?php echo SITE_SUBHEADING;?></title>
    <style>
        table {

            width: 100%;
            border: none;
        }
        #div_new{
            background-image: url("images/nepali_paper.jpg");
        }
        input {
            background-color: #eee;
        }
        tr:nth-child(even) {background-color: #f2f2f2;}
        tr:hover {background-color:#f5f5f5;}
    </style>
    </head>
    <body>
<?php include("menuincludes/topwrap.php"); ?>
<div id="body_wrap_inner">
    <div class="maincontent" id="div_new">
    <form method="get" action="yojana_progress_letter_print.php?>">
    <h2 class="headinguserprofile">विषय:- योजना सम्झौता गर्ने सम्बन्धमा  ।
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
                        <h5 class="marginright1.5 letter-title-nine"><strong>(योजना फाँटको लागि)</strong></h5>

                        <div class="myspacer"></div>
                        <div class="printContent">
                            <div class="mydate">
                                <input type="text" name="date_selected" value="<?php echo $date;?>" id="nepaliDate5" /></div>
                            <div class="patrano">आ.व. : <?php echo convertedcit($fiscal->year); ?></div>
                            <div class="chalanino">योजना दर्ता नं : <?php echo convertedcit($_GET['id'])?></div>
                            <div class="myspacer20"></div>
                            <div class="text-left">
                                <p>जिल्ला :- <strong><?=SITE_DISTRICT?></strong></p>
                                <p>योजनाको नाम :- <strong><?=$data1->program_name;?></strong></p>
                                <p>गाउँपालिकाको नाम :- <strong><?=SITE_LOCATION;?></strong></p>
                                <p>वार्ड नं :- <strong><?=convertedcit($data1->ward_no);?></strong></p>
                                <p>वस्ती / टोल :- <strong><?=$group_heading->address_new?></strong></p>
                                <p>योजनाको कुल लागत (रु) :- <strong><?=convertedcit($result->total_investment)?>/-</strong></p>
                                <p>कार्य सम्पन्न प्रतिवेदन अनुसारको रकम :- <strong><?php 
                                if(!empty($antim_bhuktani)){
                                    echo convertedcit($antim_bhuktani->final_total_paid_amount);
                                }else{
                                    echo "कार्य सम्पादन भएको छैन !!";
                                }
                                ?></strong></p>
                            </div>
                            <hr>
                            <div class="text-left">
                                <strong><u>सहभागिताको योगदान :</u></strong>
                            </div>
                            <div class="text-left">
                                <span><strong>प्रदेश :-</strong></span>
                                <span><strong><?=SITE_DESC?> :- <?=convertedcit($data1->investment_amount)?>/-</strong></span>
                                <span><strong>उपभोक्ता :- <?=convertedcit($result->costumer_investment)?>/-</strong></span>
                            </div>
                            <hr>
                            <div class="text-left">
                                <p>सम्झौता भएको मिति :- <strong><?=convertedcit($data3->miti)?></strong></p>
                                <p>कार्य सम्पन्न भएको मिति :- <strong><?php
                                if(!empty($antim_bhuktani)){
                                    echo convertedcit($antim_bhuktani->plan_end_date);
                                }else{
                                    echo convertedcit($data3->yojana_sakine_date)." - "."कार्य सम्पन्न नभएकोले सम्पन्न गर्नु पर्ने मिति देखाइएको !!";
                                }
                                ?></strong></p>
                                <p>भौतिक लक्ष्य :-</p>
                                <table class="table table-bordered table-responsive">
                                    <thead>
                                        <th>सी .नं</th>
                                        <th>परिमाणको मुख्य शिर्षक</th>
                                        <th>परिमाणको शिर्षक</th>
                                        <th>परिमाण</th>
                                        <th>भौतिक इकाई</th>
                                    </thead>
                                    <?php $i=1; foreach ($bhautik as $bh):?>
                                    <tbody>
                                        <tr>
                                            <td><?=convertedcit($i);?></td>
                                            <td><?php echo SettingbhautikPariman::getName($bh->parent_id);?></td>
                                            <td><?php echo SettingbhautikPariman::getName($bh->details_id);?></td>
                                            <td><?=$bh->qty;?></td>
                                            <td><?php echo Units::getName($bh->unit_id);?></td>
                                        </tr>
                                    </tbody>
                                    <?php $i++; endforeach;?>
                                </table>
                                <p>भौतिक प्रगति :-</p>
                                <?php if(empty($antim_bhuktani)){?>
                                <h1>कार्य सम्पन्न नभएको !!!!!</h1>
                                <?php }else{ ?>
                                <table class="table table-bordered table-responsive">
                                    <thead>
                                        <th>सी .नं</th>
                                        <th>परिमाणको मुख्य शिर्षक</th>
                                        <th>परिमाणको शिर्षक</th>
                                        <th>परिमाण</th>
                                        <th>भौतिक इकाई</th>
                                    </thead>
                                    <?php $i=1; foreach ($bhautik_antim as $bh):?>
                                    <tbody>
                                        <tr>
                                            <td><?=convertedcit($i);?></td>
                                            <td><?php echo SettingbhautikPariman::getName($bh->parent_id);?></td>
                                            <td><?php echo SettingbhautikPariman::getName($bh->details_id);?></td>
                                            <td><?=$bh->qty;?></td>
                                            <td><?php echo Units::getName($bh->unit_id);?></td>
                                        </tr>
                                    </tbody>
                                    <?php $i++; endforeach;?>
                                </table>
                                <?php }?>
                                <p>लाभान्वित जनसंख्या :-</p>
                                    <span>१). दालित :-     <strong><?=convertedcit($profitable->dalit_mahila+$profitable->dalit_purush);?></strong></span>
                                    <span>२). आदिबासी / जनजाति :-     <strong><?=convertedcit($profitable->aadhibasi_mahila+$profitable->aadhibasi_purush)?></strong></span>
                                    <span>३). अन्य :-      <strong><?=convertedcit($profitable->anya_mahila+$profitable->anya_purush)?></strong></span><br>
                                <p>लाभान्वित घरधुरी :-</p>
                                    <span>१). दालित :-</span>
                                    <span>२). आदिबासी / जनजाति :-</span>
                                    <span>३). अन्य :-</span>
                            </div>
                            <div class="oursignature mymargincenter">तयार गर्ने <br>
                            प्राबिधिक कर्मचारीको नाम <br>
                                <select name="worker1" class="form-control worker" id="worker_1" >
                                    <option value="">छान्नुहोस्</option>
                                    <?php foreach($workers as $worker){?>
                                        <option value="<?=$worker->id?>" <?php if($print_history->worker1 == $worker->id){echo 'selected="selected"';}?>><?=$worker->authority_name?></option>
                                    <?php }?>
                                </select>
                                <input type="text" name="post" class="form-control" id="post_1" value="<?=$worker1->post_name?>">
                            </div>
                            <div class="myspacer"></div>
                        </div>                    
                    </div>
                </div>
            </div>
        </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>