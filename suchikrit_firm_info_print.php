<?php require_once("includes/initialize.php");
if(!$session->is_logged_in()){ redirect_to("logout.php");}
// if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
// {
//   redirectUrl();
// }
error_reporting(1);
$ward_address=WardWiseAddress();
$address= getAddress();
$date_selected= $_GET['date_selected'];
$url = get_base_url();
$user = getUser();
$fiscal = Fiscalyear::find_by_id(1);
// print_r($fiscal);
// $print_history = PrintHistory::find_by_url_and_plan_id($url, $_GET['id']);
$cont_id = $_GET['contractor_id'];
// print_r($cont_id);exit;
$result0= Contractinvitationforbid::find_by_sql("select * from contract_invitation_for_bid where contractor_id =".$cont_id);
$parent_bhautik = SettingbhautikPariman::find_all_parents();
$contractor_info = Contractordetails::find_all();
?>
<?php include("menuincludes/header1.php"); ?>
<!-- js ends -->
<title>विषय:- योजना संझौता सम्बन्धमा । print page:: <?php echo SITE_SUBHEADING;?>.</title>
</head>
<body>
    <div class="myPrintFinal" > 
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
                   <div class="printContent">
                       <hr>
                   <?php $sum = 0;?>
                   <?php $party_name= array();foreach($result0 as $key => $r0): //print_r($r0);?>
                    
                        <?php $party_name[] = Contractordetails::getName($r0->contractor_id)?>
                    
             <?php endforeach;?>
             <div class="text-center">
             <strong><u><h3>आ.व :- <?=convertedcit($fiscal->year)?> मा <?php echo $party_name[0]?> बाट सम्झौता भएका योजना विवरण</h3></u></strong>
             </div>
             <div class="myspacer"></div>
             <div style="margin-left:15px;margin-right:15px;">
             <table class="table table-bordered table-responsive striped" border="3px;">
                            <thead>
                            <tr>
                                <th style="text-align: center;">सी.नं</th>   
                                <th style="text-align: center;">योजना द.नं</th>   
                                <th style="text-align: center;">योजनाको नाम</th>   
                                <th style="text-align: center;">ठेक्का नं</th>
                                <th style="text-align: center;">ठेक्का रकम</th>
                                <th style="text-align: center;">पी.एस. रकम</th>
                                <th style="text-align: center;">कुल ठेक्का रकम</th>
                                <th style="text-align: center;">ठेक्का प्रकाशित मिति</th>
                                <!-- <th style="text-align: center;">ठेकेदारको ठेगाना</th> -->
                                <!-- <th style="text-align: center;">सम्पर्क नं</th>  -->
                                <th style="text-align: center;">बोलपत्र बिक्रि मिति</th>
                                <th style="text-align: center;">बिनोयोजित बजेट</th>
                            </tr>
                            </thead>
                            <?php $a=1; foreach($result0 as $result0):?>
                            <?php $result1 = Contractinfo::find_by_sql("select * from contract_info where plan_id=".$result0->plan_id);?>
                            <?php foreach($result1 as $r1):?>
                            <tbody>     
                            <tr>
                                <td><?=convertedcit($a);?></td>
                                <td><?php echo convertedcit($result0->plan_id);?></td>
                                <td><?php $name = Plandetails1::find_by_id($result0->plan_id); echo $name->program_name;?></td>
                                <td><?php echo $r1->thekka_id;?></td>
                                <td><?=convertedcit($r1->amount)?>/-</td>
                                <td><?=convertedcit($r1->ps)?>/-</td>
                                <td><?=convertedcit($r1->contract_amount)?>/-</td>
                                <td><?=convertedcit($r1->created_date)?></td>
                                <!-- <td><?=$result0->contractor_address?></td>
                                <td><?=convertedcit($result0->contractor_contact)?></td> -->
                                <td><?=convertedcit($result0->contract_date)?></td>
                                <td><?=convertedcit($name->investment_amount)?>/-</td>
                            </tr>
                            </tbody>
                            <?php 
                            $sum += $r1->amount;
                            $sum1 += $r1->ps;
                            $sum2 += $r1->contract_amount;
                            $sum4 += $name->investment_amount;
                            ?>
                            <?php endforeach;?>
                            <?php $a++; endforeach; ?>
                            <strong>
                            <tfoot>
                                <tr>
                                    <td colspan="4">जम्मा</td>
                                    <td><?=convertedcit($sum);?></td>
                                    <td><?=convertedcit($sum1);?></td>
                                    <td><?=convertedcit($sum2);?></td>
                                    <td colspan="2"></td>
                                    <td><?=convertedcit($sum4);?></td>
                                </tr>
                            </tfoot>
                            </strong>
                            
                            
             </table>
             </div>
        </div>
        <!--<div class="settingsMenu1"><a href="settings_topic_add_sub.php">सह शिर्षक थप्नुहोस +</a></div>-->
    </div>
</div>
</div>
