<?php require_once("includes/initialize.php");
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
if (!isset($_GET['id']) && isset($_SESSION['set_plan_id'])) {
    redirectUrl();
}
$ward_address = WardWiseAddress();
$address = getAddress();
$datas = Bankinformation::find_all();
$workers = Workerdetails::find_by_sql("select * from worker_details where id = 1");
$url = get_base_url(1);
$print_history = PrintHistory::find_by_url_and_plan_id($url, $_GET['id']);
$quotation_more_details = Amanat_more_details::find_by_plan_id($_GET['id']);
$quotation_enlist = AmanatLagat::find_by_plan_id($_GET['id']);
$count = count($quotation_enlist);
?>
<?php include("menuincludes/header.php"); ?>

<!-- js ends -->
<title>आमन्त :: <?php echo SITE_SUBHEADING; ?></title>
<style>
    #div_new{
        background-image: url("images/nepali_paper.jpg");
    }
</style>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</head>

<body>
<?php include("menuincludes/topwrap.php"); ?>
<div id="body_wrap_inner">
    <div class="maincontent" id="div_new">
        <h2 class="headinguserprofile">बैंक रेकोर्ड | <a href="quotationDashboard.php" class="btn">पछि जानुहोस</a></h2>

        <div class="OurContentFull">


            <?php

            $data = Costumerassociationdetails0::find_by_plan_id($_GET['id']);
            $data1 = Plandetails1::find_by_id($_GET['id']);
            $data2 = Moreplandetails::find_by_plan_id($_GET['id']);
            $data3 = Costumerassociationdetails::find_by_post_plan_id(1, $_GET['id']);
            $data3_1 = Costumerassociationdetails::find_by_post_plan_id(2, $_GET['id']);
            $data3_2 = Costumerassociationdetails::find_by_post_plan_id(4, $_GET['id']);
            $fiscal = FiscalYear::find_by_id($data1->fiscal_id);

            
            $print_history = PrintHistory::find_by_url_plan_id_and_letter_type(6,$_GET['id'],'दररेट पेश गर्न कम्पनी/निर्माण व्यवसायीलाई लेखेको पत्र');
            ?>
            <form method="get" action="amanat_samjhauta_patra_final.php?id=<?= $_GET['id'] ?>" target="_blank">
                <div class="text-right"><input type="hidden" name="id" value="<?= $_GET['id'] ?>"/>
                    <input type="hidden" name="bank_id" value="<?= $_GET['bank_id'] ?>"/>
                    <input type="submit" value="प्रिन्ट गर्नुहोस" name="submit"/></div>
                <div class="userprofiletable">
                    <div class="printPage">
                        <div class="printlogo"><img src="images/janani.png" alt="Logo"></div>

                        <h1 class="margin1em letter_title_one"><?php echo SITE_LOCATION; ?></h1>
                        <h4 class="margin1em letter_title_two"><?php echo $address; ?></h4>
                        <h5 class="margin1em letter_title_three"><?php echo $ward_address; ?></h5>
                        <div class="myspacer"></div>
                        <div class="printContent">
                            <div class="mydate">मिति <input type="text" name="date_selected"
                                                            value="<?php echo generateCurrDate(); ?>" id="nepaliDate5"/>
                            </div>
                            <div class="patrano">पत्र संख्या :<?= convertedcit($fiscal->year) ?> </div>
                            <div class="chalanino">योजना दर्ता नं : <?php echo convertedcit($_GET['id']) ?></div>
                            <div class="chalanino">च न. :</div>
                            <div class="subject"><u>विषय:- सम्झौता-पत्र |</u></div>
                            <div class="myspacer20"></div>
                            <div class="banktextdetails">
                                यस कार्यालयको स्वीकृत बार्षिक कार्यक्रम अनुसार तपसिलको योजना संचालन गर्न आज भएको यस संझौता पत्र अनुसार 
                                पहिलो पक्ष श्री <strong>
                                    <?=SITE_LOCATION;?>
                                </strong> र दोश्रो पक्ष श्री  
                                <strong><?=$quotation_more_details->organizer_name?></strong>
                                विच उल्लेखित शर्तहरु पालना गर्ने गरी यो संझौता गरि लियौं दियौं ।
                            </div>
                            <div class="myspacer"></div>
                            <div class="text-center"><strong><u>तपसिल </u></strong></div>
                            <table class="table table-bordered table-responsive">
                                <tr>
                                    <td>विनियोजित श्रोत र व्याख्या</td>
                                    <td><?=$data1->parishad_sno?></td>
                                </tr>
                                <tr>
                                    <td>योजनाको नाम</td>
                                    <td><?=$data1->program_name?></td>
                                </tr>
                                <tr>
                                    <td>आयोजना सचालन हुने स्थान / वार्ड नं</td>
                                    <td><?=SITE_LOCATION?> - <?=convertedcit($data1->ward_no)?></td>
                                </tr>
                                <tr>
                                    <td>योजनाको बिषयगत क्षेत्रको नाम</td>
                                    <td><?=Topicarea::getName($data1->topic_area_id)?></td>
                                </tr>
                                <tr>
                                    <td>विनियोजनको किसिम</td>
                                    <td><?=Topicareainvestment::getName($data1->topic_area_investment_id)?></td>
                                </tr>
                                <tr>
                                    <td>योजनाको शिर्षकगत नाम</td>
                                    <td><?=Topicareatype::getName($data1->topic_area_type_id)?></td>
                                </tr>
                                <tr>
                                    <td>योजनाको उपशिर्षकगत नाम</td>
                                    <td><?=Topicareatypesub::getName($data1->topic_area_type_sub_id)?></td>
                                </tr>
                                <tr>
                                    <td>योजनाको अनुदानको किसिम</td>
                                    <td><?=Topicareaagreement::getName($data1->topic_area_agreement_id)?></td>
                                </tr>
                            </table>
                            <div class="myspacer"></div>
                            <div class="text-center"><h2>योजना संचालन विवरण</h2></div>
                            <div class="myspacer"></div>
                            <table class="table table-bordered table-responsive">
                                <tr>
                                    <td>योजनाको विनियोजित बजेट रु:</td>
                                    <td><?=convertedcit($data1->investment_amount)?>/-</td>
                                </tr>
                                <tr>
                                    <td>कार्यादेश दिईएको रकम रु:</td>
                                    <td><?=convertedcit($quotation_enlist->total_investment)?>/-</td>
                                </tr>
                                <tr>
                                    <td>योजनाको शुरु हुने मिति:</td>
                                    <td><?=convertedcit($quotation_more_details->yojana_start_date)?></td>
                                </tr>
                                <tr>
                                    <td>योजना सम्पन्न हुने मिति :</td>
                                    <td><?=convertedcit($quotation_more_details->yojana_sakine_date)?></td>
                                </tr>
                                <tr>
                                    <td>योजना संचालन हुने स्थान:</td>
                                    <td><?=SITE_LOCATION?> - <?=convertedcit($data1->ward_no)?></td>
                                </tr>
                            </table>
                            <div class="myspacer"></div>
                            <div class="text-center">
                            <h2>योजनाबाट लाभान्वित घरधुरी तथा परिवारको विवरण</h2>
                            </div>
                            <div class="myspacer"></div>
                            <table class="table table-bordered table-responsive">
                                <div class="text-center"><strong>लाभान्वित जनसंख्या</strong></div>
                                <thead>
                                    <th>घर परिवार संख्या</th>
                                    <th>महिला</th>
                                    <th>पुरुष</th>
                                    <th>जम्मा</th>
                                </thead>
                                <tbody>
                                    <td><?=convertedcit($quotation_more_details->pariwar_population)?></td>
                                    <td><?=convertedcit($quotation_more_details->female)?></td>
                                    <td><?=convertedcit($quotation_more_details->male)?></td>
                                    <td><?=convertedcit($quotation_more_details->male + $quotation_more_details->female)?></td>
                                </tbody>
                            </table>
                            <div class="myspacer"></div>
                            
                            <div class="text-center"><strong>
                            <h2>सम्झौताको शर्तहरु </h2>
                            </strong></div>
                            <div class="myspacer"></div>
                                <ul>
                                    १. ग्रेवल वडा भरी  योजना मिति 
                                    <strong><?=convertedcit($quotation_more_details->yojana_start_date)?></strong> 
                                    देखि शुरु गरी मिति 
                                    <strong><?=convertedcit($quotation_more_details->yojana_sakine_date)?></strong>
                                    सम्ममा पुरा गर्नु पर्नेछ ।<br>
                                    २. दोश्रो पक्षले निर्माण कार्य गर्दा लाग्ने सम्पुर्ण गुणस्तरिय समानहरुको प्रयोग प्राबिधिकबाट जचाँएर मात्र प्रयोग गर्नु पर्नेछ ।<br>
                                    ३. दोश्रो पक्षले निर्माण कार्यमा बाल श्रमिकको प्रयोग गर्न पाईने छैन । <br>
                                    ४. यस संझौता अबधिमा काममा कुनै समस्या उत्पन्न भएमा दुबै पक्षको सहमितमा समाधान गरिने छ । <br>
                                    ५. कार्य सम्पन्न भई सकेपछि सम्बन्धित प्राविधिक मुल्यांकन प्रतिवेदन, वडा कार्यालयको सिफारिस, भुक्तानी मागको निवेदन, योजनाको चरणवध्द फोटो, अनुगमन समितिको प्रतिवेदन, बिल भरपाई एवं  अन्य आवश्यक कागजातको आधारमा प्रथम पक्षले दोस्रो पक्षलाई प्राविधिक मुल्यांकनको अनुसार कार्यादेश रकमको सिमाभित्र रही मु.अ.कर सहित उपलब्ध गराउने छ।<br> 
                                    ६. भुक्तानी गर्दा प्रथम पक्षले नियमानुसार नेपाल सरकार र उपमहानगरपालिकाले तोके बमोजिमको कर कट्टी गरेर मात्र भुक्तानी गर्नेछ । सर्पदंश शुल्क वापत ०.५ % कट्टी गरिनेछ। अन्य नियमानुसार वा अन्य निकायलाई कुनै शुल्क वा जरिवाना बुझाउनु परेमा स्वयं दोस्रो पक्षले बेहोर्नु पर्नेछ ।<br>
                                    ७. यस संझौतामा उल्लेख नभएका कुराहरु सार्वजनिक खरिद ऐन,२०६३ नियमावली,२०६४ र जीतपुरसिमरा उपमहानगरपालिकाको सार्वजनिक खरिद नियमावली २०७६ बमोजिम हुनेछ ।<br>
                                </ul>
                                
                            </div>
                            <hr>
                            <div class="text-center"><i>माथि उल्लेख भए बमोजिमका शर्तहरु पालना गर्न हामी निम्न पक्षहरु मन्जुर गर्दछौं ।</i></div>
                            <hr>
                            <div class="myspacer"></div>
                            <div class="text-center">
                                <h2>फर्म कम्पनीको तर्फबाट</h2>
                            </div>
                            <table class="table table-bordered table-responsive">
                                <thead>
                                    <tr>
                                        <td colspan="2" class="text-center">योजना / कार्यक्रम संचालन गर्ने </td>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>नाम:</td>
                                    <td><?=$quotation_more_details->organizer_name?></td>
                                </tr>
                                <tr>
                                    <td>ठेगाना:</td>
                                    <td><?=$quotation_more_details->organizer_name_address;?></td>
                                </tr>
                                <tr>
                                    <td>दस्तखत:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>मिति:</td>
                                    <td><?=convertedcit($quotation_more_details->yojana_samjhauta_date)?></td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="myspacer"></div>
                            <div class="text-center">
                                <h2>कार्यलयको तर्फबाट</h2>
                            </div>
                            <table class="table table-bordered table-responsive">
                                <thead>
                                <tr>
                                    <th>सि.नं</th>
                                    <th>पद</th>
                                    <th>नामथर</th>
                                    <th>दस्तखत</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($workers as $workers):
                                        endforeach;
                                    ?>
                                <tr>
                                    <td>१.</td>
                                    <td><?=$workers->post_name?></td>
                                    <td><?=$workers->authority_name?></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>

            </form>
        </div>
        <div class="myspacer"></div>
        </form>
    </div>

    <div class="myspacer"></div>
</div>
<!--<div class="settingsMenu1"><a href="settings_topic_add_sub.php">सह शिर्षक थप्नुहोस +</a></div>-->
</div>
</div>
</div>
</div><!-- main menu ends -->


</div><!-- top wrap ends -->

<?php include("menuincludes/footer.php"); ?>

