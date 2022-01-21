<?php require_once("includes/initialize.php");
error_reporting(1);
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
$user=getUser();
if (isset($_POST['submit'])) {
    if ($_POST['update']==1) {
        // check for role, if maker cannot update
        $invest_details =  Plantotalinvestment::find_by_plan_id($_POST['plan_id']);
        if (!empty($invest_details)) {
            $invest_details->kul_lagat_anuman = $_POST['sub_total'];
        } else {
            $invest_details = new Plantotalinvestment;
            $invest_details->kul_lagat_anuman = $_POST['sub_total'];
            $invest_details->plan_id = $_POST['plan_id'];
        }
        // end
        $invest_details->save();
        $profile = AbstractProfile::find_by_plan_id($_POST['plan_id']);
    // $del_lagats = AbstractCost::find_by_plan_id($_POST['plan_id']);
        // foreach ($del_lagats as $del_lagat) {
        //     $del_lagat->delete();
        // }
    } else {
        $profile = new AbstractProfile;
    }
    $abstract_profile = AbstractProfile::find_by_plan_version($_GET['id']);
    // delete previous version
    $del_lagats = AbstractCost::find_by_plan_version($_POST['plan_id'], $abstract_profile->version);
    if ($user->mode != 'maker' && $profile->in_review == 0 && $profile->sub_total != $_POST['sub_total']) {
    } else {
        foreach ($del_lagats as $del_lagat) {
            $del_lagat->delete();
        }
    }
    $task_count = count($_POST['name']);
    for ($i=0; $i<$task_count; $i++) {
        $data = new AbstractCost;
        $data->name = $_POST['name'][$i];
        $data->quantity = $_POST['quantity_abstract'][$i];
        $data->unit_id = $_POST['unit_id'][$i];
        $data->rate = $_POST['rate_abstract'][$i];
        $data->total = $_POST['total_abstract'][$i];
        $data->plan_id = $_POST['plan_id'];
        // snapshot
        if ($user->mode != 'maker' && $profile->in_review == 0 && $profile->sub_total != $_POST['sub_total']) {
            $data->version = $abstract_profile->version + 1;
        } else {
            $data->version = $abstract_profile->version;
        }
        $lagat_anuman_id = $data->save();
    }


    if ($user->mode != 'maker' && $profile->in_review == 0 && $profile->sub_total != $_POST['sub_total']) {
        $profile->version = $abstract_profile->version + 1;
    }
    $profile->sub_total     = $_POST['sub_total'];
    $profile->plan_id       = $_POST['plan_id'];
    $profile->date_nepali   = $_POST['date_nepali'];
    // maker checker
    if ($user->mode != 'maker') {
        if ($profile->in_review == 1) {
            $profile->approved_by  = $user->name;
        } else {
            $profile->created_by  = $user->name;
            // take snapshot
        }
        $profile->in_review   = 0;
        $profile->approved    = 1;
    } else {
        $profile->in_review   = 1;
        $profile->approved    = 0;
        $profile->created_by  = $user->name;
    }
    $profile->save();
    
    redirect_to("plan_form1.php");
}
if (!isset($_GET['id']) && isset($_SESSION['set_plan_id'])) {
    redirectUrl();
}

if ($_GET['id']!=$_SESSION['set_plan_id']):
    die('Invalid Format');
endif;
$plan_details=Plandetails1::find_by_id($_GET['id']);
$invest_details=Plantotalinvestment::find_by_plan_id($_GET['id']);
$abstract_profile = AbstractProfile::find_by_plan_version($_GET['id']);
$sql = "select * from abstract_cost where plan_id=".$_GET['id']." and version=".$abstract_profile->version." order by id asc";
$abstract_details = AbstractCost::find_by_sql($sql);
if ($abstract_profile->in_review == 1) {
    $update = 1;
    $date_nepali = $abstract_profile->date_nepali;
    $save_text = "एपरोभ गर्नुहोस";
    $view_link = '<a href="abstract_of_cost_view.php" target="_blank" class="btn">इष्टिमेट हेर्नुहोस</a>';
} else {
    if (!empty($abstract_profile) || !empty($abstract_details)) {
        $update = 1;
        $date_nepali = $abstract_profile->date_nepali;
        $save_text = "अपडेट गर्नुहोस";
        $view_link = '<a href="abstract_of_cost_view.php" target="_blank" class="btn">इष्टिमेट हेर्नुहोस</a>';
    } else {
        $date_nepali = "";
        $update = 0;
        $save_text = "सेभ गर्नुहोस";
        $view_link = '';
    }
}
if (empty($abstract_profile)) {
    $abstract_profile = EstimateLagatProfile::setEmptyObjects();
}
$units              = Units::find_all();
?>
<?php include("menuincludes/calculator_header.php"); ?>
<title>योजनाको कुल लागत अनुमान </title>

<body>
    <?php include("menuincludes/topwrap.php"); ?>

    <div class="maincontent">
        <h2 class="headinguserprofile myHeadingone">योजनाको इष्टिमेटको कुल लागत अनुमान | <a class="btn"
                href="estimatedashboard.php" class="btn"> पछि जानुहोस </a> || <a href="abstract_upload.php"
                class="btn">EXCEL UPLOAD</a>|| <a href="abstract_image_upload.php" class="btn">IMAGE UPLOAD</a></h2>


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
                    <form method="post" enctype="multipart/form_data">
                        <h3 class="myHeading3">योजनाको इष्टिमेटको कुल लागत अनुमान | <?=$view_link?>
                        </h3>

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

                            <?php if (empty($abstract_details)) { ?>
                            <tbody id="abstract_table">

                                <tr>
                                    <td>1</td>
                                    <td colspan="3">
                                        <textarea cols="30" rows="3" name="name[]">
                                        </textarea>
                                    </td>
                                    <td>
                                        <input data-id=1 class="quantity" id="quantity-1" type="text"
                                            name="quantity_abstract[]" class="myWidth100" />
                                    </td>
                                    <td>
                                        <select id="unit-1" name="unit_id[]">
                                            <option value="">----</option>
                                            <?php foreach ($units as $unit): ?>
                                            <option
                                                value="<?=$unit->id?>">
                                                <?=$unit->name?>
                                            </option>
                                            <?php endforeach; ?>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="text" data-id=1 class="rate" id="rate-1" name="rate_abstract[]"
                                            class="myWidth100" />
                                    </td>
                                    <td>
                                        <input type="text" data-id=1 class="total" id="total-1" name="total_abstract[]"
                                            class="myWidth100" />
                                    </td>
                                    <td></td>
                                </tr>
                                <?php } else { ?>
                            <tbody id="abstract_table">
                                <?php
                                    $count = 1;
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
                                    <td><select id="unit-<?=$count?>"
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
                                <?php $count++; endforeach; ?>
                                <?php } ?>
                            </tbody>
                        </table>
                        <?php
                            if (!($user->mode == 'maker' && $abstract_profile->in_review == 1)) {
                                ?>
                        <table class="myWidth100">
                            <tr>
                                <td class="myCenter">
                                    <div class="add_abstract btn">थप्नुहोस </div>
                                </td>
                                <td class="myCenter">
                                    <div class="remove_abstract btn">हटाउनुहोस् </div>
                                    <input type="hidden" name="update"
                                        value="<?=$update?>" />
                                    <input type="hidden" name="plan_id"
                                        value="<?=$_GET['id']?>" />
                                </td>
                                <td class="myCenter"><input type="submit" name="submit"
                                        value="<?=$save_text?>"
                                        class="btn"></td>
                                <td class="myCenter"><input type="text" name="date_nepali"
                                        value="<?=$date_nepali?>"
                                        id="nepaliDate3" required /></td>
                            </tr>
                        </table>
                        <?php
                            } ?>
                        <table class="table table-bordered table-responsive myWidth100 myFont10">
                            <tr>
                                <td colspan="10" id="task_name-1" style="text-align: right;"><?=SITE_TYPE?>बााट अनुदान</td>
                                <td><input readonly="true" type="text"
                                        value="<?php echo $invest_details->agreement_gauplaika ? $invest_details->agreement_gauplaika : $plan_details->investment_amount?>" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10" id="task_name-1" style="text-align: right;">कार्यदेश दिएको रकम</td>
                                <td><input type="text" readonly="true"
                                        value="<?=$invest_details->bhuktani_anudan?>" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10" id="task_name-1" style="text-align: right;">उपभोक्ताबाट जनश्रमदान
                                </td>
                                <td><input type="text" readonly="true"
                                        value="<?=$invest_details->costumer_investment?>" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10" id="task_name-1" style="text-align: right;">कुल लागत अनुमान जम्मा
                                </td>
                                <td>
                                    <input type="text" readonly="true" name="sub_total" readonly="true"
                                        value="<?=$abstract_profile->sub_total?>"
                                        id="sub_total" />
                                </td>
                            <tr>
                            <tr>
                                <td colspan="10" id="task_name-1" style="text-align: right;">कन्टिन्जेन्सी</td>
                                <td><input readonly="true" type="text"
                                        value="<?=$invest_details->contingency?>" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10" id="task_name-1" style="text-align: right;">मर्मत संहार</td>
                                <td><input type="text" readonly="true"
                                        value="<?=$invest_details->marmat?>" />
                                </td>
                            </tr>
                            </tr>
                            </tr>
                        </table>

                    </form>
                </div>

            </div>
        </div>
    </div>
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
            JQ(document).on('click', '.add_abstract', function() {
                var count = JQ('.total').length + 1;
                var units = document.getElementById('unit-1').innerHTML;
                units = units.replace('selected="selected"', '');
                JQ('#abstract_table').append(`
                <tr>
                    <td>${count}</td>
                    <td colspan="3">
                        <textarea cols="30" rows="3" name="name[]">
                        </textarea>
                    </td>
                    <td>
                        <input data-id=${count} class="quantity" id="quantity-${count}" type="text"
                            name="quantity_abstract[]" class="myWidth100" />
                    </td>
                    <td>
                        <select name="unit_id[]">
                            ${units}
                        </select>
                    </td>
                    <td>
                        <input type="text" data-id=${count} class="rate" id="rate-${count}" name="rate_abstract[]"
                            class="myWidth100" />
                    </td>
                    <td>
                        <input type="text" data-id=${count} class="total" id="total-${count}" name="total_abstract[]"
                            class="myWidth100" />
                    </td>
                    <td></td>
                </tr>
                `);
            });

            JQ(document).on('click', '.remove_abstract', function() {
                JQ('#abstract_table').children().last().remove();
                var total = 0;
                JQ('.total').each(function() {
                    total += +JQ(this).val();
                });
                JQ('#sub_total').val(total);
            });
        });
    </script>
    <?php include("menuincludes/footer.php");
