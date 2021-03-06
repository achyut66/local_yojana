<?php require_once("includes/initialize.php");
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
if (!isset($_GET['id']) && isset($_SESSION['set_plan_id'])) {
    redirectUrl();
}

$address= getAddress();
?>
<?php $data1=  Plandetails1::find_by_id($_GET['id']);
    $fiscal = FiscalYear::find_by_id($data1->fiscal_id);
    $napi_profile = NapiLagatProfile::find_by_plan_id_period($_GET['id'], $_GET['period']);
    $period_text = getPeriodArray();
?>
<?php include("menuincludes/header.php"); ?>
<title>नापी किताब । print page:: <?php echo SITE_SUBHEADING;?>
</title>

</head>

<body onload="window.print()">
    <div id="body_wrap_inner">
        <div class="maincontent">
            <div class="OurContentFull">
                <div class="mydate myFont10">म.ले.प. फाराम नं १७१</div>
                <div class="userprofiletable" id="div_print">
                    <div class="printPage">
                        <div class="printlogo"><img src="images/emblem_nepal.png" alt="Logo"></div>
                        <h1 class="marginright1 letter_title_one"><?php echo SITE_LOCATION;?>
                        </h1>
                        <h4 class="margin1em letter_title_two"><?php echo $address;?>
                        </h4>
                        <h4 class="margin1em letter_title_three"><?php echo SITE_ADDRESS;?>
                        </h4>
                        <div class="myspacer"></div>
                        <div class="subjectbold1 myCenter letter_subject"><?=$period_text[$napi_profile->period]?> नापी
                            किताब</div>
                        <div class="textdetails">
                            <div class="mydate">मिति : <?=convertedcit($napi_profile->date_nepali)?>
                            </div>
                            <div>आर्थिक बर्ष :- <?=convertedcit($fiscal->year)?>
                            </div>
                            <div>योजनाको नाम :- <?=$data1->program_name?>
                            </div>
                            <div class="mydate">योजना दर्ता नं:- </b> <?=convertedcit($data1->id)?>
                            </div>
                            <div> ठेगाना :- <?=SITE_FIRST_NAME?> -
                                <?=convertedcit($data1->ward_no)?>
                            </div>
                        </div>
                        <div class="printContent">



                            <?php echo getAbstractNapiLetter($_GET['period']); ?>

                            </table>

                            <div class="myspacer30"></div>

                            <div class="oursignature">सदर गर्ने</div>

                            <div class="oursignatureleft mymarginright"> पेश गर्ने </div>
                            <div class="oursignatureleft" style="margin-left:150px;">जाँच गर्ने</div>
                            <div class="myspacer"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- main menu ends -->

    </div><!-- top wrap ends -->
    <?php // include("menuincludes/footer.php");
