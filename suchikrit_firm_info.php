<?php require_once("includes/initialize.php"); ?>
<?php	
	if(!$session->is_logged_in()){ redirect_to("logout.php");}
?>
<?php
    $parent_bhautik = SettingbhautikPariman::find_all_parents();
    $contractor_info = Contractordetails::find_all();
?>
<?php
if(isset($_GET['submit']))
{
$contractor_id = $_GET['contractor_name'];
$result0= Contractinvitationforbid::find_by_sql("select * from contract_invitation_for_bid where contractor_id =".$contractor_id);
}
?>
<?php include("menuincludes/header.php"); ?>
<title>सुचिकृत फर्म कम्पनीको अवस्था :: <?php echo SITE_SUBHEADING;?></title>
<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
        <div class="maincontent">
             <h2 class="dashboard">सुचिकृत फर्म कम्पनीको अवस्था | <button class="button btn-danger"><a href="index.php">Back जानुहोस </a></button></h2>
             <div class="myspacer"></div>
             <div class="OurContentFull">
             <h2>निर्माण व्यवसायी छान्नुहोस </h2>
             <form method="get">
             <div class="inputWrap">
             <div class="newInput">
                    <select class="form-control" name="contractor_name">
                        <option>---छान्नुहोस्---</option>
                        <?php foreach($contractor_info as $ci):?>
                            <option value="<?=$ci->id?>">
                                <?=$ci->contractor_name;?>
                        <?php endforeach;?>
                            </option>
                    </select>
             </div>
             </div>
             <div class="myspacer"></div>
             <div class="text-center">
                 <button class="button btn-success" name="submit">खोज्नुहोस</button>
             </div>
             <div class="myspacer"></div>
             <?php $party_name= array();foreach($result0 as $key => $r0): //print_r($r0);?>
             <div class="text-center"><strong>
                 <?php $party_name[] = Contractordetails::getName($r0->contractor_id)?>
             </div>
             <?php endforeach;?>
             <h2><?php echo $party_name[0]?> बाट सम्झौता भएका योजना विवरण</h2>
             <div class="myspacer"></div>
             <div class="text-center">
                 <h4><div><?=SITE_LOCATION;?></div></h4>
                 <h4><div><?=SITE_HEADING?></div></h4>
                 <h4><div><?=SITE_ADDRESS?></div></h4>
             </div>
             <div class="text-right">
                 <a class="btn btn-secondary" href="suchikrit_firm_info_print.php?contractor_id=<?=$contractor_id?>">प्रिन्ट गर्नुहोस</a>
             </div>
             <?php 
             $sum = 0;
             if(!empty($result0)){?>
             <table class="table table-bordered table-responsive striped" border="3px;">
                            <thead>
                            <tr>
                                <th style="text-align: center;">सी.नं</th>   
                                <th style="text-align: center;">योजना द.नं</th>   
                                <th style="text-align: center;">ठेक्का नं</th>
                                <th style="text-align: center;">ठेक्का रकम</th>
                                <th style="text-align: center;">पी.एस. रकम</th>
                                <th style="text-align: center;">कुल ठेक्का रकम</th>
                                <th style="text-align: center;">ठेक्का प्रकाशित मिति</th>
                                <th style="text-align: center;">योजनाको नाम</th>   
                                <th style="text-align: center;">ठेकेदारको ठेगाना</th>
                                <th style="text-align: center;">सम्पर्क नं</th> 
                                <th style="text-align: center;">बोलपत्र बिक्रि मिति</th>
                                <th style="text-align: center;">बिनोयोजित बजेट</th>     
                                <th style="text-align: center;">पुरा विवरण</th>
                            </tr>
                            </thead>
                            <?php $a=1; foreach($result0 as $result0):?>
                            <?php $result1 = Contractinfo::find_by_sql("select * from contract_info where plan_id=".$result0->plan_id);?>
                            <?php foreach($result1 as $r1):?>
                            <tbody>     
                            <tr>
                                <td><?=convertedcit($a);?></td>
                                <td><?php echo convertedcit($result0->plan_id);?></td>
                                <td><?php echo $r1->thekka_id;?></td>
                                <td><?=convertedcit($r1->amount)?>/-</td>
                                <td><?=convertedcit($r1->ps)?>/-</td>
                                <td><?=convertedcit($r1->contract_amount)?>/-</td>
                                <td><?=convertedcit($r1->created_date)?></td>
                                <td><?php $name = Plandetails1::find_by_id($result0->plan_id); echo $name->program_name;?></td>
                                <td><?=$result0->contractor_address?></td>
                                <td><?=convertedcit($result0->contractor_contact)?></td>
                                <td><?=convertedcit($result0->contract_date)?></td>
                                <td><?=convertedcit($name->investment_amount)?>/-</td>
                                <td><a href=""><button class="button btn-success">पुरा विवरण</button></a></td>
                            </tr>
                            </tbody>
                            <?php 
                            $sum += $r1->amount;
                            $sum1 += $r1->ps;
                            $sum2 += $r1->contract_amount;
                            $sum4 += $name->investment_amount;
                            ?>
                            <?php endforeach;?>
                            <?php $a++; endforeach; ?>
                            <strong>
                            <tfoot>
                                <tr>
                                    <td colspan="3">जम्मा</td>
                                    <td><?=convertedcit($sum);?></td>
                                    <td><?=convertedcit($sum1);?></td>
                                    <td><?=convertedcit($sum2);?></td>
                                    <td colspan="5"></td>
                                    <td colspan="2"><?=convertedcit($sum4);?></td>
                                </tr>
                            </tfoot>
                            </strong>
                            
                            
             </table>
             <?php }else{}?>
        </form>
        </div><!-- main menu ends -->
</div>
</div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>