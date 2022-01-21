<?php require_once("includes/initialize.php");
if(!$session->is_logged_in()){ redirect_to("logout.php");}
  if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
{
  redirectUrl();
}?>
<?php include("menuincludes/header.php"); ?>
<?php
$data1=  Plandetails1::find_by_id($_GET['id']);
$fiscal = FiscalYear::find_by_id($data1->fiscal_id); 
$data2=  Costumerassociationdetails0::find_by_plan_id($_GET['id']);
$data3=  Moreplandetails::find_by_plan_id($_GET['id']);
$data4_1=Plantimeadditionaffiliation::maxPeriodForPlan($_GET['id']);
$link = get_return_url($_GET['id']);
$workers = Workerdetails::find_all();
$url = get_base_url(1);
$print_history = PrintHistory::find_by_url_and_plan_id($url, $_GET['id']);
$ward_address=WardWiseAddress();
$address= getAddress();

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
if(isset($_POST['submit']))
{
    $max_id=$_POST['max_id'];
    $data4=Plantimeadditionaffiliation::find_by_max($max_id,$_GET['id']);
    
}

?>
<!-- js ends -->
<title>विषय:- म्याद थप सम्बन्धमा । print page:: <?php echo SITE_SUBHEADING;?></title>

</head>

<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
    	
                <div class="maincontent">
                    <form method="get" action="ethekka_myadthap_tippani_print.php?id=<?=$_GET['id']?>">
                    <h2 class="headinguserprofile">म्याद थप सम्बन्धमा । <a href="<?=$link?>" class="btn">पछि जानुहोस</a>
                    <div class="myPrint"><input type="hidden" name="id" value="<?=$_GET['id']?>" />
                        <div class="myPrint"><input type="hidden" name="max_id" value="<?=$max_id?>" />
                        <input type="submit" value="प्रिन्ट गर्नुहोस" name="submit" /></div>
                    </h2>
                    
                    <div class="OurContentFull">                    	
						<div class="bankReport">
                        <form method="post">
                        	<div class="inputWrap">
                        		<h1>पत्र छान्नुहोस् </h1>
                        		<div class="newInput">
                                <select name="max_id">
                            <option value="">छान्नुहोस्</option>
                            <?php for($i=1;$i<=$data4_1;$i++):
                                if($i==1)
 {
        $period="पहिलो";
    }
    if($i==2)
    {
        $period="दोस्रो";
    }
    if($i==3)
    {
        $period="तेस्रो";
    }
     if($i==4)
    {
        $period="चौथो";
    }
     if($i==5)
    {
        $period="पाचौ";
    }
     if($i==6)
    {
        $period="छैठो";
    }
	
                            
?>
                            <option value="<?php echo $i;?>"><?php echo $period;?></option>
                            <?php endfor;?>
                        </select>
                        </div>
                        <div class="saveBtn myWidth100">
                        	<input type="submit" name="submit" class="btn"  value="खोज्नुहोस"/>
                        </div>
                        </form>
                    </div>
                    <?php if(isset($_POST['submit'])):?>
                    
                        
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
									
									<h5 class="marginright1.5 letter-title-four"><?php echo $ward_address;?></h5>
									<h5 class="marginright1.5 letter-title-three"><?php echo SITE_SECONDSUBHEADING;?></h5>
									<div class="myspacer"></div>
									<div class="subject letter_subject">टिप्पणी आदेश</div>
									<div class="printContent">
										<div class="mydate">मिति : <input type="text" name="date_selected" value="<?php echo generateCurrDate();?>" id="nepaliDate5" /></div>
										<div class="patrano">पत्र संख्या :<?php echo convertedcit($fiscal->year);?> </div>
                                                                                <div class="chalanino">योजना दर्ता नं : <?php echo convertedcit($_GET['id'])?></div>
                                                                                <div class="chalanino"> चलानी नं . : </div>
										
										<div class="subject">विषय:- म्याद थप सम्बन्धमा ।</div>
										<div class="bankname">श्रीमान् </div>
										<?php if($data4->period==1)
 {
        $period="पहिलो";
    } 
    if($data4->period==2)
    {
        $period="दोस्रो";
    }
    if($data4->period==3)
    {
        $period="तेस्रो";
    }
     if($data4->period==4)
    {
        $period="चौथो";
    }
     if($data4->period==5)
    {
        $period="पाचौ";
    }
     if($data4->period==6)
    {
        $period="छैठो";
    }
		?>								<div class="banktextdetails">
											  यस कार्यालयको स्वीकृत वार्षिक कार्यक्रम अनुसार <?php echo SITE_LOCATION;?> वडा नं.<?php echo convertedcit($data2->program_organizer_group_address);?><!--(योजनाको ठेगाना भएको वडा न)--> मा <?php echo $data1->program_name; ?><!--(योजनाको नाम) --> 
                                                                                          योजना स्वीकृत भइ मिती <?php echo convertedcit($data3->miti);?><!--(योजना संझौताको मिति) --> 
                                                                                          मा यस <?php echo SITE_TYPE;?>सँग भएको संझौता अनुसार उक्त योजना मिति <?php echo convertedcit($data3->yojana_start_date);?><!--(योजना शुरु हुने मिति)--> देखी काम सुरु गरी मिती <?php echo convertedcit($data3->yojana_sakine_date);?><!--(योजना सम्पन्न हुने मिति)--> भित्रमा  काम
                                                                                          सम्पन्न गर्ने गरी उपभोक्ता समिति सँग सम्झौता गरी योजनाको कार्यदेश दिइएकोमा उपभोक्ता समितिले मिति <?php echo convertedcit($data4->letter_date);?><!--(म्याद थपको लागी उपभोक्ता समितिले निबेदन दिएको मिती)-->
                                                                                          मा यस कार्यालयमा <?php echo $data4->program_problem_reason;?><!--(योजना म्याद भित्र नसकिनुको कारण)-->  कारणले तोकिएको समयमा योजना सम्पन्न गर्न नसकिएको भनि म्याद थपका लागी निबेदन दिएकाले 
                                                                                          नियम अनुसार <?php echo $period;?> पटक मिति <?php echo convertedcit($data4->extended_date);?><!--(थपिएको म्यादको अबधी)--> सम्मका लागी  योजना संचालनको समय थप गर्नका लागी श्रीमान समक्ष यो टिप्पणी पेश गरको छु । 
										</div>
										<div class="myspacer20"></div>
                                                                                <div class="oursignature">सदर गर्ने <br/>
                                                                                     <select name="worker1" class="form-control worker" id="worker_1" >
                                                                                        <option value="">छान्नुहोस्</option>
                                                                                        <?php foreach($workers as $worker){?>
                                                                                        <option value="<?=$worker->id?>" <?php if($print_history->worker1 == $worker->id){echo 'selected="selected"';}?>><?=$worker->authority_name?></option>
                                                                                        <?php }?>
                                                                                    </select>
                                                                                    <input type="text" name="post" class="form-control" id="post_1" value="<?=$worker1->post_name?>">
                                                                                </div>
                                                                                <div class="oursignatureleft">पेस गर्ने <br/>
                                                                                    <select name="worker2" class="form-control worker" id="worker_2">
                                                                                        <option value="">छान्नुहोस्</option>
                                                                                        <?php foreach($workers as $worker){?>
                                                                                        <option value="<?=$worker->id?>" <?php if($print_history->worker2 == $worker->id){echo 'selected="selected"';}?>><?=$worker->authority_name?></option>
                                                                                        <?php }?>
                                                                                    </select>
                                                                                    <input type="text" name="post" class="form-control" id="post_2" value="<?=$worker2->post_name?>"></form>
                                                                                </div>
										<div class="myspacer"></div>    
									</div>
                                                                        <?php endif;?>
                                <!--<div class="settingsMenu1"><a href="settings_topic_add_sub.php">सह शिर्षक थप्नुहोस +</a></div>-->
                            </div>
                        </div>
                  </div>
                </div><!-- main menu ends -->
             
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>