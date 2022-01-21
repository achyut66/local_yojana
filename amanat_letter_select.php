<?php require_once("includes/initialize.php"); ?>
<?php
if(!$session->is_logged_in()){ redirect_to("logout.php");}
$plan_selected = Plandetails1::find_by_id($_SESSION['set_plan_id']);
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
                
                <div class="myspacer"></div>
                <div class="container">
                <h1 class="myHeading1">सम्झौता संग सम्बन्धित पत्रहरु</h1>
                      <!-- <div class="card"> -->
                          <div class="col-md-12">
                              <div class="row">
                                    <div class="col-md-4">
                                    <a href="amanat_tippani_patra.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">संझौताको टिप्पणी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                                    <div class="col-md-4">
                                    <a href="amanat_karyadesh_patra.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">संझौता कार्यदेश<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                                    <div class="col-md-4">
                                    <a href="amanat_samjhauta_patra.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">संझौता पत्र<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                                    <div class="col-md-4">
                                    <a href="amanat_rakam_nikasa_patra.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">रकम निकासा सम्बन्धमा<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                                    <div class="col-md-4">
                                    <a href="print_bank_report_04.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">पेश्की संझौताको टिप्पणी<br>
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
                              </div>
                          </div>
                      <!-- </div> -->
                    </div>
                <div class="myspacer"></div>
                    
                    <div class="myspacer"></div>
                    <div class="container">
                    <h1 class="myHeading1">मुल्यांकन तथा अन्तिम भुक्तानी सम्बन्धित पत्रहरु</h1>
                      <!-- <div class="card"> -->
                          <div class="col-md-12">
                              <div class="row">
                                    <div class="col-md-4">
                                    <a href="print_bank_report_09.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">मुल्यांकनको (भुक्तानीको टिप्पणी)<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                                    
                                    <div class="col-md-4">
                                    <a href="amanat_bhuktani_patra.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">अन्तिम भुक्तानीको टिप्पणी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                              </div>
                          </div>
                      <!-- </div> -->
                    </div>
            </div>
        </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>