<?php require_once("includes/initialize.php"); ?>
<?php	
	if(!$session->is_logged_in()){ redirect_to("logout.php");}
?>
<?php
    $parent_bhautik = SettingbhautikPariman::find_all_parents();
?>
<?php include("menuincludes/header.php"); ?>
<title>क्षेत्रगत भौतिक प्रगतिको अवस्था :: <?php echo SITE_SUBHEADING;?></title>
<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner"> 
        <div class="maincontent">
             <h2 class="dashboard">क्षेत्रगत भौतिक प्रगतिको अवस्था | <button class="button btn-danger"><a href="index.php">Back जानुहोस </a></button></h2>
             <div class="myspacer"></div>
             <table class="table table-bordered table-responsive table-stripped" border="3px;">
                <thead>
                    <th>क्र.सं.</th>
                    <th>बिषयगत क्षेत्र</th>
                    <th>उपक्षेत्र</th>
                    <th>भौतिक लक्ष्य (%)</th>
                    <th>भौतिक प्रगति (%)</th>
                    <th>इकाई</th>
                    <th>प्रमुख उपलब्धि</th>
                    <th>Details</th>
                </thead>
                <tbody>
                <?php 
                    $i=1; 
                    $sum = 0;
                    $results = array();
                    foreach($parent_bhautik as $pb):
                        $child_bhautik = SettingbhautikPariman::find_child_by_parent($pb->id);
                    ?>
                    <tr>
                        <td><?php echo convertedcit($i++); ?></td>
                        <td><?php echo $pb->name?></td>
                        <td>
                            <?php foreach($child_bhautik as $key => $cb):?>
                                    <?=$cb->name;?><hr><br/>
                                <?php endforeach;?>
                        </td>
                        <?php foreach($child_bhautik as $key => $cb):?>
                       <td>
                            <?php
                                $datass = Bhautik_lakshya::get_report_data($cb->id);
                                pp($datass);
                                foreach($datass as $key => $dats):
                                    pp($dats[5]);
                                endforeach;
                            ?>
                            
                       </td>
                       <?php endforeach;?>
                       
                    </tr>
                <?php endforeach;?>
                </tbody>
                <tfoot>

                </tfoot>
             </table>
        </div><!-- main menu ends -->
</div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>