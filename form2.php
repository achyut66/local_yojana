<?php require_once("includes/initialize.php");
if(!$session->is_logged_in()){ redirect_to("logout.php");}
//if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
//{
//  redirectUrl();
//}
?>
<?php include("menuincludes/header.php"); ?>
<!-- js ends -->
<title>विषय:- योजना संझौता सम्बन्धमा । print page:: <?php echo SITE_SUBHEADING;?></title>



<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
    	
                
                <div class="maincontent" >
                    <h2 class="headinguserprofile">  <a href="" class="btn">पछि जानुहोस </a></h2>
                    
                    <div class="OurContentFull" >
                    	
                      <div class="myPrint"><a href="" target="_blank">प्रिन्ट गर्नुहोस</a></div>
                        <div class="userprofiletable" id="div_print">
                            <!--    header open-->
                        	<div class="printPage">
                               <div class="head">
                                    <div class="my1">
                                        <img src="images/emblem_nepal.png" alt="Logo">
                                        <p> च. न. १</p>
                                    </div>
                                    <div class="my2">
                                        <div  class="mytitle1"><?=SITE_LOCATION?></div>
                                        <div class="mytitle2"><?=SITE_HEADING?></div>
                                        <div class="mytitle3"> <?=SITE_ADDRESS?> </div>
                                        <!--<div class="">  १ नं. प्रदेश नेपाल </div>-->
                                        <br>
                                        <br>
                                        <b> प्रथम पटक प्रकाशित मिति : २०७५/१/५</b><br>
                                        <b> बोलपत्र / दरभाउपत्र आव्हानको सूचना</b>
                                       
                                        
                                    </div>
                                    <div class="my3">
                        
                                    </div>
                                    <div class="myclear"></div>
                               </div>
                                <!--   letter head close  -->
								
								
								<div class="bankname"> यस आ.व. २०७४ / ०७५ मा तपसिल अनुसारको योजनाहरु को निर्माण कार्य बोलपत्र दरभाउपत्र आह्वान गरी गराउने निर्णय भएको हुदा इजाजत प्राप्त निर्माण व्यवसायीहरु ले यो सुचना प्रकाशित भएको मितिले बोलपत्र ३० औ दिन दरभाउपत्र १५ औ दिन भित्र खरीदारी ( दरभाउपत्र / दस्तुर पछि फिर्ता नहुने गरि ) विराटनगर महानगरपालिकाको नाममा सिलबन्धी बोलपत्र / दरभाउपत्र दर्ता गराउन सम्बधित सबैको जानकारीको लागि यो सुनना प्रकाशित गरिएको छ ।  </div>
								<center> <b> तपशिल</b></center>
								<table class="table table-responsive table-bordered">
								    <tr>
								        <th class="myCenter"> सि. न. </th>
								        <th class="myCenter"> वडा. नं. </th>
								        <th class="myCenter"> ठे.नं. </th>
								        <th class="myCenter"> कार्य विवरण </th>
								        <th class="myCenter"> मूल्य कर तथा ओभरहेड बाहेक लागत रकम</th>
								        <th class="myCenter"> जमानत बापत धरौटी रकम </th>
								        <th class="myCenter"> दरभाउपत्र दस्तुर </th>
								        <th class="myCenter"> कैफियत </th>
								    
								    </tr>
								    <tr>
								        <td>  </td>
								        <td>  </td>
								        <td>  </td>
								        <td>  </td>
								        <td>  </td>
								        <td>  </td>
								        <td>  </td>
								        <td>  </td>
								    </tr>
								</table>
										<div class="myspacer"></div>
				            </div>
                               <div class="" style="margin:0 20px;">
                                   <ol>
                                       <li> बोलपत्र / दरभाउपत्र खरिद गर्ने अन्तिम मिति सुचना भएको मितिले बोलपत्र ३० औ दिन दरभाउपत्र १५ औ दिन सम्म कार्यालय समय भित्र रहने छ । <br>
                                            उक्त दिन सार्वजनिक विदा परेमा कमश सो भोली पल्ट मान्य हुनेछ । </li>
                                        <li> खरिद गरिएको बोलपत्र ३१ औ दिन र दरभाउपत्र १६ औ दिन दिनको १२ ०० बजे सम्म बिराटनगर महानगरपालिका कार्यालयमा दर्ता गराउन सकिनेछ । दर्ता हुन आएका बोलपत्र दरभाउपत्र सोहि दिन दिनको १४ ०० बजे देखि न.पा कार्यलयमा खोलिने हुदा उक्त समयमा प्रतिनिधि उपस्थित हुनुपर्नेछ । प्रतिनिधि उपस्थित नभएमा पनि बोलपत्र दरभाउपत्र खोलिनेछ । बोलपत्र दरभाउपत्र दर्ता गर्ने दिन सार्वजनिक बिदा परेमा क्रमश सो को भोली पल्ट मान्य हुने </li>
                                        <li> बोलपत्र / दरभाउपत्र साथ कृषि विकाश बैक मुख्य शाखा कार्यालय बिराटनगर स्थित धरौटी खाता नं. ०६०१६०११४५९७३०३२ मा नगद जम्मा गरेको भौचर वा न.पा.लाई मान्य ७५ दिन अबधी को बैक ग्यारटी जमानत पत्र का साथै आ.ब। २०७३ ०७४ साल सम्मको करचुक्ता प्रमाण पत्रको प्रतिलिमि, यसै आ.व.मा नविकरण भएको मु.अ.कर प्रमाण पत्र न. पा. व्यावसायको प्रतिलिपी सलग्न हुनुपर्नेछ ।</li>
                                        <li> बोलपत्र / दरभाउपत्र अंक  र अक्षर महल दुबैमा अनिवार्य लेखिनु पर्छ अकं र अक्षरमा फरक परेमा अक्षरमा लेखिएको लाई मान्यता दिइनेछ  </li>
                                        <li> बोलपत्र / दरभाउपत्र खरिद निवेदनका साथ ठे. इजाजत प्रमाण पत्र भु.क.कर प्रमाण पत्र, न.पा. इजाजत पत्र पेश भएपछि न.पा.को राजश्व शाखामा बोलपत्र दरभाउपत्र दस्तुर बुझाई नगदी रसिद प्राप्त भएपछि योजना शाखाबाट बोलपत्र दरभाउपत्र का सम्पुर्ण कागजात उपलब्ध गराइने छ  </li>
                                        <li> न.पा. कार्यालयबाट उपलब्ध गराइएको कार्य तालिका अनुसार कार्य सम्पन्न गरी सक्नुपर्नेछ । </li>
                                        <li> विडमा / बोलपत्र दरभाउपत्रदाताले अनिवार्य रुपमा आफुले कबोल गरेको रकम लेख्नु पर्नेछ । अन्यथा त्यस्तो बोलपत्र दरभाउपत्र रद्ध गरिने छ । </li>
                                        <li> बोलपत्र / दरभाउपत्र तथा सलग्न कागजातमा टि पेक्स तथा फ्याक्स पेपरको प्रयोग गर्न पाइने छैन । </li>
                                        <li> बोलपत्र / दरभाउपत्र सम्बन्धी अन्य व्यवस्था सार्वजनिक खरिद ऐन २०६३ (सम्सोधन सहित) र सार्वजनिक खरिद नियमावली २०६४ (सम्सोधन सहित) बमोजिम हुनेछ ।  </li>
                                        <li> रितपूर्वक नभएको वा म्याद नाघी आएको बोलपत्र दरभाउपत्र उपर कुनै कारबाही हुने छैन । </li>
                                        <li> बोलपत्र / दरभाउपत्र पूर्ण रुपमा वा आशिक रुपमा स्वीकृत र्ने, नगर्ने वा रद्ध गर्ने अधिकार कार्यालयमा निहित छ । </li>
                                        <li> बोलपत्र / दरभाउपत्र सम्बन्धी अन्य जानकारीको लागि कार्यलय समय भित्र योजना शाखामा सम्पर्क राख्न सकिने छ । </li>
                                   </ol>
                               </div>
                            </div>
                        </div>
                  </div>
                </div><!-- main menu ends -->
           
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>