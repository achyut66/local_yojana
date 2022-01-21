<?php require_once("includes/initialize.php"); 
if(!$session->is_logged_in()){ redirect_to("logout.php");}
if(!isset($_GET['id']) && isset($_SESSION['set_plan_id']))
{
  redirectUrl();
}
if(isset($_POST['submit']))
{
  Bhautik_lakshya::delete_all_by_plan_id($_POST['plan_id']);

for($i=0;$i<count($_POST['details_id']);$i++)
{
    $detail = new Bhautik_lakshya();
    $detail->parent_id = $_POST['parent_details_id'][$i];
    $detail->details_id = $_POST['details_id'][$i];
    $detail->qty = $_POST['qty'][$i];
    $detail->unit_id = $_POST['unit_id'][$i];
    $detail->plan_id = $_POST['plan_id'];
    $detail->miti    = DateEngToNep(date("Y-m-d",  time()));
    $detail->miti_english    = (date("Y-m-d",  time()));
    $detail->type = 1;
    $detail->save();
}
    if(!empty($_POST['create_id']))
    {
            $data = Contract_total_investment::find_by_id($_POST['create_id']);	
    }
    else
    {
            $data = new Contract_total_investment();
    }
    $_POST['created_date']=date("Y-m-d",time());
    if($data->savePostData($_POST))
    {
    $session->message("अपडेट सफल भयो ");
    redirect_to("contract_form1.php?id=".$_POST['plan_id']);
    }
}
 if(isset($_POST['search'])){
 if(empty($_POST['sn'])) {  
    $sql="select * from plan_details1 where program_name LIKE '%".$_POST['program']."%'";
 }
 else
 {
     $sql="select * from plan_details1 where id='".$_SESSION['set_plan_id']."'"; 
 }
 $results= Plandetails1::find_by_sql($sql);
}
$postnames=  Postname::find_all();
$units = Units::find_all();
 $sql="select * from enlist where type=0";
  $enlist=Enlist::find_by_sql($sql);
  $contract_info=  Contractinfo::find_by_plan_id($_SESSION['set_plan_id']);
  $bhautik_details = Bhautik_lakshya::find_by_plan_id_and_type($_GET['id'], 1);
  $SettingbhautikPariman = SettingbhautikPariman::find_all();
$SettingbhautikParimanParent = SettingbhautikPariman::find_all_parents();
?>
<?php include("menuincludes/header.php"); ?>
<title>योजनाको कुल लागत अनुमान :: <?php echo SITE_SUBHEADING;?></title>
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
		<div class="">
    		<div class="">
        <div class="maincontent">
            <h2 class="headinguserprofile">ठेक्काको कुल लागत अनुमान | <a href="contract_dashboard.php" class="btn">पछि जानुहोस</a></h2>
          
            <div class="OurContentFull">
					<div class="myMessage"><?php echo $message;?></div>
               
                <div class="userprofiletable">
                 <?php if(!isset($_GET['id'])){?>
                      <form  method="post">
                      <table class="table table-bordered">
                      	<tr>
                        	<td>योजनाको नाम:</td>
                            <td><input type="text" name="program"/></td>
                        </tr>
                        <tr>
                        	<td>दर्ता फाराम नं:</td>
                            <td><input type="text" name="sn"/> </td>
                        </tr>
                        <tr>
                        	<td>&nbsp; </td>
                            <td><input type="submit" name="search" value="खोज्नुहोस" class="btn"/></td>
                        </tr>
                       </table>
                    </form>
            <?php if(isset($_POST['search'])):?>
                    <table class="table table-bordered">
                        <tr>
                            <th>दर्ता फाराम नं</th>
                            <th>योजनाको नाम</th>
                        </tr>
                        <?php  foreach($results as $result):?>
                        <tr>
                            <td><?php echo $result->sn;?></td>
                            <td><a href="plan_form1.php?id=<?php echo $result->id;?>"><?php echo $result->program_name;?></a></td>
                        </tr>
                        <?php endforeach;?>
                    </table>
                    <?php endif;?>
               <?php } else { ?>
                    <?php 
                    $bid_message="";
                    $data = Plandetails1::find_by_id($_SESSION['set_plan_id']);
                    // print_r($data);exit;
                    $contract_total= $data->investment_amount * 0.03;
                    $contract_total_investment= $data->investment_amount- $contract_total;
                    $contract_bid = Contractentryfinal::find_by_sql("select * from contract_entry_final where status=1 and plan_id=".$_SESSION['set_plan_id']." limit 1");
                    // pp($contract_bid);
                    $contract_result=  array_shift($contract_bid);
//                    print_r($contract_result);exit;
                               if(empty($contract_result->total_bid_amount))
                               {
                                   $bid_amount=0;
                                  echo alertBox("ठेक्का कबोल गर्नुहोस्","contract_invitation_bid_form_view.php");
                                  
                               }
                               else
                               {
                                   $bid_amount=$contract_result->total_bid_amount;
                               }
                               if(empty($contract_result->contractor_id))
                               {
                                   $name="";
                               }
                               else
                               {
                                    $result= Contractordetails::find_by_id($contract_result->contractor_id);
                                   $name= $result->contractor_name;
//                                   echo $name;exit;
                               }
                        ?>
                    <?php $invest_details =  Contract_total_investment::find_by_plan_id($_SESSION['set_plan_id']); 
                         if(empty($invest_details))
                          {
                            $invest_details = Contract_total_investment::setEmptyObjects(); 
                          }
                          !empty($invest_details->id)? $value="अपडेट गर्नुहोस" : $value="सेभ गर्नुहोस"; 
                    ?>
                     <div>
                            <h3><?php echo $data->program_name; ?></h3>
                            <form method="post" enctype="multipart/form_data" >
                             <h3>ठेक्काको कुल लागत अनुमान</h3>
                        <table class="table table-bordered">
                          <tr>
                            <th width="176" scope="row">गाँउपालिकाबाट अनुदान</th>
                            <td width="176"><input type="text" readonly="true"  name="agreement_gaupalika"  value="<?=$data->investment_amount?>" /></td>
                          </tr>
                          <tr>
                            <th scope="row">कुल ठेक्का रकम जम्मा </th>
                            <td><input type="text" name="total_investment" readonly="true"  id="contract_total_investment" value="<?=$contract_info->contract_amount;?>"/></td>
                          </tr>
                         <tr>
                            <th scope="row">ठेक्का कबोल गरेको कुल रकम </th>
                            <td><input type="text"  name="contract_total_amount" id="contract_total_amount" value="<?=$bid_amount?>"/></td><span style="color:red;"><?php echo $bid_message;?></span>
                          </tr>
                           <tr>
                            <th scope="row">कार्यदेश दिएको  रकम</th>
                            <td><input type="text"  name="bhuktani_anudan" readonly="true" id="contract_bhuktani_anudan" value="<?=$bid_amount?>"/></td>
                          </tr>
                             <th scope="row">योजना संचालन गर्ने फर्म/कम्पनी</th>
                             <td>
                                 <select name="contractor_id">
                                     <option value="<?php echo $contract_result->contractor_id;?>"><?php echo $name;?></option>
                                 </select>
                             </td>
                          </tr>          
                        </table>
                        <table class="table table-bordered">
                            <tr>
                            <th>सि. नं </th>
                            <th>परिमाणको मुख्य शिर्षक             
                                <div 
                                class="btn"
                                data-toggle="modal" 
                                id="add_new_title"
                                data-target="#newModal" 
                                >
                                नया शिर्षक थप्नुहोस [+]
                                </div>
                            </th>
                            <th>परिमाणको शिर्षक </th>
                            <th>परिमाण</th>
                            <th>भौतिक इकाई </th>
                            <th style="5%;">#</th>
                            </tr>
                            <?php if (empty($bhautik_details)) {?>
                            <?php } else {
                                        $i=1;
                                        foreach ($bhautik_details as $result):
                                        ?>
                            <tr class="remove_plan_form_details">
                            <td class="sn" name="sn" id="sn_<?=$i?>" value="<?=$i?>"><?=$i?>
                            </td>
                            <td>
                            <select class="parent_details_id" name="parent_details_id[]" style="min-width: 100%;">
                                <option value="">--------</option>
                                <?php foreach ($SettingbhautikParimanParent as $data):?>
                                <option value="<?=$data->id?>" <?php if ($data->id==$result->parent_id) {
                                            echo 'selected="selected"';
                                        } ?>><?=$data->name?>
                                </option>
                                <?php endforeach; ?>
                                </select>
                            </td>
                            <td>
                                <select class="details_id" required name="details_id[]" style="min-width: 100%;">
                                <option value="">--------</option>
                                <?php foreach ($SettingbhautikPariman as $data):
                                    if ($data->id==$result->details_id) {
                                    ?>
                                    <option 
                                    value="<?=$data->id?>"
                                    <?php 
                                        if ($data->id==$result->details_id) {
                                        echo 'selected="selected"';
                                        } 
                                    ?> 
                                    ><?=$data->name?>
                                    </option>
                                <?php } endforeach; ?>
                                </select>
                            </td>
                            <td><input type="text" name="qty[]"
                                value="<?=$result->qty?>" /></td>
                            <td>
                                <select name="unit_id[]">
                                <option value="">--छान्नुहोस् --</option>
                                <?php foreach ($units as $unit): ?>
                                <option value="<?=$unit->id?>" <?php if ($unit->id==$result->unit_id) {
                                            echo 'selected="selected"';
                                        } ?>><?=$unit->name?>
                                </option>
                                <?php endforeach; ?>
                                </select>
                            </td>
                            <td style="width:5%;">
                                <button class="remove_btn" id="remove_btn_<?=$i?>">
                                <img src="images/cross.png" style="height: 20px; width: 20px;">
                                </button>
                            </td>
                            </tr>
                        
                            </tr>
                            <?php $i++;
                                        endforeach;
                                    }?>
                            <tbody id="join_table_plan_form_1">
                            </tbody>
                        </table>
                        <div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="newModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="newModalLabel">नया परिमाणको शिर्षक थप्नुहोस</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row justify-content-center">
                                <div class="col-md-10">
                                    <div class="titleInput">भौतिक लक्ष्यको शिर्षक:</div>
                                    <div class="newInput">
                                    <input type="text"  id="new_title_name" value="<?php echo $data->name;?>">
                                    </div>
                                    <div class="titleInput">मुख्य शिर्षक छ भने छानुहोस:</div>
                                    <select name="new_parent_id" id="new_parent_id" class="form-control" >
                                        <option value="-1">छानुहोस</option>
                                    </select>
                                    <br>
                                    <div class="saveBtn myWidth100">
                                    <input id="save_new_parent" value="सेभ गर्नुहोस" class="btn">  
                                    </div>
                                    <div class="myspacer"></div>
                                </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                            </div>
                        </div>
                        </div>
                        <div class="myspacer20"></div>
                        <div class="row">
                        <div class="col-md-4 text-left">
                            <!-- <div class="add_plan_form1 btn" style="width:100%">थप्नुहोस [+]</div> -->
                            <input type="button" class="add_plan_form1 button btn-primary" value="थप्नुहोस [+]">
                        </div>
                        <div class="col-md-4 text-center">
                            <input type="button" class="remove_plan_form1 button btn-danger" value="हटाउनुहोस [-]">
                        </div>
                        <div class="col-md-4 text-right">
                        <input type="submit" name="submit" value="<?=$value?>" class="button btn-success">
                        </div>
                        </div>
                        <div class="myspacer"></div>
                        <input type="hidden" name="create_id" value="<?=$invest_details->id?>" class="btn"/>
                        <input type="hidden" name="plan_id" value="<?=$_GET['id']?>" class="btn"/>
                                              
            </form>
               <?php } ?>
                </div>
                  </div>
                </div><!-- main menu ends -->
            </div>
         </div>   
    </div><!-- top wrap ends -->
    <?php include("menuincludes/footer.php"); ?>
    <script>
    //  marmat samhar:
    JQ(document).ready(function() {
      //starter check
      JQ(document).on("click", ".add_plan_form1", function() {
        var num = JQ(".remove_plan_form_details").length;
        var counter = num + 1;
        var param = {};
        param.counter = counter;
        JQ.post('get_bhautik_pariman_details.php', param, function(res) {
          var obj = JSON.parse(res);
          JQ("#join_table_plan_form_1").append(obj.html);
          JQ("#new_parent_id").append(obj.new_data);
        });
      });
      JQ(document).on("change", ".parent_details_id", function() {
        var param = {};
        param.id = +JQ(this).val();
        var target = JQ(this).parent().parent().find("td:eq(2)")
        JQ.post('get_bhautik_pariman_sub_details.php', param, function(res) {
          var obj = JSON.parse(res);
          target.html(obj.html)
        });
      });
      JQ(document).on("click", "#add_new_title", function() {
        var num = JQ(".remove_plan_form_details").length;
        var counter = num + 1;
        var param = {};
        param.counter = counter;
        JQ.post('get_bhautik_pariman_details.php', param, function(res) {
          var obj = JSON.parse(res);
          JQ("#new_parent_id").html(obj.new_data);
        });
      });
      JQ(document).on("click", "#save_new_parent", function() {
        var new_title_name = JQ('#new_title_name').val();
        if(!new_title_name){
          alert("परिमाणको शिर्षक");
          return;
        }
        var new_parent_id = JQ('#new_parent_id').val();
        var param = {
          name: new_title_name,
          parent_id: new_parent_id,
          save: true
        };
    });
        JQ.post('create_bhautik_pariman.php', param, function(res) {
          var obj = JSON.parse(res);
          if(obj.parent_id == -1) {
            var o = new Option(obj.name, obj.id);
            JQ('.parent_details_id').append(o);
          }
          JQ('#new_title_name').val('');
          alert('नया परिमाणको शिर्षक थपिएको छ।');
          JQ('#newModal').modal('toggle');
        });
        JQ(document).on("click", ".remove_plan_form1", function() {
        JQ('.remove_plan_form_details').last().remove();
      });
            JQ(document).on("click", ".remove_btn", function() {
                JQ(this).closest('tr').remove();
                var i = 1;
                JQ(".sn").each(function() {
                JQ(this).html(i + 1);
                i++;
                });
            });
    });
  </script>