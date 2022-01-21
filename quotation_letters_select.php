<?php require_once("includes/initialize.php"); ?>
<?php
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
$plan_selected = Plandetails1::find_by_id($_SESSION['set_plan_id']);
//get_access_form($_SESSION['set_plan_id']);
$final_data = Planamountwithdrawdetails::find_by_plan_id($_SESSION['set_plan_id']);
?>
<?php $mode = getUserMode(); ?>
<?php include("menuincludes/header.php"); ?>
<title>पत्रहरु छान्नुहोस् :: <?php echo SITE_SUBHEADING; ?></title>
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
        <h2 class="dashboard">उपभोक्ता समिति मार्फत | <a href="upabhoktasamitidashboard.php" class="btn">पछि
                जानुहोस </a></h2>

        <div class="dashboardcontent">
            <h1 class="myHeading1"><?= $plan_selected->program_name ?></h1>
            <div class="myMessage"><?php echo $message; ?></div>
            
            <?php if ($mode == "administrator" || $mode == "superadmin"): ?>
            <div class="grid-container">

                <?php endif;
                if ($mode == "administrator" || $mode == "user" || $mode == "superadmin"): ?>
                    <div class="container">
                    <h1 class="myHeading1">पत्रहरु छान्नुहोस् </h1>
                    <div class="myspacer"></div>
                        <div class="row">
                    <div class="col-md-4">
                                                <a href="quotation_letter.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">कोटेशनबाट खरीद टिप्पणी/ दररेट पेश पत्र<br>
                                                    <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                    <div class="col-md-4">
                                                <a href="print_quotation_kabol.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">कोटेसन स्वीकृत गर्ने सम्बन्धमा<br>
                                                    <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                    <div class="col-md-4">
                                                <a href="quotation_lagat_anuman.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">लागत अनुमान स्वीकृत सम्बन्धमा<br>
                                                    <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                    <div class="col-md-4">
                                                <a href="quotation_dar_rate.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">दररेट पेश सम्बन्धमा<br>
                                                    <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                    <div class="col-md-4">
                                                <a href="quotation_dar_vau.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">दरभाउ पत्र स्वीकृत सम्बन्धमा<br>
                                                    <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                    <!-- <div class="col-md-4">
                                                <a href="quotation_samjhauta.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">सम्झौता सम्बन्धमा<br>
                                                    <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div> -->
                    <!-- <div class="col-md-4">
                                                <a href="quotation_karyadesh.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">कार्यादेश सम्बन्धमा<br>
                                                    <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div> -->
                    <div class="col-md-4">
                                                <a href="print_quotation_kabol_samjhauta.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">सम्झौता गर्न आउने बारेको चिठी<br>
                                                    <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                    <div class="col-md-4">
                                                <a href="print_quotation_kabol_samjhauta_patra.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">पालिका र स्वीकृत निर्माण व्यवसायीबीचको सम्झौता-पत्र<br>
                                                    <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                    <div class="col-md-4">
                                                <a href="print_quotation_kabol_karyadesh.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">स्वीकृत फर्म/कम्पनीलाई दिइने कार्यादेश-पत्र<br>
                                                    <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                    <div class="col-md-4">
                                                <a href="quotation_antim_bhuktani.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">अन्तिम भुक्तानीको टिप्पणी<br>
                                                    <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                <?php endif; ?>
                        </div>
                    </div>
            </div>
        </div>
    </div><!-- main menu ends -->
</div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>
