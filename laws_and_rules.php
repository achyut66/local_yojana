<?php require_once("includes/initialize.php");
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
error_reporting(1);
$mode = getUserMode();
if ($mode != "administrator" && $mode != "superadmin" && $mode !="user") {
die("ACCESS DENIED");
} 
?>
<?php include("menuincludes/header.php"); ?>
<title>दफा राख्नुहोस:: <?php echo SITE_SUBHEADING; ?></title>
</head>
<body>
<?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner">
        <div class="maincontent">
        <div class="OurContentFull">
                        <div class="userprofiletable">
                        	<form method="post" enctype="multipart/form-data">
                            <input type="hidden" value="" name="bail_id" id="bail_id">
                            	<div class="inputWrap">
                                	<h1>दफा / नियम राख्नुहोस</h1>
                                    <div class="titleInput">दफा / नियम उल्लेख गर्नुहोस </div>
                                    <div class="newInput">
                                        <textarea type="text" name="dafa" readonly></textarea>
                                    </div>
                                    <div class="titleInput">उपदफा / उपनियम उल्लेख गर्नुहोस </div>
                                    <div class="newInput">
                                        <textarea type="text" name="upa_dafa" readonly></textarea>
                                    </div>
                                    <!-- <div class="titleInput">नियम उल्लेख गर्नुहोस </div>
                                    <div class="newInput">
                                        <textarea type="text" name="niyem" readonly></textarea>
                                    </div>
                                    <div class="titleInput">उपनियम उल्लेख गर्नुहोस </div>
                                    <div class="newInput">
                                        <textarea type="text" name="upa_niyem" readonly></textarea>
                                    </div> -->
                                    <hr>
                                    <div class="saveBtn myWidth100">
                                    <input type="submit" name="submit" value="सेभ गर्नुहोस" class="button btn-success"></div>
                                	<div class="myspacer"></div>
                                </div><!-- input wrap ends -->
                        </div>
                  </div>
            <!-- <h2 class="headinguserprofile">दफा / नियम / उपनियम राख्नुहोस | <a href="settings.php" class="btn">पछि जानुहोस</a></h2> -->
           
        </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>
