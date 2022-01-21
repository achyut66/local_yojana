<?php require_once("includes/initialize.php"); ?>

<?php	

	if(!$session->is_logged_in()){ redirect_to("logout.php");}
	$plan_selected = Plandetails1::find_by_sn($_SESSION['sn']);
     //echo Contractamountwithdrawdetails::get_payement_till_now($_SESSION['set_plan_id']);exit;
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
  color:red;
}

</style>
</head>
<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 maincontent">
                    <h2 class="dashboard">ठेक्का मार्फत  | <a href="yojanasanchalandash.php" class="btn">पछि जानुहोस </a></h2>
                    <div class="dashboardcontent">
                    
                      <?php if($mode=="user"||$mode=="administrator"||$mode=="superadmin" || $mode=="section"):?>
                        
                        <div class="container">
                        <h1 class="myHeading1"><?=$plan_selected->program_name?></h1>
                        <div class="myspacer"></div>
                            <div class="row">
                                <div class="col-md-4">
                                                <a href="view_contract_info.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">ठेक्का सूचना दर्ता<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                                <div class="col-md-4">
                                                <a href="view_contract_invitation_for_bid.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">ठेक्का बोलपत्र बिक्रि किताब<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                                <div class="col-md-4">
                                                <a href="view_contract_invitation_entry.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">ठेक्का बोलपत्र दर्ता किताब<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                                <div class="col-md-4">
                                                <a href="view_contract_bid_final.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">ठेक्का खोलिएको फारम<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                                    <div class="col-md-4">
                                                <a href="view_contract_entry_final.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">ठेक्का कबोल फारम<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                                    <div class="col-md-4">
                                                <a href="contract_invitation_bid_form_view.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">ठेक्का बोलिने फारम<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                                    <div class="col-md-4">
                                                <a href="contract_form1.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">ठेक्काको कुल लागत अनुमान<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                                    <div class="col-md-4">
                                                <a href="contract_form2.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">ठेक्का संचालन विवरण<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                                    <div class="col-md-4">
                                                <a href="contract_letter_dashboard.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">पत्रहरु<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                                    <?php endif;?>
                                    <?php if($mode=="administrator"||$mode=="superadmin"):?>
                                    <div class="col-md-4">
                                                <a href="contract_bhuktani_dashboard.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">भुक्तानी<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                                <?php endif;?>
                            </div>
                        </div>
                    </div>
                </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>