<?php require_once("includes/initialize.php");
if(!$session->is_logged_in()){ redirect_to("logout.php");}
$max_id=$_GET['max_id'];
?>
  <?php
  $user = getUser();
$data=  Costumerassociationdetails0::find_by_plan_id($_GET['id']);
$data1=  Plandetails1::find_by_id($_GET['id']);
$data2=  Moreplandetails::find_by_plan_id($_GET['id']);
$data3=Plantimeadditionaffiliation::find_by_max($max_id,$_GET['id']);
$date_selected= $_GET['date_selected'];
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

$print_history->save();
if(!empty($_GET['worker1']))
{
$worker1 = Workerdetails::find_by_id($_GET['worker1']);
}
else
{
    $worker1 = Workerdetails::setEmptyObject();
}

?>
<?php include("menuincludes/header1.php"); ?>
<!-- js ends -->
<title>विषय:- म्याद थप सम्बन्धमा । print page:: <?php echo SITE_SUBHEADING;?></title>
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
                                  <div class="printlogo"><img src="images/janani.png" alt="Logo"></div>
                                    
									<h1 class="marginright1 letter_title_one"><?php echo SITE_LOCATION;?></h1>
									<h4 class="marginright1 letter_title_two"> <?php echo SITE_HEADING;?> </h4>
                                <h5 class="marginright1 letter-title-four">
                                    <?php
                                    if($user->mode==user){
                                        echo $user->ward_add;
                                    }else {
                                        echo SITE_ADDRESS;
                                    }
                                    ?>
                                </h5>
									<div class="myspacer"></div>
									<div class="subjectboldright"></div>
									<div class="printContent">
										<div class="mydate">मिति : <?php echo convertedcit($date_selected); ?></div>
										<div class="patrano">पत्र संख्या : </div>
										<div class="chalanino">योजना दर्ता नं : <?php echo convertedcit($_GET['id']) ?></div>
										<div class="chalanino">चलानी नं :</div>
                                        <div class="subject">
                                            <u>विषय:-
                                                <?php if(!empty($_GET['subject'])){
                                                    echo $_GET['subject'];
                                                }else{
                                                    echo "म्याद थप पत्र ।";
                                                }?>
                                            </u>
                                        </div>
										<div class="bankname">श्री <?php echo $data->program_organizer_group_name;?><!--(योजनाको संचालन गर्ने उपभोक्ता समितिको नाम)--></div>
										<div class="bankaddress"><?php echo SITE_NAME.convertedcit($data->program_organizer_group_address);?><!--(योजनाको संचालन गर्ने उपभोक्ता समितिको ठेगाना)--></div>
										<?php if($data3->period==1)
 {
        $period="पहिलो";
    }
    if($data3->period==2)
    {
        $period="दोस्रो";
    }
    if($data3->period==3)
    {
        $period="तेस्रो";
    }
     if($data3->period==4)
    {
        $period="चौथो";
    }
     if($data3->period==5)
    {
        $period="पाचौ";
    }
     if($data3->period==6)
    {
        $period="छैठो";
    }
		?>
										
										<div class="banktextdetails">
											यस कार्यालयको स्वीकृत वार्षिक  कार्यक्रम अनुसार <?php echo SITE_LOCATION;?> वडा नं.<?php echo convertedcit($data->program_organizer_group_address);?><!--(योजनाको ठेगाना भएको वडा न)--> मा <?php echo $data1->program_name;?><!--(योजनाको नाम) -->
                                                                                        योजना स्वीकृत भई मिति  <?php echo convertedcit($data2->miti);?> <!-- (योजना संझौताको मिति)-->  मा यस <?php echo SITE_TYPE;?>सँग भएको संझौता 
                                                                                        अनुसार उक्त योजना मिति <?php echo convertedcit($data2->yojana_start_date);?><!--(योजना शुरु हुने मिति)--> देखी काम सुरु गरी मिति  <?php echo convertedcit($data2->yojana_sakine_date);?><!--(योजना सम्पन्न हुने मिति)-->
                                                                                        भित्रमा  काम  सम्पन्न गर्ने गरी योजनाको कार्यदेश दिईएकोमा 
                                                                                        उपभोक्ता समितिले मिति <?php echo convertedcit($data3->letter_date);?><!--(म्याद थपको लागी उपभोक्ता समितिले निबेदन दिएको मिती)--> मा यस
                                                                                        कार्यालयमा <?php echo $data3->program_problem_reason;?><!--(योजना म्याद भित्र नसकिनुको कारण)-->  कारणले तोकिएको समयमा योजना सम्पन्न
                                                                                        गर्न नसकिएको भनि म्याद थपका लागि निबेदन दिएकाले यस कार्यालयको निर्णय अनुसार <?php echo $period; ?> पटक  मिति <?php echo convertedcit($data3->extended_date);?><!--(थपिएको म्यादको अबधी)--> सम्मका लागि 
                                                                                        योजना संचालनको म्याद थप गरिएको जानकारी गराईन्छ ।
										</div>
										<div class="myspacer30"></div>
                                                                                <div class="oursignature"><br/>
                                                                                <?php 
                                                                                    if(!empty($worker1))
                                                                                    {
                                                                                        echo $worker1->authority_name."<br/>";
                                                                                        echo $worker1->post_name;
                                                                                    }
                                                                                ?>
                                                                                </div>
                                                                                    
										<div class="myspacer"></div>
									</div>
                                
                            </div>
                        </div>
                  </div>
                </div><!-- main menu ends -->
            </div>
         </div>   
    </div><!-- top wrap ends -->