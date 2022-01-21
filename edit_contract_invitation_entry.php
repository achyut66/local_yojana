<?php require_once("includes/initialize.php"); 
if(!$session->is_logged_in()){ redirect_to("logout.php");}
error_reporting(1);
if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
{
  redirectUrl();
}
Contractinvitationentry::resetAutoIncrement();
$contract_result=  Contractinvitationforbid::find_by_plan_id($_GET['id']);
if(isset($_POST['submit']))
{
            $data = Contractinvitationentry::find_by_id($_POST['create_id']);	
            $data->bid_id=$_POST['bid_id'];
            $data->contractor_id=$_POST['contractor_id'];
            $data->contractor_address=$_POST['contractor_address'];
            $data->contractor_contact=$_POST['contractor_contact'];
            $data->darta_miti=$_POST['darta_miti'];
            $data->darta_miti_english=  DateNepToEng($_POST['darta_miti']);
            $data->plan_id=$_POST['plan_id'];
            $data->save();
            echo alertBox("थप सफल","view_contract_invitation_entry.php");

}
$details = Contractinvitationentry::find_by_id($_GET['contract_id']); 
$contract_details= Contractordetails::find_by_id($details->contractor_id);
$bid_id = $details->bid_id;

?>

<?php include("menuincludes/header.php"); ?>
<title>ठेक्का बोलपत्र दर्ता किताब    :: <?php echo SITE_SUBHEADING;?></title>
<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
		<div class="">
    		<div class="">
        <div class="maincontent">
            <h2 class="headinguserprofile">ठेक्का बोलपत्र दर्ता किताब  / <a href="contract_dashboard.php">पछि जानुहोस</a></h2>
           
                
            <div class="OurContentFull">
					<div class="myMessage"><?php echo $message;?></div>
               
                <div class="userprofiletable">
                
                 
                     <div>
                            <h3><?php echo $data->program_name; ?></h3>
                            <form method="post" enctype="multipart/form_data" >
                             <h3>ठेक्का बोलपत्र दर्ता किताब   </h3>
                        <table class="table table-bordered">
                        <tr>
                            <th scope="row">दर्ता नं</th> 
                            <td><input type="text" name="bid_id"  readonly="true" required value="<?php echo $bid_id;?>"/></td>
                          </tr>
                        <tr>
                            <th scope="row">निर्माण ब्यवोसायीको नाम </th>
                            <td>
                                <select id="contractor_id" name="contractor_id">
                                    <option value="">--छान्नुहोस्--</option>
                                    <?php foreach($contract_result as $result):?>
                                    <option value="<?php echo $result->contractor_id;?>" <?php if($details->contractor_id==$result->contractor_id){ echo 'selected="selected"';}?>><?php echo Contractordetails::getName($result->contractor_id);?></option>
                                    <?php endforeach;?>
                                </select>
                            </td>
                          </tr> 
                           <tr>
                            <th scope="row">ठेगाना</th>
                                <td><input type="text" id="contractor_address" name="contractor_address"  required value="<?php echo $contract_details->contractor_address;?>"/></td>
                          </tr>
                          
                          <tr>
                            <th scope="row">सम्पर्क</th>
                            <td><input type="text" id="contractor_contact" name="contractor_contact"  required value="<?php echo $contract_details->contractor_contact;?>"/></td>
                          </tr>
                         <tr>
                                <th scope="row">बोलपत्र दर्ता मिति  </th>
                                <td><input required type="text" name="darta_miti" id="nepaliDate10" value="<?php echo $details->darta_miti;?>"</td>
                           </tr>

                        </table>
                        <div class="myspacer"></div>
                        <input type="hidden" name="plan_id" value="<?=$_GET['id']?>" />
                        <input type="hidden" name="create_id" value="<?=$details->id?>" />
                         <input type="submit" name="submit" value="अपडेट गर्नुहोस" class="btn">
                                          
 </form>
         

                </div>
                  </div>
                </div><!-- main menu ends -->
            </div>
         </div>   
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>
    <script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="assets/js/main.js"></script>