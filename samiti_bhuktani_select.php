<?php require_once("includes/initialize.php"); ?>
<?php	
	if(!$session->is_logged_in()){ redirect_to("logout.php");}
	$plan_selected = Plandetails1::find_by_id($_SESSION['set_plan_id']);
//        get_access_form($_SESSION['set_plan_id']);
?>
<?php include("menuincludes/header.php"); ?>
<title>पत्रहरु छान्नुहोस् :: <?php echo SITE_SUBHEADING;?></title>
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
<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
        <div class="maincontent">
             <h2 class="dashboard">उपभोक्ता समिति मार्फत | <a href="yojanasanchalandash.php">योजना संचालन प्रकृया</a> | <a href="index.php">Dashboard</a>| <a href="anyasamitidasboard.php" class="btn">पछी जानुहोस </a></h2>
            <div class="OurContentFull">
				<h1 class="myHeading1"><?=$plan_selected->program_name?> | दर्ता न :<?=convertedcit($plan_selected->id)?></h1>
                <div class="myMessage"><?php echo $message;?></div>
                
                
                <!-- <div class="userprofiletable"> -->
                    <div class="container">
                    <h2>भुक्तानी छान्नुहोस् </h2>
                    <div class="myspacer"></div>
                      <div class="row">
                        <div class="col-md-4">
                                    <a href="plan_form2.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">पेश्की भुक्तानी<br>
                                        <img src="images/n/lagat1.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="samiti_plan_form4.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">मुल्यांकनको आधारमा भुक्तानी<br>
                                        <img src="images/n/lagat1.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="samiti_plan_form5.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">अन्तिम भुक्तानी<br>
                                        <img src="images/n/lagat1.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="additionaldate.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">म्याद थप<br>
                                        <img src="images/report-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                           </div>
                      </div>
                      </div>
                    </div>
                </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>