<?php require_once("includes/initialize.php"); ?>

<?php	
	if(!$session->is_logged_in()){ redirect_to("logout.php");}
	$plan_selected = Plandetails1::find_by_id($_SESSION['set_plan_id']);
?>
<?php $mode= getUserMode();?>
<?php include("menuincludes/header.php"); ?>
<!-- js ends -->
<title><?=$plan_selected->program_name?> ::<?php echo SITE_SUBHEADING;?></title>
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
                    <h2 class="dashboard">अमानत मार्फत | <a href="yojanasanchalandash.php" class="btn">पछि जानुहोस</a></h2>
                    <div class="dashboardcontent">
                    <h1 class="myHeading1"><?=$plan_selected->program_name?></h1>
                      
                      <?php if(isset($_GET['msg'])):?>
                      <h1 style="color:red;" class="myHeading1"><?php echo $_GET['msg'];?></h1>
                       <?php endif;?>
                      <?php if($mode=="user"||$mode=="administrator"||$mode=="subadmin"||$mode="superadmin"):?>
                        <div class="myspacer"></div>
                        <div class="container">
                        <h1 class="myHeading1">योजना दर्ता न : <?=convertedcit($plan_selected->id)?></h1>
                      <!-- <div class="card"> -->
                          <div class="col-md-12">
                              <div class="row">
                                    <div class="col-md-4">
                                    <a href="amanat_lagat_dashboard.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">कुल लागत / फोटो हाल्नुहोस<br>
                                        <img src="images/n/lagat1.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                                    <div class="col-md-4">
                                    <a href="amanat_more_details.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">योजना सम्बन्धि अन्य विवरण<br>
                                        <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                                    <div class="col-md-4">
                                    <a href="amanat_letter_select.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">पत्रहरु<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                                    <div class="col-md-4">
                                    <a href="amanat_bhuktani_dashboard.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">भुक्तानी<br>
                                        <img src="images/n/bhuktani1.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                              </div>
                          </div>
                      <!-- </div> -->
                    </div>
                      <?php endif;?>
                       
                    </div>
                </div><!-- main menu ends -->
           
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>