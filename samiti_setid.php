<?php require_once("includes/initialize.php"); 
if(!$session->is_logged_in()){ redirect_to("logout.php");}
$user=getUser();
if(isset($_POST['search'])){
    if(!is_numeric($_POST['sn']))
{
    echo alertBox("कृपया नम्बर हल्नुहोस ","samiti_setid.php");
}
 $result= Plandetails1::find_by_id($_POST['sn']);
$check_first= Plantotalinvestment::find_by_plan_id($_POST['sn']);
$check_second=  Contractinfo::find_by_plan_id($_POST['sn']);
 $amanat = AmanatLagat::find_by_plan_id($_POST['sn']);
 $d_activate = DeactivePlan::find_by_plan_id($_POST['sn']);
 if($result->type==1)
{
    echo alertBox("निम्न दर्ता नं कार्यक्रम अन्तर्गत भएकाले यसलाई कार्यक्रम संचालन प्रकिया बाट चलाउनुहोस","samiti_setid.php");
}
if(empty($result))
{
    echo alertBox("निम्न दर्ता नं भेटिएन ..","samiti_setid.php");
}
if(!empty($d_activate)){
    echo alertBox("निम्न दर्ता को योजना निस्क्रिय गरिएको छ!!! -- सम्झौता गर्न असफल !!!","samiti_setid.php");
}
 

 if($result->type==1 || !empty($check_first) || !empty($check_second) || !empty($amanat))
 {
     $result = "";
 }

//print_r($result);exit;
}

if(isset($_GET['id']))
{
  setPlanId($_GET['id']);
  redirect_to("anyasamitidashboard.php");
}
$postnames=  Postname::find_all();
$units = Units::find_all();
?>

<?php include("menuincludes/header.php"); ?>
<title>योजना खोज्नुहोस :: <?php echo SITE_SUBHEADING;?></title>
<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 

        <div class="maincontent">
            <h2 class="headinguserprofile">संस्था / समिति मार्फत योजना खोज्नुहोस | <a href="yojanasanchalandash.php" class="btn">पछि जानुहोस </a></h2>
            
            <div class="OurContentFull">
				<div class="myMessage"><?php echo $message;?></div>
                <h2>योजना खोज्नुहोस </h2>
                <div class="userprofiletable">
               
                      <form  method="post">
                      	<div class="inputWrap">
                        	<div class="titleInput">दर्ता फाराम नं:</div>
                            <div class="newInput"><input type="text" class= "checkInput" name="sn" id="sn" required/></div>
                            <div class="newInput text-center">
                                <!-- <input type="button" id="edit_btn" value="सच्याउनुहोस" class="button btn-success"/> -->
                                <input type="submit" name="search" value="खोज्नुहोस" class="button btn-primary"/></div>
                        	<div class="myspacer"></div>
                        </div><!-- input wrap ends -->
                      	
                    </form>
              </div>
              <?php if(isset($_POST['search'])):?>
              	 <?php if(empty($result)){?>
                 		<h3>No Records Found</h3>
                 <?php } elseif($user->mode=="administrator"||$user->mode=="subadmin" ||$user->mode=="maker"||$user->mode=="superadmin") 
                                {
                                        setPlanId($result->id);
  					redirect_to("anyasamitidasboard.php");  
                                }
                           elseif($user->mode=="user"& $user->ward==$result->ward_no)     
                                { 	
                                    setPlanId($result->id);
                                    redirect_to("anyasamitidasboard.php");
                                }
                                elseif($result->topic_area_id==$user->topic_area_id && $result->topic_area_type_id==$user->topic_area_type_id)
                                {
                                    setPlanId($result->id);
                                    redirect_to("anyasamitidasboard.php");
                                }
                            else
                            {
                                ?>
                                
                                <h3>कृपया आफ्नो वार्ड को मात्र खोज्नुहोस आन्यथा सम्बन्धित निकायमा रिपोर्ट जानेछ !!!!!</h3>
                   
                   <?php } ?>
              <?php endif;?>
                
                  </div>
                </div><!-- main menu ends -->
          
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>
    <script>
        JQ(document).ready(function(){
             JQ(document).on("click","#edit_btn",function() {
                 if (window.confirm('योजना / कार्यक्रम बिबरण सम्पादन गर्नु पर्छ ??'))
                    {
                         var id = JQ("#sn").val();
                         //alert(id);
                       window.location = 'plan_form_edit.php?id='+id;
                        
                    }
                    // else
                    // {
                    //     var id = JQ("#sn").val();
                    //     //alert(id);
                    //     window.location = 'anyasamitidasboard.php';
                    // }
            });
        });
    </script>