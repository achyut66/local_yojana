<?php
require_once("includes/initialize.php");
include("menuincludes/header.php");
if(!$session->is_logged_in()){ redirect_to("logout.php");}
$plan_selected = Plandetails1::find_by_sn($_SESSION['sn']);
?>
<title>ठेक्का मार्फत योजना संचालन प्रक्रिया </title>
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
    <?php include("menuincludes/topwrap.php");?>
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
                                                <a href="ethekka_kul_lagat.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">ठेक्काको कुल लागत<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                       <div class="col-md-4">
                                                <a href="ethekka_lagat_info_form.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">ठेक्का सम्बन्धि विवरण<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                       <div class="col-md-4">
                                                <a href="ethekka_letter_dashboard.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">पत्रहरु<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                       <div class="col-md-4">
                                                <a href="ethekka_plan_form5.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">भुक्तानी<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                        <div class="col-md-4">
                                                <a href="ethekka_peski.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">पेस्की<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                        <div class="col-md-4">
                                                <a href="ethekka_myadthap.php" target="_blank">
                                                    <p id="rcorners1" class="text-center" style="font-size: 22px;">म्याद थप<br>
                                                    <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                                </p>
                                                </a>
                                                </div>
                      <?php endif;?>
                    </div>
                       </div>
                    </div>
                </div>
    </div>
</body>
<?php 
include("menuincludes/footer.php");?>