<?php require_once("includes/initialize.php");
error_reporting(E_ALL);
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
$fiscal_year_all= Fiscalyear::find_all();
include 'Classes/PHPExcel/IOFactory.php';
if (isset($_POST['submit'])) {
    $file = $_FILES['estimate']['name'];
    move_uploaded_file($_FILES['estimate']['tmp_name'], 'estimate_excel/'.$_FILES['estimate']['name']);
    $filename  = 'estimate_excel/'.$_FILES['estimate']['name'];
    $inputFileName = $filename;
    $objPHPExcel = PHPExcel_IOFactory::load($inputFileName);
    $allDataInSheet = $objPHPExcel->getActiveSheet()->toArray(null, true, true, true);
    $arrayCount = count($allDataInSheet);
    $del_lagats = AbstractCost::find_by_plan_id($_SESSION['set_plan_id']);
    if ($del_lagats) {
        foreach ($del_lagats as $del_lagat) {
            $del_lagat->delete();
        }
    }
    $subtotal = 0;
    $hasEmptyUnit = false;
    // start for loop
    for ($i=2;$i<=($arrayCount);$i++) {
        // check if A, B, C, D, are empty : if empty do nothing
        if (empty(($allDataInSheet[$i]["A"]).($allDataInSheet[$i]["B"]).($allDataInSheet[$i]["C"]).($allDataInSheet[$i]["D"]))) {
            continue;
        }
        if (!empty($allDataInSheet[$i]["B"]) && !empty($allDataInSheet[$i]["C"]) && !empty($allDataInSheet[$i]["D"]) && !empty($allDataInSheet[$i]["E"])) {
            $data = new AbstractCost();
            $data->name = trim($allDataInSheet[$i]["B"]);
            $data->quantity = trim($allDataInSheet[$i]["C"]);
            $unit_id = Units::get_id_by_name_or_alias(trim($allDataInSheet[$i]["D"]));
            if (!empty($unit_id)) {
                $data->unit_id = $unit_id;
            } else {
                $hasEmptyUnit = true;
            }
            $data->rate = trim($allDataInSheet[$i]["E"]);
            $data->total = trim($allDataInSheet[$i]["C"]) * trim($allDataInSheet[$i]["E"]);
            $subtotal += (float)(trim($allDataInSheet[$i]["C"]) * trim($allDataInSheet[$i]["E"]));
            $data->plan_id = $_SESSION['set_plan_id'];
            $data->save();
        }
    }
    $abstract_profile = AbstractProfile::find_by_plan_id($_SESSION['set_plan_id']);
    if ($abstract_profile) {
        $abstract_profile->delete();
    }
    $abstract_profile = new AbstractProfile();
    $abstract_profile->sub_total = $subtotal;
    $abstract_profile->plan_id   = $_SESSION['set_plan_id'];
    $abstract_profile->date_nepali = $_POST['date_nepali'];
    $abstract_profile->save();
    if ($hasEmptyUnit) {
        $session->message("युनिट अपडेट गर्नुहोस। ");
    }
    redirect_to("abstract_of_cost.php");
}
       
  
if (!isset($_GET['id']) && isset($_SESSION['set_plan_id'])) {
    redirectUrl();
}
$check_plan = isset($_SESSION['check_type']) && $_SESSION['check_type'];
$date_nepali = isset($_POST['date_nepali']) && $_POST['date_nepali'];
if ($_GET['id']!=$_SESSION['set_plan_id']):
    die('Invalid Format');
endif;

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
                                <th>मिति</th>
                                <td>
                                    <input type="text" name="date_nepali"
                                        value="<?=$date_nepali?>"
                                        id="nepaliDate3" required />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    इष्टिमेटको Excel
                                </th>
                                <td>
                                    <input type="file" name="estimate" required>
                                </td>
                                <td>
                                    <input class="btn" type="submit" name="submit" value="अप्लोड">
                                </td>
                            </tr>
                        </table>
                        <input type="hidden" name="type"
                            value="<?= $check_plan ?>">
                    </form>
                    <span><a href="sample/abstract_of_cost.xlsx" type="download" class="btn">Download
                            Sample</a></span><br>
                    <center><b>NOTE:</b> <b><u></ब> कृपया ध्यान दिनुहोस ....यदि घटाउने भाग भएमा Remarks मा 1 लेख्नु होला
                                |</u></b></center>
                </div>
                <div id="dialog_show" class="modal show" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                </div><!-- main menu ends -->
            </div>
        </div>
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php");
