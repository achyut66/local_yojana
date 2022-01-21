<?php require_once("includes/initialize.php"); ?>
<?php
	
	if(!$session->is_logged_in()){ redirect_to("logout.php");}
?>
<?php include("menuincludes/header.php"); ?>
<!-- js ends -->
<title>योजना संचालन प्रकृया :: <?php echo SITE_SUBHEADING;?></title>
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
                    <h2 class="dashboard">योजनाको कुल लागत अनुमान / फोटो हाल्नुहोस | <a href="anyasamitidasboard.php" class="btn">पछि जानुहोस </a></h2>
                    <div class="dashboardcontent">
                        <div class="myspacer"></div>
                        <div class="container" style="margin-right: 20px;">
                            <div class="row">
                        <div class="col-md-4">
                                    <a href="samiti_plan_form1.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">योजनाको कुल लागत<br>
                                        <img src="images/n/lagat1.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="photos_upload.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">फोटो हाल्नुहोस<br>
                                        <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    </div>
                </div><!-- main menu ends -->
                    </div>
                </div>
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>