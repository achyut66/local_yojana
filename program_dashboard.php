<?php require_once("includes/initialize.php"); ?>
<?php
	if(!$session->is_logged_in()){ redirect_to("logout.php");}
	if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
	{
            redirectUrl();
	}
        if(!isset($_GET['id']))
        {
            redirect_to("setprogramid.php");
        }
        if($_GET['id']!=$_SESSION['set_plan_id']):
          die('Invalid Format');
       endif;
$program_selected = Plandetails1::find_by_id($_GET['id']);
?>
<?php include("menuincludes/header.php"); ?>
<!-- js ends -->
<title>योजना संचालन प्रकृया </title>
<style>
#rcorners1 {
  border-radius: 25px;
  background: #87CEEB;
  padding: 40px; 
  width: 350px;
  height: 150px;  
  color: red;
}
</style>
</head>
<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 maincontent">
                    <h2 class="dashboard">कार्यक्रम संचालन प्रकृया | <a href="setprogramid.php" class="btn">पछाडी जानुहोस</a></h2>
                    <h2 class="dashboard"><?=$program_selected->program_name?> | दर्ता न :<?=convertedcit($program_selected->id)?></h2>
                    <div class="dashboardcontent">
                        <div class="myspacer"></div>
                        <div class="container">
                        <div class="row">
                        <div class="col-md-4">
                                    <a href="program_more_details.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">कार्यक्रम संचालन विवरण<br>
                                        <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="training_expense.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">कार्यक्रमको कुल लागत अनुमान<br>
                                        <img src="images/office-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="program_payment.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">पेश्की भुक्तानी<br>
                                        <img src="images/report-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="program_additional_date.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">कार्यक्रम म्याद थप<br>
                                        <img src="images/report-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="letters_select_programs.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">पत्रहरु<br>
                                        <img src="images/patra-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="program_payment_final.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">अन्तिम भुक्तानी<br>
                                        <img src="images/office-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <!-- <div class="col-md-4">
                                    <a href="program_payment_deposit_return.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">धरौटी फिर्ता<br>
                                        <img src="images/office-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                        </div> -->
                    </div>
                        </div>
                    </div>
                </div><!-- main menu ends -->
</div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>