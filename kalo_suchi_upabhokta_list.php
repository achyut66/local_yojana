<?php require_once("includes/initialize.php");
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
error_reporting(1);
$mode = getUserMode();
if ($mode != "administrator" && $mode != "superadmin" && $mode !="user") {
die("ACCESS DENIED");
} 
$black = CostumerBlackList::find_all();
?>
<?php include("menuincludes/header.php"); ?>
<title>कालो सुची विवरण हेर्नुहोस :: <?php echo SITE_SUBHEADING; ?></title>
</head>
<body>
<?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner">
        <div class="maincontent">
            <h2 class="headinguserprofile">कालो सुचीमा परेका उपभोक्ता समितिको विवरण | <a href="settings.php" class="btn">पछि जानुहोस</a></h2>
            <div class="OurContentFull">
                <h2>कालो सुचीमा परेका उपभोक्ता समितिको विवरण हेर्नुहोस</h2>
            </div>
            <div class="myspacer"></div>
            <div class="text-center"><strong><u>" कालो सुचिमा परेका उपभोक्ता समितिको विवरण "</u></strong></div>
            <table class="table table-bordered table-responsive">
                <thead>
                    <tr>
                        <th class="text-center">सी.नं</th>
                        <th class="text-center">दर्ता नं</th>
                        <th class="text-center">उपभोक्ता समितिको नाम</th>
                        <th class="text-center">योजनाको नाम</th>
                        <th class="text-center">कालो सुचिमा पर्नुको कारण</th>
                        <th class="text-center">सुची बाट हटाउनुहोस</th>
                    </tr>
                </thead>
                <?php $i=1; foreach($black as $bl):?>
                <tbody>
                    <tr>
                        <td><?=convertedcit($i);?></td>
                        <td><?=convertedcit($bl->plan_id)?></td>
                        <td><?=$bl->costumer_name?></td>
                        <td><?=$bl->program_name?></td>
                        <td><?=$bl->black_list_reason;?></td>
                        <td><a href="black_list_delete.php?id=<?=$bl->plan_id?>" class="btn btn-danger">हटाउनुहोस</a></td>
                    </tr>
                </tbody>
                <?php $i++; endforeach;?>
            </table>
        </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>
