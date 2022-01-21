<?php require_once("includes/initialize.php");
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
error_reporting(1);
$mode = getUserMode();
if ($mode != "administrator" && $mode != "superadmin" && $mode !="user") {
die("ACCESS DENIED");
} 
$id = $_GET['id'];
$plan_details1 = Costumerassociationdetails0::find_by_plan_id($id);
$plan_details_1 = Plandetails1::find_by_id($id);
if(isset($_POST['submit']))
{
    $data = new CostumerBlackList();
    $data->plan_id = $_POST['plan_id'];
    $data->costumer_name = $_POST['costumer_name'];
    $data->program_name = $_POST['program_name'];
    $data->black_list_reason = $_POST['black_list_reason'];
    if($data->save())
    {
        echo alertBox("सेव गर्न सफल!!!", "enlist_usamiti.php");
    }
}
$black = CostumerBlackList::find_by_plan_id($id);
// print_r($black);
?>
<?php include("menuincludes/header.php"); ?>
<title>कालो सुची विवरण :: <?php echo SITE_SUBHEADING; ?></title>
</head>
<body>
<?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner">
        <div class="maincontent">
            <h2 class="headinguserprofile">कालो सुची विवरण | <a href="enlist_usamiti.php" class="btn">पछि जानुहोस</a></h2>
            <div class="OurContentFull">
                        <div class="userprofiletable">
                        	<form method="post" enctype="multipart/form-data">
                            <input type="hidden" value="" name="bail_id" id="bail_id">
                            	<div class="inputWrap">
                                	<h1>कालो सुची विवरण</h1>
                                    <div class="titleInput">उपभोक्ता समितिको नाम: </div>
                                    <div class="newInput">
                                        <input type="text" name="costumer_name" readonly value="<?=$plan_details1->program_organizer_group_name?>"></div>
                                    <hr>
                                    <div class="titleInput">कालो सुचिमा राख्नुको कारण : </div>
                                    <?php if(!empty($black)){?>
                                    <div class="newInput">
                                        <?php foreach ($black as $b):?>
                                        <input type="text" value="<?=$b->black_list_reason?>" id="black_list_reason" name="black_list_reason">
                                        <?php endforeach;?>
                                    </div>
                                    <?php }else{?>
                                        <div class="newInput">
                                        <textarea type="text" id="black_list_reason" name="black_list_reason"></textarea>
                                    </div>
                                    <?php }?>
                                    <input type="hidden" name="plan_id" value="<?=$plan_details_1->id?>" />
                                    <input type="hidden" name="program_name" value="<?=$plan_details_1->program_name?>" />
                                    <div class="saveBtn myWidth100">
                                    <input type="submit" name="submit" value="सेभ गर्नुहोस" class="btn"></div>
                                	<div class="myspacer"></div>
                                </div><!-- input wrap ends -->
                        </div>
                  </div>
        </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
    <!-- <div class="userprofitable">
        <div class="text-center"><strong><u>कालो सुचिमा परेका उपभोक्ता समितिको विवरण हेर्नुहोस</u></strong></div>
            <table class="table table-bordered table-responsive">
                  <thead>
                      <th class="text-center">सी.नं</th>
                      <th class="text-center">उपभोक्ता समितिको नाम</th>
                      <th class="text-center">कालो सुचिमा राख्नुको कारण</th>
                  </thead>
                  <?php $i=1; foreach($black as $b):?>      
                  <tbody>
                      <td><?=convertedcit($i);?></td>
                      <td><?=$b->costumer_name;?></td>
                      <td><?=$b->reason;?></td>
                  </tbody>
                  <?php $i++; endforeach;?>
            </table>
    </div> -->
<?php include("menuincludes/footer.php"); ?>
