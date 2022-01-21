<?php require_once("includes/initialize.php");
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
$mode=getUserMode();
$max_ward = Ward::find_max_ward_no();

$user = getUser();
$topic_area=  Topicarea::find_all();
$bhautik_lakshya = Bhautik_lakshya::group_all();
$bhautik_lakshya_topics = SettingbhautikPariman::find_all();
$units = Units::find_all();
?>
<?php include("menuincludes/header.php"); ?>

<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner">

        <div class="maincontent">
            <h2 class="headinguserprofile"> बिस्तृत रिपोर्ट हेर्नुहोस | <a href="report_dashboard.php" class="btn">पछि
                    जानुहोस</a></h2>
            <div class="OurContentFull">

                <form method="get">
                    <table class="table table-bordered table-responsive" style="table-layout: auto;table-border:2px;">
                        <tr>
                            <td class="myCenter">किसिम छान्नुहोस्
                                <select name="type" class="form-control">
                                    <option value="">-छान्नुहोस्-</option>
                                    <option value="0">योजना</option>
                                    <option value="1">कार्यक्रम</option>
                                </select>
                            </td>
                            <td class="myCenter" style="width: 220px">
                                <div class="row">
                                    <div class="col-6">
                                        <input type="text" class="form-control" name="date_from" id="nepaliDate3"
                                            placeholder="मिति देखि " />
                                    </div>
                                </div>
                            </td>
                            <td class="myCenter" style="width: 220px">
                                <div class="row">
                                    <div class="col-6 ">
                                        <input type="text" class="form-control" name="date_to" id="nepaliDate4"
                                            placeholder="मिति सम्म " />
                                    </div>
                                </div>
                            </td>

                            <td class="myCenter">

                                <div class="titleInput">वार्ड छान्नुहोस् :</div>
                                <?php if ($mode=="user"):?>
                                <div class="newInput">
                                    <select name="ward_no">
                                        <option
                                            value="<?=$user->ward?>">
                                            <?=convertedcit($user->ward)?>
                                        </option>
                                    </select>
                                </div>
                                <?php else:?>
                                <div class="newInput">
                                    <select name="ward_no">
                                        <option value="">-छान्नुहोस्-</option>
                                        <?php for ($i=1;$i<=$max_ward;$i++):?>
                                        <option value="<?=$i?>">
                                            <i></i>
                                            <?php if ($ward==$i) {
    echo 'selected="selected"';
}?>><?=convertedcit($i)?>
                                        </option>
                                        <?php endfor;?>
                                    </select>
                                </div>
                                <?php endif;?>

                            </td>

                            <td class="myCenter"><input type="submit" name="submit" value="खोज्नुहोस"
                                    class="btn-success" /></td>
                            <td class="myCenter"><a href="view_all_plans.php"><input type="button" class="btn-danger"
                                        value="रद्द गर्नुहोस" /> </a></td>
                        </tr>
                    </table>
                </form>

                <table class="table table-bordered table-responsive" style="table-layout: auto;table-border:2px;">
                    <tr>
                        <th>भौतिक लक्ष्यको शिर्षक</th>
                        <td>परिमाण</td>
                        <td>भौतिक इकाई</td>
                        <td>काम सम्पन्न</td>
                        <td>प्रगती (%)</td>
                        <td></td>
                    </tr>
                    <?php
                    $data = [];
                    foreach ($bhautik_lakshya_topics as $blt) {
                        $data[$blt->id] = $blt;
                    } ?>
                    <?php
                        foreach ($bhautik_lakshya as $bl) {
                            //print_r($bl);?>
                    <tr>
                        <td><?php print_r($data[$bl->details_id]->name); ?>
                        </td>
                        <td><?=$bl->qty?>
                        </td>
                        <td>
                            <?php foreach ($units as $unit):
                            if ($unit->id==$bl->unit_id) {
                                echo $unit->name;
                            }
                            endforeach; ?>
                            <!-- <?=$bl->unit_id?> -->
                        </td>
                        <td><?=$bl->prev_qty?>
                        </td>
                        <td><?php echo round($bl->prev_qty/$bl->qty*100, 2) ?>%
                        </td>
                        <td><progress id="progress"
                                value="<?=$bl->prev_qty/$bl->qty*100?>"
                                max="100"> </progress></td>
                    </tr>
                    <?php
                        } ?>
                </table>
            </div>
        </div>
    </div>