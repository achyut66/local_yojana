<?php require_once("includes/initialize.php");
if(!$session->is_logged_in()){ redirect_to("logout.php");}
if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
{
  redirectUrl();
}
$ward_address=WardWiseAddress();
$address= getAddress();
?>
<?php $data1=  Plandetails1::find_by_id($_GET['id']);
$data2= AmanatLagat::find_by_plan_id($_GET['id']);
$data3= Amanat_more_details::find_by_plan_id($_GET['id']);   
$data4= Costumerassociationdetails0::find_by_plan_id($_GET['id']);
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
!empty($invest_details->id)? $value="??????????????? ????????????????????????" : $value="????????? ????????????????????????";
?>
<?php include("menuincludes/header1.php"); ?>
<?php $data=  Plandetails1::find_by_id($_GET['id']); 

?>
<title>????????????:- ?????????????????? ?????????????????? ??????????????????????????? ??? print page:: <?php echo SITE_SUBHEADING;?>.</title>
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
                           <h1 class="margin1em letter_title_one" style="margin-right: 87px;"><?php echo SITE_LOCATION;?></h1>
                           <h4 class="margin1em letter_title_two"><?php echo $address;?></h4>
                           <h5 class="margin1em letter_title_three"><?php echo SITE_FIRST_NAME?>, <?php echo SITE_ZONE?></h5>
                           <h5 class="margin1em letter_title_four"><?php echo SITE_SECONDSUBHEADING?></h5>
               <div class="myspacer"></div>
               <div class="subjectbold letter_subject style="margin-left:2px"></div>
               <div class="myspacer"></div>
               <div class="printContent">
                  <div class="mydate">???????????? : <?php echo convertedcit($date_selected); ?></div>
                  <div class="chalanino">??????????????? ??????????????? ?????? : <?php echo convertedcit($_GET['id'])?></div>
                  <div class="myspacer20"></div>
                  <div class="subject">   <u>????????????:- ?????????????????? ?????????????????? ??????????????????????????? ???</u></div>
                  <div class="myspacer"></div>
                  <div class="bankname">???????????????????????? </div>
                  <div class="myspacer"></div>
                  <div class="banktextdetails">
                              ???????????????????????? ?????????????????? <strong><?php echo SITE_LOCATION;?></strong> ????????? ??????. <strong><?php echo convertedcit($data1->ward_no)?></strong> ??????????????? <strong><?php echo $data1->program_name;?></strong> ??????????????? ????????????????????? ???????????? ???????????? ?????????????????? ???????????? ??????????????? ??????.<strong><?php echo convertedcit($data2->total_investment);?></strong> ?????????????????? ???????????? <strong><?php echo convertedcit($data3->yojana_samjhauta_date)?></strong> ??????????????? ???????????????????????????????????? ?????? ??????????????? ???????????? <strong><?php echo SITE_LOCATION;?></strong>?????? ????????????????????? ??????. <strong><?php echo convertedcit($data2->agreement_gauplaika)?></strong> ??????????????????????????? ????????? ??????????????? ??????????????? ????????? ??? ?????????????????????????????? ???????????? <strong><?php echo convertedcit($data3->yojana_sakine_date)?></strong> ?????????????????? ???????????????????????????????????? ????????? ???????????????, ??????????????????????????? ?????????????????????, ????????? ?????????????????????????????? ??????????????? ????????????????????? ????????????????????? ??? ???????????? ???????????? ?????????????????? ???????????? ????????? ??????????????? ????????? ???????????? ?????????????????? ???????????? ????????? ??? ????????? ????????????????????? ???????????? ????????????????????? ?????? ?????????????????? ?????????????????? ??? ???
                              </div>
                            <div class="myspacer20"></div>
                            <div>
                                ??????????????? ????????????????????? ?????????????????????????????? ???????????? : <strong><?php echo convertedcit($data3->yojana_sakine_date);?></strong>
                              </div>
                           <div class="myspacer30"></div>
                           <div class="oursignature mymarginright" style="margin-right:35px" > ????????? ??????????????? <br>
                              <?php 
                              if(!empty($worker1))
                              {
                                  echo $worker1->authority_name."<br/>";
                                  echo $worker1->post_name;
                              }
                              ?>
                          </div>
                           <div>
                            <div class="myspacer20"></div>
                          <strong>
                            <u>????????????????????????</u>
                          </strong>
                          <p>???). ???????????? ?????????????????? ????????????????????? ????????????, 
                                <strong><?php echo SITE_LOCATION;?></strong>??? <span>(????????????????????? ????????? ?????????????????????????????? ????????????)</span>
                          </p>
                          <p>???) ???????????? <strong><?php echo convertedcit($data1->ward_no)?></strong> ??????. ????????? ????????????????????????, 
                                <strong><?php echo SITE_LOCATION;?></strong>??? <span>(??????????????????????????? ????????????) </span>
                          </p>
                          <p>???).
                            <label>
                              <?php 
                              if(!empty($worker2))
                              {
                                  echo $worker2->authority_name;
                              }
                              ?>
                          </label>
                            (<strong><?php echo $worker2->post_name;?></strong>) <span>(?????????????????? ???????????????????????? ?????????????????????)</span>
                          </p>
                          <p>???).
                            <label>
                              <?php 
                              if(!empty($worker3))
                              {
                                  echo $worker3->authority_name;                                  
                              }
                              ?>
                          </label>
                            (<strong><?php echo $worker3->post_name;?></strong>) <span>(?????????????????? ???????????????????????? ?????????????????????)</span>
                          </p>
                        </div>
</div>
</div>
</div>
