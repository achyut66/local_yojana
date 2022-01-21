<?php require_once("includes/initialize.php"); ?>
<?php	
	if(!$session->is_logged_in()){ redirect_to("logout.php");}
	$plan_selected = Plandetails1::find_by_id($_SESSION['set_plan_id']);
        //get_access_form($_SESSION['set_plan_id']);
        $final_data=  Planamountwithdrawdetails::find_by_plan_id($_SESSION['set_plan_id']);
?>
<?php $mode= getUserMode();
$user = getUser();
//print_r($mode);
?>
<?php include("menuincludes/header.php"); ?>
<title>पत्रहरु छान्नुहोस् :: <?php echo SITE_SUBHEADING;?></title>
<style>
* {
  box-sizing: border-box;
}

/* Create three equal columns that floats next to each other */
.userprofile {
  float: left;
  width: 33.33%;
  padding: 20px;
  background-color:#bbb;
  height: 150px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
#rcorners1 {
  border-radius: 25px;
  background: #87CEEB;
  padding: 40px; 
  width: 350px;
  height: 150px;  
  color: red;
}
</style>
<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 

        <div class="maincontent">
             <h2 class="dashboard">उपभोक्ता समिति मार्फत | <a href="upabhoktasamitidashboard.php" class="btn">पछि जानुहोस </a> </h2>
          
            <div class="dashboardcontent">
				<h1 class="myHeading1"><?=$plan_selected->program_name?></h1>
                <div class="myMessage"><?php echo $message;?></div>
                
                <?php if($mode=="administrator"||$mode=="superadmin"):?>
                    <div class="container">
                    <h1 class="myHeading1">सम्झौता संग सम्बन्धित पत्रहरु</h1>
                        <div class="myspacer"></div>
                        <div class="row" style="margin-left: 20px;">
                        <div class="col-md-4">
                                    <a href="print_bank_report08.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">संझौताको टिप्पणी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <?php endif; if($mode=="administrator"|| $mode=="superadmin"):?>
                        
                        <div class="col-md-4">
                                    <a href="print_bank_report02.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">संझौता पत्र<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <?php endif; if($mode=="administrator"|| $mode=="superadmin"):?>
                        
                        <div class="col-md-4">
                                    <a href="print_bank_report_05.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">संझौता कार्यादेश<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <?php endif;?>
                        <div class="col-md-4">
                                    <a href="dashboard_bhuktani.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">योजना सिफारिस<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="anugaman_samiti_patra.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">अनुगमन समितिको प्रतिबेदन<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="upabhokta_praman_patra.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">उपभोक्ता समिति दर्ता प्रमाण पत्र<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="yojana_hastantaran_form.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">योजना हस्तान्तरण फारम<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="yojana_progress_letter.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">योजनाको प्रगति विवरण<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    </div>
                    </div>
                    <div class="myspacer"></div>
                    
                    <div class="container">
                    <h1 class="myHeading1">पेस्की तथा म्याद थप र बैंक खाता सम्बन्धित पत्रहरु</h1>
                    <div class="myspacer"></div>
                        <div class="row" style="margin-left: 20px;">
                        <div class="col-md-4">
                                    <a href="print_bank_report03_yojana.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">पेश्की टिप्पणी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="print_bank_report_15.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">पेश्की टिप्पणी (आर्थिक प्रशासन)<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="print_bank_report_04.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">पेश्की संझौताको कार्यदेश<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="print_bank_report07.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">म्याद थपको टिप्पणी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="print_bank_report06.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">म्याद थपको पत्र<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="print_bank_report01.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">बैंक खाता संचालनको पत्र<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    </div>
                    </div>
                    <div class="myspacer"></div>
                <?php if($user->mode==user){?>
                <?php }else{?>
                    
                    <div class="container">
                    <h1 class="myHeading1">मुल्यांकन तथा अन्तिम भुक्तानी सम्बन्धित पत्रहरु</h1>
                    <div class="myspacer"></div>
                        <div class="row" style="margin-left: 20px;">
                        <div class="col-md-4">
                                    <a href="print_bank_report_bhuktani.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">उपभोक्ता समिति रनिंग बिल भुक्तानी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="karya_sampan.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">उपभोक्ता समिति अन्तिम भुक्तानी रकम माग निवेदन<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="print_bank_report_09.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">मुल्यांकन टिप्पणी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="print_bank_report_16.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">मुल्यांकन टिप्पणी (आर्थिक प्रशासन)<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <?php if(!empty($final_data)):?>
                        <div class="col-md-4">
                                    <a href="print_bank_report_11.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">अन्तिम भुक्तानीको टिप्पणी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <?php endif;?>
                        <?php if(!empty($final_data)):?>
                        <div class="col-md-4">
                                    <a href="print_bank_report_17.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">अन्तिम भुक्तानीको टिप्पणी (आर्थिक प्रशासन शाखा)<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="yojana_hastantaran_samjhauta.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">योजना हस्तान्तरण संझौता फारम<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="plan_ifsuccess_letter.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">योजना प्रगति विवरण (प्राविधिक कर्मचारीहरुले भर्ने)<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <?php endif;?>
                    </div>
                    </div>
    <?php }?>
        </div>
    </div><!-- main menu ends -->
</div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>