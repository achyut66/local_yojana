<?php require_once("includes/initialize.php"); 
if(!$session->is_logged_in()){ redirect_to("logout.php");}
	$datas= Contractinvitationentry::find_by_plan_id($_SESSION['set_plan_id']);
//        print_r($datas);exit;
        
if(isset($_POST['submit']))
{
//    echo count($_POST['bill_type']);
//    echo "<pre>";print_r($_POST);echo "</pre>";exit;
   for($i=0;$i < count($_POST['bank_guarentee']);$i++)
   {
//       echo $_POST['bid_type'][$i+1];exit;
        $j=$i+1;
        $data = new Contractbidfinal();
        $data->contractor_id=$_POST['contractor_id'][$i];
        $data->bank_name=$_POST['bank_name'][$i];
        $data->bank_address=$_POST['bank_address'][$i];
        $data->bank_guarentee=$_POST['bank_guarentee'][$i];
        $data->bank_guarentee_date=$_POST['bank_guarentee_date'][$i];
        $data->dharauti_amount=$_POST['dharauti_amount'][$i];
        $data->details=$_POST['details'][$i];
        $data->created_date=$_POST['created_date'];
        $data->created_date_english = DateNepToEng($_POST['created_date']);
        $data->plan_id=$_POST['plan_id'];
        $data->save();
   }
   echo alertBox("थप सफल ","view_contract_bid_final.php");
}

        ?>
  
<?php include("menuincludes/header.php"); ?>
<!-- js ends -->
<title>ठेक्का खोलिएको फारम   :: <?php echo SITE_SUBHEADING;?></title>
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
</head>

<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
    	<div class="">
            <div class="">
                <div class="maincontent">
                    <h2 class="headinguserprofile">ठेक्का खोलिएको फारम | <a href="contract_dashboard.php" class="btn">पछि जानुहोस</a></h2>
                  
                    <div class="OurContentFull">
                    	<h2>ठेक्का खोलिएको फारम </h2>
                        <div class="">
                        	<div class="settingsMenuWrap1">
                                   
                            </div>
                            <div class="myspacer"></div>
							<div class="myMessage"><?php echo $message;?></div>
                                 <form method="post">
                                    	<table class="table table-bordered">
                                          <tr>
                                             <th>सि. नं.</th>
                                            <th>निर्माण ब्यवोसायीको नाम</th>
                                            <th>बैंकको नाम </th>
                                            <th>ठेगाना </th>
                                            <th>बैंक ग्यारेन्टी रकम</th>
                                            <th>बैंक ग्यारेन्टी रकम अवधि</th>
                                            <th>धरौटी खातामा जम्मा गरिएको रकम </th>
                                            <th>कैफियत</th>
                                          </tr>
                                          <?php $i=1;foreach($datas as $data): 
                                              $result= Contractordetails::find_by_id($data->contractor_id);
                                          $invest_details=2;
                ?>
                                          <tr>
                                                        <td><?php echo convertedcit($i); ?></td>
                                                        <td><?php echo $result->contractor_name;?></td>
                                                         <td><input type="text" class="myWidth100" name="bank_name[]" /></td>
                                                          <td><input type="text" class="myWidth100" name="bank_address[]" /></td>
                                                        <td><input type="text" class="myWidth100" name="bank_guarentee[]"/></td>
                                                         <td><input type="text" class="myWidth100" id="nepaliDate<?=$i+1?>" name="bank_guarentee_date[]" /></td>
                                                        <td><input type="text" class="myWidth100"  name="dharauti_amount[]" /></td>
                                                         <td><textarea class="myWidth100" name="details[]"></textarea></td>
                                                    <input type="hidden" name="plan_id" value="<?php echo $data->plan_id?>">
                                                    <input type="hidden" name="contractor_id[]" value="<?php echo $data->contractor_id?>">
                                                    </tr>
                                                
                                          <?php $i++;endforeach; ?>
                                                    <tr >
                                                        <td colspan="8">  <input type="text" name="created_date" readonly="true" id="nepaliDate10"/></td>
                                                    </tr>
                                        </table>
                                    <br><br>
                                                            <input type="submit" value="सेभ गर्नुहोस" name="submit" class="btn"/> 
                               </form>

                        </div>
                  </div>
                </div><!-- main menu ends -->
            </div>
         </div>   
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>