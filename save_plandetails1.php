<?php require_once("includes/initialize.php"); 

require_once("zonelist.php");
error_reporting(1);
	//print_r($_POST); exit;
    $user=getUser();
$bhautik_details = Bhautik_lakshya::find_by_plan_id_and_type($_POST['plan_id'],1);
foreach($bhautik_details as $a)
{
    $a->delete();
}

// delete all anudans for this plan ID;
PlanDetailsAnudan::delete_all_by_plan_id($_POST['plan_id']);
if(!empty($_POST['remaining_title'])) {
    for ($i=0; $i < count($_POST['remaining_title']); $i++) { 
        $input_data = new PlanDetailsAnudan();
        $input_data->plan_id = $_POST['plan_id'];
        $input_data->title = $_POST['remaining_title'][$i];
        $input_data->value = $_POST['remaining_anudan'][$i];
        $input_data->is_contingency = in_array($i, array_values($_POST['remaining_con']));
        $input_data->is_marmat = in_array($i, array_values($_POST['marmat_value_remaining']));
        $input_data->is_anudan_add = in_array($i, array_values($_POST['remaining_add']));
        $input_data->save();
    }

}

if(!$session->is_logged_in()){ redirect_to("logout.php");}
if(!empty($_POST['create_id']) && empty($_POST['material_update_id']))
{
	$data = Plantotalinvestment::find_by_id($_POST['create_id']);
    $material= new Materialanudan();
    $anudan= Estimateanudandetails::find_by_plan_id($_POST['plan_id']);
    
    if(empty($anudan))
    {
        $anudan = new Estimateanudandetails();
    }
}
elseif(empty($_POST['create_id']) && !empty($_POST['material_update_id']))
{
    $data = new Plantotalinvestment();	
    $material=  Materialanudan::find_by_id($_POST['material_update_id']);
    $anudan= new Estimateanudandetails();
}
else
{
	$data = new Plantotalinvestment();
    $material=new Materialanudan();
    $anudan =  new Estimateanudandetails();
}

// delete all Bhautik_lakshya for this plan ID;
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
$data->agreement_gauplaika=$_POST['agreement_gauplaika'];
$data->agreement_other=$_POST['agreement_other'];
$data->other_agreement_title=$_POST['other_agreement_title'];
$data->agreement_other_title=$_POST['agreement_other_title'];
$data->agreement_other=$_POST['agreement_other'];
$data->costumer_agreement=$_POST['costumer_agreement'];
$data->other_agreement=$_POST['other_agreement'];
$data->bhuktani_anudan=$_POST['bhuktani_anudan'];
$data->costumer_investment =$_POST['costumer_investment'];
$data->total_investment=$_POST['total_investment'];
$data->anudan_con=$_POST['anudan_con'];
$data->aanya_nikaya_con=$_POST['aanya_nikaya_con'];
$data->aanya_sajhedari_con=$_POST['aanya_sajhedari_con'];
$data->nagad_sajhedari_con=$_POST['nagad_sajhedari_con'];
$data->created_date=date("Y-m-d",time());
$data->plan_id = $_POST['plan_id'];
$data->sajhedari_per = $_POST['sajhedari_per'];
$data->janashramdan = $_POST['janashramdan'];
$data->marmat_old = $_POST['marmat_old'];
$data->marmat_new = $_POST['marmat_new'];
$data->bipat_new = $_POST['bipat_new'];
$data->b_pat = $_POST['b_pat'];
$data->kul_lagat_anuman = $_POST['kul_lagat_anuman'];
$data->kul_lagat_con = $_POST['kul_lagat_con'];
$data->nagad_sajhedari_add = $_POST['nagad_sajhedari_add'];
$data->aanya_nikaya_add = $_POST['aanya_nikaya_add'];
$data->aanya_sajhedari_add = $_POST['aanya_sajhedari_add'];

$data->marmat_value_new = $_POST['marmat_value_new'];
$data->marmat_value_kul_lagat = $_POST['marmat_value_kul_lagat'];
$data->marmat_value_aanya_nikaya = $_POST['marmat_value_aanya_nikaya'];
$data->marmat_value_aanya_sajhedari = $_POST['marmat_value_aanya_sajhedari'];
$data->marmat_value_nagad_sajhedari = $_POST['marmat_value_nagad_sajhedari'];
$data->contingency = $_POST['contingency_form_data'];
$data->marmat = $_POST['marmat_form_data'];
// $_POST['created_date']=date("Y-m-d",time());
if($data->save())
{
    $add = $_POST['agreement_gauplaika'] + $_POST['agreement_other'] +$_POST['other_agreement'];
    $anudan->investment_amount   =  $_POST['agreement_gauplaika'];
    $anudan->other_source        =  $_POST['agreement_other'];
    $anudan->samiti_investment   =  $_POST['costumer_agreement'];
    $anudan->other_agreement     =  $_POST['other_agreement'];
    $anudan->total_investment    =  $add;
    $anudan->plan_id             =  $_POST['plan_id'];
    //print_r($anudan);exit;
    $anudan->save();
}
if(isset($_POST['check']))
   {
       $material->external_source=$_POST['external_source'];
       $material->state_gov=$_POST['state_gov'];
       $material->local_level=$_POST['local_level'];
       $material->sub_gov =$_POST['sub_gov'];
       $material->foreign_gov =$_POST['foreign_gov'];
       $material->other_nikaya =$_POST['other_nikaya'];
       $material->plan_id =$_POST['plan_id'];
       $material->save();
   }

    if($user->mode != 'maker') {

        $link= "plan_form1_1.php?id=".$_POST['plan_id'];
        echo alertBox("अपडेट सफल भयो", $link);
    } else {
        $link= "estimate_lagat_anuman.php?id=".$_POST['plan_id'];
        echo alertBox("अपडेट सफल भयो", $link);
    }

