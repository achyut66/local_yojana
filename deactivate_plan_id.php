
<?php require_once("includes/initialize.php"); 
if(!$session->is_logged_in()){ redirect_to("logout.php");}?>
<?php
if(isset($_POST['submit']))
{
	$data = new DeactivePlan();

    $data->plan_id = $_POST['plan_id'];
    $data->status = $_POST['status'];
    $data->program_name = $_POST['program_name'];
    $data->deactivate_reason = $_POST['deactivate_reason'];

	if($data->savePostData($_POST,"create")){
        $session->message("योजना निस्क्रिय गराउन सफल");    
        redirect_to("plan_form_view.php");
        }
}
$id = $_GET['id'];
$plan_details = Plandetails1::find_by_id($id);
// print_r($plan_details);
?>
<?php include("menuincludes/header.php"); ?>
<!-- js ends -->
<title>निस्क्रिय गर्नुपर्ने कारण :: <?php echo SITE_SUBHEADING;?></title>
</head>
<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
                <div class="maincontent">
                    <h2 class="headinguserprofile">निस्क्रिय गर्नुपर्ने कारण | <a href="view_post.php" class="btn">पछि जानुहोस</a> </h2>
                    <div class="OurContentFull">
                        <div class="userprofiletable">
                        	<form method="POST" enctype="multipart/form-data">
                            	<div class="inputWrap">
                                	<h1>निस्क्रिय गर्नुपर्ने कारण</h1>
                                    <div class="titleInput">कारण लेख्नुहोस : </div>
                                    <div class="newInput">
                                        <textarea type="text" id="deactivate_reason" name="deactivate_reason" value="<?php echo $plan_details->deactivate_reason?>" required></textarea></div>
                                    <div class="saveBtn myWidth100">
                                        <input type="submit" name="submit" value="सेभ गर्नुहोस" class="button btn-success"></div>
                                	<div class="myspacer"></div>
                                </div><!-- input wrap ends -->
                            
                            <input type="hidden" name="program_name" value="<?php echo $plan_details->program_name?>">
                            <input type="hidden" name="status" value="1">
                            <input type="hidden" name="plan_id" value="<?php echo $plan_details->id?>">
                            </form>
                        </div>
                  </div>
                </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>