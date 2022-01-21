<?php require_once("includes/initialize.php");
//error_reporting(1);
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}

if (isset($_POST['submit'])) {
    $profile = NapiLagatProfile::find_by_plan_id_period($_POST['plan_id'], $_POST['period']);
    if (!$profile) {
        $profile = new NapiLagatProfile;
    }
    $del_lagats = Napilagatanuman::find_by_plan_id_period($_POST['plan_id'], $_POST['period']);
    foreach ($del_lagats as $del_lagat) {
        $del_lagat->delete();
    }
    //   Save the profile first
    $profile->date_nepali  = $_POST['date_nepali'];
    $profile->date_english = DateNepToEng($_POST['date_nepali']);
    $profile->period       = $_POST['period'];
    $profile->antim        = $_POST['antim'];
    $profile->sub_total    = $_POST['sub_total'];
    $profile->plan_id      = $_POST['plan_id'];
    $data->period          = $_POST['period'];
    $profile->save();

    $task_count = count($_POST['name']);
    for ($i=0; $i<$task_count; $i++) {
        $data = new Napilagatanuman;
        $data->main_work_name = $_POST['name'][$i];
        $data->break_type = 1;
        $data->total_evaluation = $_POST['quantity_abstract'][$i];
        $data->unit_id = $_POST['unit_id'][$i];
        $data->task_rate = $_POST['rate_abstract'][$i];
        $data->total_rate = $_POST['total_abstract'][$i];
        $data->plan_id = $_POST['plan_id'];
        $data->sno = $i+1;
        $data->period = $_POST['period'];
        $lagat_anuman_id = $data->save();
    }
}

if (!isset($_GET['id']) && isset($_SESSION['set_plan_id'])) {
    redirectUrl();
}
if ($_GET['id']!=$_SESSION['set_plan_id']):
    die('Invalid Format');
endif;

$update = 0;
$save_text = "सेभ गर्नुहोस";

$units          = Units::find_all();
$sql = "select * from abstract_cost where plan_id=".$_GET['id']." order by id asc";
$abstract_details = AbstractCost::find_by_sql($sql);

include("menuincludes/header.php"); ?>
<title>नापी</title>

<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner">
        <div class="maincontent ">
            <h2 class="dashboard">नापी किताब | <a href="abstract_napi_lagat_dashboard.php" class="btn">पछि जानुहोस </a>
            </h2>


            <div class="OurContentFull">
                <div class="myMessage"><?php echo $message; ?>
                </div>
                <h1 class="myHeading1">दर्ता न :<?=convertedcit($_GET['id'])?>
                </h1>
                <div class="userprofiletable">

                    <?php $data = Plandetails1::find_by_id($_GET['id']); ?>

                    <div>
                        <h3 class="myHeading3"><?php echo $data->program_name; ?>
                        </h3>
                        <?php if ($_GET['period']>1):
//                                echo "here"; exit;
                                for ($n=1;$n<$_GET['period'];$n++):
                                     
                                    echo getAbstractNapiView($n);
                                endfor;
                            endif;
                            ?>

                        <?php if (!getAbstractNapiView($_GET['period'])) {// if new napi lagat?>
                        <form method="post" enctype="multipart/form_data">

                            <div class="inputWrap100">
                                <h1>नापी विवरण</h1>
                                <div class="inputWrap50 inputWrapLeft">
                                    <div class="newInput"><input type="text" name="date_nepali" id="nepaliDate5"
                                            required /></div>
                                </div>
                                <div class="inputWrap50 inputWrapLeft">
                                    <h1>अन्तिम नापी :</h1>
                                    <div class="newInput"><b style="margin-left:230px;">हो </b><input type="radio"
                                            name="antim" value="1" required /> <b style="margin-left:70px;">होइन
                                        </b><input type="radio" name="antim" value="0" required /></div>
                                </div>
                                <div class="myspacer"></div>


                            </div>

                            <table class="table table-fixed table-bordered table-responsive myWidth100 myFont10 "
                                id="tableFixHead">
                                <thead>
                                    <tr>
                                        <th>सि.नं.</th>
                                        <th colspan="3">विवरण</th>
                                        <th>परिमाण</th>
                                        <th>इकाई</th>
                                        <th>दर</th>
                                        <th>जम्मा लागत रु.</th>
                                        <th></th>
                                    </tr>
                                </thead>

                                <tbody id="abstract_table">
                                    <?php
                                    $count = 1;
                                    $total=0;
                                    foreach ($abstract_details as $lagat_detail):
                                ?>
                                    <tr>
                                        <td><?=$count?>
                                        </td>
                                        <td colspan="3"><textarea cols="30" rows="3"
                                                name="name[]"><?=$lagat_detail->name?></textarea>
                                        </td>
                                        <td><input data-id=<?=$count?>
                                            class="quantity" id="quantity-<?=$count?>" type="text"
                                            name="quantity_abstract[]"
                                            value="<?=$lagat_detail->quantity?>"
                                            class="myWidth100" /></td>
                                        <td><select
                                                id="unit-<?=$count?>"
                                                name="unit_id[]">
                                                <option value="">----</option>
                                                <?php foreach ($units as $unit): ?>
                                                <option
                                                    value="<?=$unit->id?>"
                                                    <?php if ($lagat_detail->unit_id==$unit->id) {?>
                                                    selected="selected"<?php } ?>><?=$unit->name?>
                                                </option>
                                                <?php endforeach; ?>
                                        </td>
                                        <td><input data-id=<?=$count?>
                                            id="rate-<?=$count?>"
                                            class="rate"
                                            type="text" name="rate_abstract[]" class="myWidth100"
                                            value="<?=$lagat_detail->rate+0?>" />
                                        </td>
                                        <td><input readonly class="total"
                                                id="total-<?=$count?>"
                                                type="text" name="total_abstract[]" class="myWidth100"
                                                value="<?=$lagat_detail->total+0?>" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <?php $count++; $total+=$lagat_detail->total; endforeach; ?>
                                    <tr>

                                        <input type="hidden" name="update"
                                            value="<?=$update?>" />
                                        <input type="hidden" name="plan_id"
                                            value="<?=$_GET['id']?>" />
                                        <input type="hidden" name="period"
                                            value="<?=$_GET['period']?>" />
                                        <td colspan="6"></td>
                                        <td> <input type="submit" name="submit"
                                                value="<?=$save_text?>"
                                                class="btn"></td>
                                        <td colspan="6"><input id="sub_total" name="sub_total"
                                                value="<?=$total?>"
                                                type="text">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <?php } else {
                                    echo getAbstractNapiView($_GET['period']);
                                } ?>
                    <div id="dialog_show" class="modal show" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">


                    </div><!-- main menu ends -->

                </div><!-- top wrap ends -->
                <script>
                    JQ(document).ready(function() {
                        JQ(document).on('input', '.quantity,.rate', function() {
                            var id = +JQ(this).attr('data-id');
                            var rate = +JQ(`#rate-${id}`).val();
                            var quantity = +JQ(`#quantity-${id}`).val();
                            JQ(`#total-${id}`).val(quantity * rate);
                            var total = 0;
                            JQ('.total').each(function() {
                                total += +JQ(this).val();
                            });
                            JQ('#sub_total').val(total);
                        });
                    });
                </script>
                <?php include("menuincludes/footer.php");
