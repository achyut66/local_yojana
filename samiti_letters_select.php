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
          <h2 class="dashboard">उपभोक्ता समिति मार्फत | <a href="anyasamitidasboard.php" class="btn">पछि जानुहोस </a> </h2>
            <div class="ourcontent">
				<h1 class="myHeading1"><?=$plan_selected->program_name?></h1>
                <div class="myMessage"><?php echo $message;?></div>
                <div class="container">
                <div class="myspacer"></div>
                <h1 class="myHeading1">योजना सम्झौता सम्बन्धित पत्रहरु</h1>
                    <div class="row">
                        <div class="col-md-4">
                                    <a href="samjhauta_tippani_letter.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">संझौताको टिप्पणी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="samjhauta_letter.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">संझौता पत्र<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="samiti_samjhauta_karyadesh.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">संझौता कार्यदेश<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        </div>
                                    <div class="myspacer"></div>
                        <h1 class="myHeading1">पेस्की तथा भुक्तानी सम्बन्धित पत्रहरु</h1>
                        <div class="myspacer"></div>
                        <div class="row">
                        <div class="col-md-4">
                                    <a href="samiti_peski_samjhauta_tippani.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">पेश्की संझौताको टिप्पणी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="samiti_peski_samjhauta_karyadesh.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">पेश्की संझौताको कार्यदेश<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="samiti_bank_letter.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">बैंक खाता संचालनको पत्र<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="samiti_additional_date_tippani_letter.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">म्यादको थपको टिप्पणी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="samiti_add_date_letter.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">म्यादको थपको पत्र<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="samiti_analysis_letter.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">मुल्यांकनको आधारमा  भुक्तानीको टिप्पणी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="samiti_final_letter.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">अन्तिम भुक्तानीको टिप्पणी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-4">
                                    <a href="dashboard_samiti_bhuktani.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">संस्था / समिति सिफारिस<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                </div>
             </div>
        </div><!-- main menu ends -->
        </div>
</div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>