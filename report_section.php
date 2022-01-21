<?php require_once("includes/initialize.php"); ?>
<?php	
	if(!$session->is_logged_in()){ redirect_to("logout.php");}	
?>
<?php include("menuincludes/header.php"); ?>
<title>रिपोर्ट हेर्नुहोस :: <?php echo SITE_SUBHEADING;?></title>
<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
        <div class="maincontent">
             <h2 class="dashboard">प्रगति विवरण रिपोर्ट हेर्नुहोस | <button class="button btn-danger"><a href="index.php">Back जानुहोस</a></button></h2> 
        </div>
        <div class="myspacer"></div>
            <a href="bhautik_report.php">
                        <div class="userprofile">
                        	<h3>क्षेत्रगत भौतिक प्रगति अवस्था</h3>
                            <div class="dashimg">
                                <img src="images/pen-icon.png" alt="Report Icons" class="dashimg" />
                            </div>
                        </div>
            </a><!-- user profile ends -->
            <a href="sarans_expenditure_report.php">
                        <div class="userprofile">
                        	<h3>विषयगत क्षेत्र अनुसारको रिपोर्ट</h3>
                            <div class="dashimg">
                                <img src="images/pen-icon.png" alt="Report Icons" class="dashimg" />
                            </div>
                        </div>
            </a><!-- user profile ends -->
            <a href="suchikrit_firm_info.php">
                        <div class="userprofile">
                        	<h3>सुचिकृत फर्म कम्पनी विवरण</h3>
                            <div class="dashimg">
                                <img src="images/pen-icon.png" alt="Report Icons" class="dashimg" />
                            </div>
                        </div>
            </a><!-- user profile ends -->
    </div><!-- main menu ends -->
    <div class="myspacer"></div>
<?php include("menuincludes/footer.php"); ?>