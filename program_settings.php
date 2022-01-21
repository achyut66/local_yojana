<?php require_once("includes/initialize.php"); 
if(!$session->is_logged_in()){ redirect_to("logout.php");}?>
  
<?php include("menuincludes/header.php"); ?>
<!-- js ends -->
<title>सेटिंग :: <?php echo SITE_SUBHEADING;?></title>
<style>
#rcorners1 {
  border-radius: 25px;
  background: #4682B4;
  padding: 20px; 
  width: 220px;
  height: 120px; 
  color: white;
}
</style>
</head>

<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
    	<div class="maincontent">
             <h2 class="headinguserprofile">सूची दर्ता | <a href="settings.php" class="btn">पछि जानुहोस</a></h2>
             <div class="myspacer"></div>      
             <div class="OurContentFull">
                       <div class="row">
                        <div class="col-md-3" style="margin-left:460px;">
                                    <a href="settings_enlist_view.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">सूची दर्ता हेर्नुहोस्<br>
                                        <img src="images/new_plan_icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-3">
                                    <a href="settings_enlist.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">सूची दर्ता भर्नुहोस्<br>
                                        <img src="images/new_plan_icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                       </div>
                       <!-- </div> -->
                  </div>
                </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>