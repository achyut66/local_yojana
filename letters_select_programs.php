<?php require_once("includes/initialize.php"); ?>
<?php	
	if(!$session->is_logged_in()){ redirect_to("logout.php");}
	$plan_selected = Plandetails1::find_by_id($_SESSION['set_plan_id']);

$program_id=$_SESSION['set_plan_id'];
?>
<?php include("menuincludes/header.php"); ?>
<title>पत्रहरु छान्नुहोस् </title>
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
             <h2 class="dashboard"><a href="program_dashboard.php" >कार्यक्रम संचालन प्रकृया</a> | <a href="program_dashboard.php?id=<?= $program_id ?>" class="btn">पछी जानुहोस </a></h2>
            <div class="OurContentFull">
				<h1 class="myHeading1"><?=$plan_selected->program_name?></h1>
                <div class="myMessage"><?php echo $message;?></div>
                <h2>पत्रहरु छान्नुहोस् </h2>
                <div class="userprofiletable">
                    <div class="myspacer"></div>
                    <div class="container">
                        <div class="row">
               	       <!-- <a href="print_karyadesh_report_01.php">	
                       <div class="userprofile">
                        	<h4></h4>
                            <div class="dashimg">
                            	<img src="images/pen-icon.png" alt="Upabhokta Icon" class="dashimg" />
                            </div>                            
                        </div>
                        </a>user profile ends -->
                        <div class="col-md-4">
                                    <a href="print_karyadesh_report_01.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">कार्यदेशको टिप्पणी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                       <!--  <div class="userprofiletable"> -->
               		<!-- <a href="print_karyadesh_report_02.php">
                        <div class="userprofile">
                        	<h4></h4>
                            <div class="dashimg">
                            	<img src="images/pen-icon.png" alt="Billing Icons" class="dashimg" />
                            </div>
                        </div>
                        </a> -->
                        <div class="col-md-4">
                                    <a href="print_karyadesh_report_02.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">कार्यदेश पत्र<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <!-- user profile ends -->
                        <!-- <a href="print_karyadesh_report_13.php"><div class="userprofile">
                        	<h4></h4>
                            <div class="dashimg">
                            	<img src="images/pen-icon.png" alt="Upabhokta Icon" class="dashimg" />
                            </div>
                            
                        </div></a>user profile ends -->
                        <div class="col-md-4">
                                    <a href="print_karyadesh_report_13.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">संझौता पत्र<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <!-- <a href="letters_select3.php">
                        <div class="userprofile">
                        	<h4> </h4>
                            <div class="dashimg">
                            	<img src="images/pen-icon.png" alt="Report Icons" class="dashimg" />
                            </div>
                        </div></a>user profile ends -->
                        <div class="col-md-4">
                                    <a href="letters_select3.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">पेश्की संझौताको टिप्पणी / आर्थिक प्रशासन शाखा पत्र<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        
                        
                        <!-- <a href="print_karyadesh_report_04.php">
                        <div class="userprofile">
                        	<h4></h4>
                            <div class="dashimg">
                            	<img src="images/pen-icon.png" alt="Report Icons" class="dashimg" />
                            </div>
                        </div></a>user profile ends -->
                        <div class="col-md-4">
                                    <a href="print_karyadesh_report_04.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">पेश्की कार्यदेश पत्र<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <!-- <a href="print_karyadesh_report_05.php"> -->
                        <!-- <div class="userprofile">
                        	<h4></h4>
                            <div class="dashimg">
                            	<img src="images/pen-icon.png" alt="Report Icons" class="dashimg" />
                            </div>
                        </div></a>user profile ends -->
                        <div class="col-md-4">
                                    <a href="print_karyadesh_report_05.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">म्यादको थपको टिप्पणी<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <!--<a href="#">-->
                        <!--<div class="userprofile">-->
                        <!--	<h4>म्यादको थपको पत्र</h4>-->
                        <!--    <div class="dashimg">-->
                        <!--    	<img src="images/pen-icon.png" alt="Report Icons" class="dashimg" />-->
                        <!--    </div>-->
                        <!--</div></a><!-- user profile ends -->
                      
                        <!-- <a href="print_karyadesh_report_12.php">
                        <div class="userprofile">
                        	<h4> </h4>
                            <div class="dashimg">
                            	<img src="images/pen-icon.png" alt="Report Icons" class="dashimg" />
                            </div>
                        </div></a>user profile ends -->
                        <div class="col-md-4">
                                    <a href="print_karyadesh_report_12.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">भुक्तानीको सिफारिस<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                         
                        <!-- <a href="letters_select4.php">
                        <div class="userprofile">
                        	<h4></h4>
                            <div class="dashimg">
                            	<img src="images/pen-icon.png" alt="Report Icons" class="dashimg" />
                            </div>
                        </div></a>user profile ends -->
                        <div class="col-md-4">
                                    <a href="letters_select4.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">अन्तिम भुक्तानीको टिप्पणी / आर्थिक प्रशासन शाखा पत्र<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <!--<a href="#"><div class="userprofile3">-->
                        <!--	<h4>फोटो हाल्नुहोस्</h4>-->
                        <!--    <div class="dashimg">-->
                        <!--    	<img src="images/pen-icon.png" alt="Report Icons" class="dashimg" />-->
                        <!--    </div>-->
                        <!--</div></a><!-- user profile ends -->
                        
                        
                        <!-- <a href="print_karyadesh_report_14.php"><div class="userprofile">
                        	<h4> </h4>
                            <div class="dashimg">
                            	<img src="images/pen-icon.png" alt="Upabhokta Icon" class="dashimg" />
                            </div>
                            
                        </div></a>user profile ends -->
                        <div class="col-md-4">
                                    <a href="print_karyadesh_report_14.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 22px;">धरौटी फिर्ता<br>
                                        <img src="images/n/patra.png" alt="Upabhokta Icon" class="dashimg" />
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