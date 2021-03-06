<?php require_once("includes/initialize.php"); 
if(!$session->is_logged_in()){ redirect_to("logout.php");}?>
<?php 
   $search_result = array(0=>"",1=>"");
  $search_text=" ";
  $search_ward="";
  $mode = getUserMode();
  if(isset($_GET['submit']))
  {
       $search_text=$_GET['search_text'];
       $search_ward=$_GET['search_ward'];
       if(!empty($search_text))
       {
      $sql="select * from plan_details1 where id=".$search_text;
       }
      $search_result[1] = Plandetails1::find_by_sql($sql);
  }
  if(isset($_GET['type']))
  {
  	$plan_update = Plandetails1::find_by_id($_GET['update_id']);
  	$plan_update->type = 1 - $plan_update->type;
  	$plan_update->save();
  }
(isset($_GET['page_no']))? $page_no=$_GET['page_no'] : $page_no=1;
            if(!isset($_GET['search_text']))
            {
                     $search_result =  Plandetails1::set_page_query($page_no,20,"plan_form_view.php");
                    // print_r//provides result in array
                         $a = $page_no -1;
                         if($page_no>1 && empty($search_result[1])){//empty checks if key 1 of result array is empty
                             $link="plan_form_view.php?page_no=".$a;
                             redirect($link);
                         }
            }         
?>
<?php include("menuincludes/header.php"); ?>
<!-- js ends -->
<title>आयोजनाको विनियोजन श्रोत  :: <?php echo SITE_SUBHEADING;?></title>
</head>
<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
    	<div class="maincontent">
             <h2 class="headinguserprofile">योजना / कार्यक्रम विवरण | <a href="settings.php" class="btn">पछि जानुहोस</a></h2>
                    <div class="OurContentFull">
                        <form method="get" action="">
                        	<div class="inputWrap">
                            	<h1>योजना / कार्यक्रम विवरण</h1>
                                <div class="titleInput">दर्ता नं:</div>
                                <div class="newInput"><input type="text" name="search_text" class="input100percent" value="<?php echo $search_text;?>"/></div>
                                <div class="saveBtn"><input type="submit" name="submit" value="खोज्नुहोस" class="btn" /> | <a class="btn" href="plan_form_delete.php">रद्द गर्नुहोस </a></div>
                            	<div class="myspacer"></div>
                            </div><!-- input wrap ends -->  
					</form>
                     <table class="table table-bordered table-hover table-striped">
                                <tr>   
                                    <td class="myCenter"><strong>दर्ता नं</strong></td>
                                    <td class="myCenter"><strong>नाम</strong></td>
                                    <td class="myCenter"><strong>किसिम</strong></td>
                                    <td class="myCenter"> <strong>बिषयगत क्षेत्रको किसिम</strong></td>
                                    <td class="myCenter"><strong>शिर्षकगत किसिम</strong></td>
                                    <td class="myCenter"><strong>उपशिर्षकगत किसिम</strong></td>
                                    <td class="myCenter"><strong>अनुदानको किसिम</strong></td>
                                    <td class="myCenter"><strong>विनियोजन किसिम</strong></td>
                                    <td class="myCenter"><strong>वार्ड नं</strong></td>
                                    <td class="myCenter"><strong>अनुदान रु</strong></td>
                                    <td class="myCenter"><strong>सच्याउनुहोस् </strong></td>
                                    <?php if($mode=="superadmin"){?>
                                    <td class="myCenter"><strong>दर्ता हटाउनुहोस </strong></td>
                                    <?php }else{}?>
                                </tr>
                                <?php foreach($search_result[1] as $data):?>
                                <tr>
                                    <td class="myCenter"><?php echo convertedcit($data->id);?></td>
                                    <td class="myCenter"><?php echo $data->program_name;?></td>
                                    <td class="myCenter">
                                    	<form method="get">
                                    	<select name="type"  onchange="form.submit();">
                                    		<option value="0" <?php if($data->type==0){?> selected="selected" <?php } ?>>योजना</option>
                                    		<option value="1" <?php if($data->type==1){?> selected="selected" <?php } ?>>कार्यक्रम</option>
                                    	</select>
                                    	<input type="hidden" name="update_id" value="<?=$data->id?>" />
                                    	<input type="hidden" name="page_no" value="<?=$page_no?>" />
                                    </form>
                                    </td>
                                    <td class="myCenter"><?php echo Topicarea::getName($data->topic_area_id) ;?></td>
                                    <td class="myCenter"><?php echo Topicareatype::getName($data->topic_area_type_id);?></td>
                                    <td class="myCenter"><?php echo Topicareatypesub::getName($data->topic_area_type_sub_id); ?></td>
                                    <td class="myCenter"><?php echo Topicareaagreement::getName($data->topic_area_agreement_id);?></td>
                                    <td class="myCenter"><?php echo Topicareainvestment::getName($data->topic_area_investment_id);?></td>
                                    <td class="myCenter"><?php echo convertedcit($data->ward_no);?></td>
                                    <td class="myCenter"><?php echo convertedcit($data->investment_amount);?></td>
                                    <td class="myCenter"><a href="plan_form_delete_result.php?id=<?php echo $data->id;?>"><button class="button btn-secondary">हटाउनुहोस् </button></a></td>
                                    <?php if($mode=="superadmin"){?>
                                    <td class="myCenter"><a href="darta_delete_yojana.php?id=<?php echo $data->id;?>"><button class="button btn-danger">Delete</button></a></td>
                                    <?php }else{}?>
                                </tr>
                         <?php endforeach;?>
                         <tr>
                              <td colspan="8">&nbsp; </td>     
                             <td>जम्मा </td>
                             <td ><?php echo convertedcit(placeholder(Plandetails1::get_total_investment()));?></td>
                             <td >&nbsp; </td>
                         </tr>
                     </table>
                      <?php
                echo $search_result[0];//pagination html exist in key 0 of result array
                    ?>
                        </div>
                  </div>
                </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>
