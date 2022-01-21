<?php require_once("includes/initialize.php");
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
error_reporting(1);
$mode = getUserMode();
if ($mode != "administrator" && $mode != "superadmin" && $mode !="user") {
    die("ACCESS DENIED");
} ?>

<?php include("menuincludes/header.php"); ?>
    <!-- js ends -->
<title>सेटिंग :: <?php echo SITE_SUBHEADING; ?></title>
<style>
#rcorners1 {
  border-radius: 25px;
  background: #4682B4;
  padding: 20px; 
  width: 220px;
  height: 120px; 
  color: white;
}
</style>
</head>
    <body>
<?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner">
        <div class="maincontent">
            <h2 class="headinguserprofile">सेटिंग | <a href="index.php" class="btn">पछि जानुहोस</a></h2>
            <div class="OurContentFull">
                <div class="dashboardcontent">
                    <?php if($mode=="superadmin"):?>
                    <div class="myspacer"></div>
                    <div class="col-md-12">
                    <div class="row">
                    <div class="col-md-2">
                                    <a href="settings_fiscal.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">आर्थिक वर्ष<br>
                                        <img src="images/n/fiscal.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="settings_topic.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">बिषयगत क्षेत्र<br>
                                        <img src="images/report-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="topic_area_type_view.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">शिर्षकगत किसिम<br>
                                        <img src="images/dataentry-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="topic_area_type_sub_view.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">उपशिर्षकगत किसिम<br>
                                        <img src="images/patra-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="view_topic_area_agreement.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">अनुदानको किसिम<br>
                                        <img src="images/new_plan_icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="view_topic_area_investment.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">विनियोजन किसिम<br>
                                        <img src="images/upabhokta-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="settings_unit.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">भौतिक इकाई<br>
                                        <img src="images/new/kg.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <?php endif;?>
                    <?php if($mode=="superadmin" || $mode=="user"):?>
                    <div class="col-md-2">
                                    <a href="view_post.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">पद<br>
                                        <img src="images/n/post.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="view_worker_details.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">कार्यकारी व्यक्ति<br>
                                        <img src="images/new/karmachari_1.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <?php endif;?>
                    <?php if($mode=="superadmin"):?>
                    <div class="col-md-2">
                                    <a href="view_bank_information.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">बैंक रेकोर्ड<br>
                                        <img src="images/n/bank.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <?php endif;?>
                    <?php if($mode=="superadmin" || $mode=="user"):?>
                    <div class="col-md-2">
                                    <a href="plan_form_view.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">योजना सच्याउनुहोस<br>
                                        <img src="images/new/edit.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <?php endif;?>
                    <?php if($mode=="superadmin"):?>
                    <div class="col-md-2">
                                    <a href="yojana_merge.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">योजना जोड्नुहोस<br>
                                        <img src="images/new/add.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <?php endif;?>
                    <?php if($mode=="superadmin"):?>
                    <div class="col-md-2">
                                    <a href="plan_form_delete.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">योजना हटाउनुहोस्<br>
                                        <img src="images/n/delete.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="program_settings.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">सूची दर्ता<br>
                                        <img src="images/dataentry-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="enlist_usamiti.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">उपभोक्ता सूची दर्ता<br>
                                        <img src="images/new/set.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="settings_upabhokta_samiti_add.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">उपभोक्ता सूचीदर्ता भर्नुहोस्<br>
                                        <img src="images/dataentry-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="kalo_suchi_upabhokta_list.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">कालो सुचिमा पर्ने समिति<br>
                                        <img src="images/dataentry-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="setting_budget_topic.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">बजेट शिर्षक<br>
                                        <img src="images/new/budget.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="setting_budget_topic_profile.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">बजेट रकम<br>
                                        <img src="images/new/rup.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="view_ekmusta_budget.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">एकमुस्ट खर्च प्रबिस्टी<br>
                                        <img src="images/dataentry-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="setting_documents.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">कागजात थप्नुहोस<br>
                                        <img src="images/dataentry-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <?php endif;?>
                    <?php if($mode=="superadmin" || $mode=="user"):?>
                    <div class="col-md-2">
                                    <a href="setting_contractor_details.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">निर्माण व्यवसायी<br>
                                        <img src="images/setting-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <?php endif;?>
                    <?php if($mode=="superadmin"):?>
                    <div class="col-md-2">
                                    <a href="settings_rules.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">सर्त<br>
                                        <img src="images/pen-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="settings_contingency.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">कन्टिनजेन्सी प्रतिशत<br>
                                        <img src="images/new/per.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                        <div class="col-md-2">
                                    <a href="settings_bipat.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">विपत प्रतिशत<br>
                                        <img src="images/new/per.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="settings_marmat_samhar.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">मर्मत प्रतिशत<br>
                                        <img src="images/new/per.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="settings_ward_no.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">वार्ड नं<br>
                                        <img src="images/setting-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="upabhokta_samiti_info.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">कार्यक्रम उपभोक्ता समिति<br>
                                        <img src="images/new/set.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="setting_shrot.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">बजेट स्रोत<br>
                                        <img src="images/new/source.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="settings_katti_wiwarn.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">कट्टी विवरण<br>
                                        <img src="images/new/katti.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="settings_bhautik_lakshya.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">भौतिक लक्ष्य शिर्षक<br>
                                        <img src="images/patra-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="anugaman_samiti_bibaran_view.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">नगरपालिका अनुगमन<br>
                                        <img src="images/patra-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>            
                    <?php endif;?>
                    <?php if($mode=="superadmin" || $mode=="user"):?>
                    <div class="col-md-2">
                                    <a href="letter_indices.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">पत्र अनुक्रमणिका<br>
                                        <img src="images/pen-icon.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <?php endif;?>
                    <div class="col-md-2">
                                    <a href="import.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">दायित्व सार्नुहोस<br>
                                        <img src="images/new/set.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>
                    <div class="col-md-2">
                                    <a href="thekka_dharauti.php" target="_blank">
                                        <p id="rcorners1" class="text-center" style="font-size: 16px;">ठेक्का धरौटी विवरण<br>
                                        <img src="images/new/set.png" alt="Upabhokta Icon" class="dashimg" />
                                    </p>
                                    </a>
                                    </div>                
                    </div>
                    </div>
                </div>
            </div>
        </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>
