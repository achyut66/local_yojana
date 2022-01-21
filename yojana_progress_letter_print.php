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
<?php 
$data1=  Plandetails1::find_by_id($_GET['id']);
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
$group_heading = Costumerassociationdetails0::find_by_plan_id($_GET['id']);
$bhautik = Bhautik_lakshya::find_by_sql("select * from bhautik_lakshya where type=1 and plan_id=".$_GET['id']);
$bhautik_antim = Bhautik_lakshya::find_by_sql("select * from bhautik_lakshya where type=3 and plan_id=".$_GET['id']);
$profitable = Profitablefamilydetails::find_by_plan_id($_GET['id']);

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
                   <div class="subjectboldright letter_subject">टिप्पणी आदेश</div><div class="myspacer"></div>
                   <div class="printContent">
                      <div class="mydate">मिति : <?php echo convertedcit($date_selected); ?></div>
                      <div class="patrano">आ.व. : <?php echo convertedcit($fiscal->year); ?></div>
                      <div class="chalanino">योजना दर्ता नं : <?php echo convertedcit($_GET['id'])?></div>
                      <div class="myspacer"></div>
                      <div class="subject">
                          <u>विषय:-
                              <?php if(!empty($_GET['subject'])){
                              echo $_GET['subject'];
                              }else{
                              echo "योजना संझौता सम्बन्धमा ।";
                              }?>
                          </u>
                      </div>
                      <div class="myspacer"></div>
                      <div class="bankname" style="margin-top: 15px;">श्रीमान , </div>
                      <div class="printContent">
                            <div class="mydate">
                                <?=$date?></div>
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
                                <table class="table-bordered">
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
                            <div class="myspacer"></div>
                        </div>         
               <div class="oursignature mymarginright"> सदर गर्ने <br>
                <?php 
                if(!empty($worker1))
                {
                    echo $worker1->authority_name."<br/>";
                    echo $worker1->post_name;
                }
                ?>
            </div>
        </div>
    </div>
</div>
</div>
