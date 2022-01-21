<?php require_once("includes/initialize.php");
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
if (!isset($_GET['id']) && isset($_SESSION['set_plan_id'])) {
    redirectUrl();
}
$plan_selected = Plandetails1::find_by_id($_GET['id']);
// print_r($plan_selected);
if (isset($_POST['submit'])) {
    // echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
    // उपभोक्ता समिति  सम्बन्धी विवरण 
    if ($_POST['update'] == 1) {
        $data = Samiticostumerassociationdetails0::find_by_plan_id($_POST['plan_id']);
        $delete_details = Samiticostumerassociationdetails::find_by_plan_id($_POST['plan_id']);
        foreach ($delete_details as $delete_detail) {
            $delete_detail->delete();
        }
    } else {
        $data = new Samiticostumerassociationdetails0();
    }
    $data->program_organizer_group_name = $_POST['program_organizer_group_name'];
    $data->program_organizer_group_address = $_POST['program_organizer_group_address'];
    $data->plan_id = $_POST['plan_id'];
    $data->created_date = date("Y-m-d", time());
    $data->save();

    for ($i = 0; $i < count($_POST['cit_no']); $i++) {
        $data1 = new Samiticostumerassociationdetails();
        $data1->plan_id = $_POST['plan_id'];
        $data1->post_id = $_POST['post_id_0'][$i];
        $data1->name = $_POST['name'][$i];
        $data1->address = $_POST['address'][$i];
        $data1->gender = $_POST['gender'][$i];
        $data1->cit_no = $_POST['cit_no'][$i];
        $data1->issued_district = $_POST['issued_district'][$i];
        $data1->mobile_no = $_POST['mobile_no'][$i];
        $data1->created_date = date("Y-m-d", time());
        $data1->save();
    }
    redirect_to("samiti_plan_form1_3.php");
}
if (isset($_POST['search'])) {
    if (empty($_POST['sn'])) {
        $sql = "select * from plan_details1 where program_name LIKE '%" . $_POST['program'] . "%'";
    } else {
        $sql = "select * from plan_details1 where id='" . $_POST['sn'] . "'";
    }
    $result = Plandetails1::find_by_id($_POST['sn']);
//print_r($result);exit;
}
$postnames = Postname::find_all();
if (isset($_GET['id'])) {
    $group_heading = Samiticostumerassociationdetails0::find_by_plan_id($_GET['id']);
    // print_r($group_heading);
    $group_details = Samiticostumerassociationdetails::find_by_plan_id($_GET['id']);
    $value = "सेभ गर्नुहोस";
    $update = 0;
    if (!empty($group_heading) || !empty($group_details)) {
        $value = "अपडेट गर्नुहोस";
        $update = 1;
    }
    if (empty($group_heading)) {
        $group_heading = Samiticostumerassociationdetails0::setEmptyObjects();
    }
}
//echo "<pre>"; print_r($data); echo "</pre>"; exit;
?>
<?php include("menuincludes/header.php"); ?>
    <title> <?= $plan_selected->program_name ?> :: <?php echo SITE_SUBHEADING; ?> </title>
    <style>
                          table {
                            width: 100%;
                            border: none;
                          }
                          th, td {
                            padding: 8px;
                            text-align: left;
                            border-bottom: 3px solid #ddd;
                          }
                          tr:nth-child(even) {background-color: #f2f2f2;}
                          tr:hover {background-color:#f5f5f5;}
                        </style>
    <body>
<?php include("menuincludes/topwrap.php"); ?>
<div id="body_wrap_inner">
    <div class="maincontent">
        <div class="OurContentFull">
            <div class="myMessage"><?php echo $message; ?></div>
            <h2 class="headinguserprofile">समिति सम्बन्धी विवरण | <a href="anyasamitidasboard.php" class="btn">पछि
                    जानुहोस</a></h2>
            <h1 class="myHeading1">दर्ता न :<?= convertedcit($_GET['id']) ?></h1>
            <h2><?= $plan_selected->program_name ?></h2>
            <div class="userprofiletable">
                <?php if (!isset($_GET['id'])){ ?>
                    <form method="post">
                        <div class="inputWrap">
                            <div class="titleInput">योजनाको नाम:</div>
                            <div class="newInput"><input type="text" name="program"/></div>
                            <div class="titleInput"> दर्ता फाराम नं:</div>
                            <div class="newInput"><input type="text" name="sn"/></div>
                            <div class="saveBtn myWidth100"><input type="submit" name="search" value="SEARCH"
                                                                   class="btn"/></div>
                            <div class="myspacer"></div>
                        </div><!-- input wrap ends -->
                    </form>
                    <?php if (isset($_POST['search'])): ?>
                        <table class="table table-bordered">
                            <tr>
                                <th>दर्ता फाराम नं</th>
                                <th>योजनाको नाम</th>
                            </tr>
                            <tr>
                                <td><?php echo $result->sn; ?></td>
                                <td>
                                    <a href="plan_form1_1.php?id=<?php echo $result->id; ?>"><?php echo $result->program_name; ?></a>
                                </td>
                            </tr>
                        </table>

                    <?php endif; ?>
                <?php } else { ?>
                <?php $data = Plandetails1::find_by_id($_GET['id']);

                $fiscal = FiscalYear::find_by_id($data->fiscal_id);
                ?>
                <h3 class="myheader"> योजनाको विवरण</h3>
                <div class="mycontent" style="display:none;">
                    <table class="table table-bordered table-responsive">

                        <tr>
                            <td class="myWidth50">आर्थिक वर्ष :</td>
                            <td><?php echo convertedcit($fiscal->year); ?></td>
                        </tr>
                        <tr>
                            <td>दर्ता नं :</td>
                            <td><?php echo convertedcit($data->id); ?></td>
                        </tr>
                        <tr>
                            <td>योजनाको नाम :</td>
                            <td><?php echo $data->program_name; ?></td>
                        </tr>
                        <tr>
                            <td>योजनाको बिषयगत क्षेत्रको नाम :</td>
                            <td><?php echo Topicarea::getName($data->topic_area_id); ?></td>
                        </tr>
                        <tr>
                            <td>योजनाको शिर्षकगत नाम :</td>
                            <td><?php echo Topicareatype::getName($data->topic_area_type_id); ?></td>
                        </tr>
                        <tr>
                            <td>योजनाको उपशिर्षकगत नाम :</td>
                            <td><?php echo Topicareatypesub::getName($data->topic_area_type_sub_id); ?></td>
                        </tr>
                        <tr>
                            <td>योजनाको अनुदानको किसिम :</td>
                            <td><?php echo Topicareaagreement::getName($data->topic_area_agreement_id); ?></td>
                        </tr>
                        <tr>
                            <td>योजनाको विनियोजन किसिम :</td>
                            <td><?php echo Topicareainvestment::getName($data->topic_area_agreement_id); ?></td>
                        </tr>


                        <tr>
                            <td>योजना सचालन हुने स्थान :</td>
                            <td><?php echo SITE_LOCATION; ?>- <?php echo convertedcit($data->ward_no); ?></td>

                        </tr>
                        <tr>
                            <td> अनुदान रकम :</td>
                            <td>रु. <?php echo convertedcit($data->investment_amount); ?></td>
                        </tr>
                    </table>
                </div>
                <?php $data = Samitiplantotalinvestment::find_by_plan_id($data->id); ?>
                <h3 class="myheader"> योजनाको कुल लागत अनुमान </h3>
                <div class="mycontent" style="display: none;">
                    <?php
                    if (empty($data)) {
                        echo "योजनाको कुल लागत अनुमान विवरण भरिएको छैन ";
                    } else {
                        $unit = Units::find_by_id($data->unit_id); ?>
                        <table class="table table-bordered table-responsive">


                            <tr>
                                <th class="myWidth50"> भौतिक ईकाईको परिणाम :</th>
                                <td><?= convertedcit($data->unit_total) ?> <?= $unit->name ?></td>
                            <tr>
                                <th><?php echo SITE_TYPE; ?>बाट अनुदान :</th>
                                <td>रु. <?php echo convertedcit($data->agreement_gauplaika); ?></td>
                            </tr>
                            <tr>
                                <th>अन्य निकायबाट प्राप्त अनुदान :</th>
                                <td>रु. <?php echo convertedcit($data->agreement_other); ?></td>
                            </tr>
                            <tr>
                                <th>संस्था / समिति नगद साझेदारी :</th>
                                <td><?php echo convertedcit($data->costumer_agreement); ?></td>
                            </tr>
                            <tr>
                                <th>अन्य साझेदारी :</th>
                                <td><?php echo convertedcit($data->other_agreement); ?></td>
                            </tr>
                            <tr>
                                <th>संस्था / समितिबाट जनश्रमदान :</th>
                                <td>रु. <?php echo convertedcit($data->costumer_investment); ?></td>
                            </tr>
                            <tr>
                                <th>कुल लागत अनुमान जम्मा :</th>
                                <td>रु. <?php echo convertedcit($data->total_investment); ?></td>
                            </tr>

                        </table>
                    <?php } ?>
                </div>
                <div>
                    <form method="post" enctype="multipart/form_data">

                        <h3>समिति सम्बन्धी विवरण </h3>

                        <table class="table table-bordered table-responsive">

                            <input type="hidden" name="plan_id" value="<?php echo $_GET['id']; ?>"/>
                            <tr>
                                <td class="myWidth50"><strong>योजनाको संचालन गर्ने संस्था / समितिको नाम:</strong></td>
                                <td><input type="text" name="program_organizer_group_name"
                                           value="<?= !empty($group_heading->program_organizer_group_name) ? $group_heading->program_organizer_group_name : $plan_selected->program_name . " " . SITE_SAASTHA; ?>"
                                           class="input100percent"/></td>
                            </tr>
                            <tr>
                                <td><strong>ठेगाना:</strong></td>
                                <td><h5><?php echo SITE_LOCATION; ?></h5> <strong>वार्ड नम्बर :</strong>
                                    <input type="text" name="program_organizer_group_address" id="ward" value=
                                    "<?php if(!empty($group_heading->program_organizer_group_address)){
                                    echo $group_heading->program_organizer_group_address;
                                    }else{
                                    echo $plan_selected->ward_no;
                                    }?>">
                                </td>
                            </tr>
                        </table>
                        <div class="text-center"><h2>समिति सदस्य विवरण भर्नुहोस्</h2></div>
                        <div class="myspacer"></div>
                        <table class="detail_post table table-bordered table-responsive">
                            <tr>
                                <th class="thWidth5">सि.नं</th>
                                <th class="thWidth17">पदाधिकारीको नाम/थर</th>
                                <th class="thWidth17">पद</th>
                                <th class="thWidth17">मोबाइल नं</th>
                            </tr>
                            <?php if (empty($group_details)) { ?>
                                <tr>
                                    <td>1</td>
                                    <td><input type="text" name="name[]" required class="input100percent"/></td>
                                    <td><input type="text" name="cit_no[]" required class="input100percent"/></td>
                                    <td><input type="text" name="mobile_no[]" required class="input100percent"/></td>
                                </tr>
                            <?php } else { ?>
                                <?php $i = 1;
                                foreach ($group_details as $group_detail): ?>

                                    <tr <?php if ($i != 1) { ?> class="remove_post_detail" <?php } ?>>
                                        <td><?= $i ?></td>

                                        <td><input type="text" name="name[]" value="<?= $group_detail->name ?>" required
                                                   class="input100percent"/></td>
                                        <td><input type="text" name="cit_no[]" value="<?= $group_detail->cit_no ?>"
                                                   class="input100percent" required/></td>
                                        <td><input type="text" name="mobile_no[]"
                                                   value="<?= $group_detail->mobile_no ?>" class="input100percent"
                                                   required/></td>
                                    </tr>
                                    <?php $i++; endforeach; ?>
                            <?php } ?>
                        </table>
                        <table id="detail_add_table" class="detail_post table table-bordered table-responsive">
                        </table>
                        <!-- <table class="table table-borderless">
                            <tr>
                                <th>
                                    
                                </th>
                                <th>
                                    
                                </th>
                                <th>
                                    
                                </th>
                            </tr>
                        </table> -->
                        <!-- <div class="container"> -->
                        <div class="col-md-12">
                            <div class="row">
                            <div class="col-md-4">
                                    <div class="text-left">
                                    <input type="button" class="add_more_1 btn-success" value="थप्नुहोस">
                                    </div>
                            </div>
                            <div class="col-md-4">
                                    <div class="text-center">
                                    <input type="button" class="remove_more_1 btn-danger" value="हटाउनुहोस">
                                    </div>
                            </div>
                                    <div class="col-md-4">
                                    <div class="text-right">
                                    <input type="submit" name="submit" value="<?= $value ?>" class="button btn-primary">
                                    </div>
                            </div>
                            </div>
                        </div>
                        <!-- </div> -->
                        <input type="hidden" name="update" value="<?= $update ?>">
                        <div class="spacer"></div>
                    </form>
                    <?php } ?>
                </div>
            </div>
        </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>
    <script>
        JQ(document).on("click",".add_more_1",function() {
            // alert("here");
            var num=JQ(".remove_post_detail").length;
            var counter=num+2;
            var ward = JQ("#ward").val();
            var param = {};
            param.counter= counter;
            param.ward =ward;
            JQ.post('getsamiti_postdetails.php',param,function(res){
                var obj = JSON.parse(res);
                JQ("#detail_add_table").append(obj.html);
            });
            JQ(document).on("click",".remove_more_1",function() {
                JQ('.remove_post_detail').last().remove();


            });
        });
    </script>
