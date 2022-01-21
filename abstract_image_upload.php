<?php require_once("includes/initialize.php");
error_reporting(E_ALL);
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
$fiscal_year_all= Fiscalyear::find_all();
include 'Classes/PHPExcel/IOFactory.php';
if (isset($_POST['submit'])) {
    $file_original = $_FILES['estimate']['name'];
    $tmp = explode('.', $file_original);
    $extension = end($tmp);
    $file = uniqid();
    move_uploaded_file($_FILES['estimate']['tmp_name'], 'abstract_images/'.$file.'.'.$extension);
    $filename  = 'abstract_images/'.$file.'.'.$extension;

    $abstract_image = new AbstractCostImage();
    $abstract_image->title = $_POST['title'];
    $abstract_image->image = $filename;
    $abstract_image->plan_id   = $_SESSION['set_plan_id'];
    $abstract_image->save();
    redirect_to("abstract_image_upload.php");
}
  
if (!isset($_GET['id']) && isset($_SESSION['set_plan_id'])) {
    redirectUrl();
}
$check_plan = isset($_SESSION['check_type']) && $_SESSION['check_type'];
if ($_GET['id']!=$_SESSION['set_plan_id']):
    die('Invalid Format');
endif;
$abstract_images = AbstractCostImage::find_by_plan_id($_GET['id']);
?>
<?php include("menuincludes/header.php"); ?>
<title>योजनाको कुल लागत अनुमान </title>

<body>

    <?php include("menuincludes/topwrap.php"); ?>

    <div class="maincontent">
        <h2 class="headinguserprofile myHeadingone">योजनाको इष्टिमेटको कुल लागत अनुमान | <a class="btn"
                href="estimatedashboard.php" class="btn"> पछि जानुहोस </a></h2>


        <div class="OurContentFull title_wrap">
            <div class="myMessage"><?php echo $message;?>
            </div>
            <h1 class="myHeading1">दर्ता न :<?=convertedcit($_GET['id'])?>
            </h1>
            <div class="userprofiletable">

                <?php $data = Plandetails1::find_by_id($_GET['id']);?>

                <div>
                    <h3 class="myHeading3"><?php echo $data->program_name; ?>
                    </h3>
                    <form method="post" enctype="multipart/form-data">
                        <h3 class="myHeading3">योजनाको इष्टिमेटको कुल लागत अनुमान
                        </h3>
                        <table class="table table-hover">
                            <tr>
                                <th>इमेज विवरण</th>
                                <td>
                                    <input type="text" required name="title" />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    इष्टिमेटको इमेज
                                </th>
                                <td>
                                    <input type="file" accept="image/*" name="estimate" required>
                                </td>
                                <td>
                                    <input class="btn" type="submit" name="submit" value="सेभ गर्नुहोस">
                                </td>
                            </tr>
                        </table>
                        <input type="hidden" name="type"
                            value="<?= $check_plan ?>">
                    </form>
                    <table class="table table-fixed table-bordered table-responsive myWidth100 myFont10">
                        <tr>
                            <th>सि.नं.</th>
                            <th>इमेज विवरण</th>
                            <th>इमेज</th>
                            <th></th>
                        </tr>
                        <?php
                        $count = 1;
                        foreach ($abstract_images as $image):
                            ?>
                        <tr>
                            <td><?php echo $count ?>
                            <td><?php echo $image->title ?>
                            </td>
                            <td>
                                <a target="_blank"
                                    href="<?php echo $image->image ?>"><img
                                        src="<?php echo $image->image ?>"
                                        height="150"></a>
                            </td>
                            <td></td>
                        </tr>
                        <?php
                        $count++;
                        endforeach; ?>
                    </table>
                </div>
                <div id="dialog_show" class="modal show" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                </div><!-- main menu ends -->
            </div>
        </div>
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php");
