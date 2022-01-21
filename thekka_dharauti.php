<?php require_once("includes/initialize.php");
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
error_reporting(1);
$mode = getUserMode();
if ($mode != "administrator" && $mode != "superadmin" && $mode !="user") {
    die("ACCESS DENIED");
} ?>
<?php
if(isset($_POST['submit']))
{
  // pp($_POST['bail_id']);exit;
  if(isset($_POST['bail_id']) && !empty($_POST['bail_id']))
    {
        $data = ThekkaBail::find_by_id($_POST['bail_id']);
    }else{
        $data = new ThekkaBail();
    }
        $data->bail_name = $_POST['bail_name'];
        $data->bail_percent = $_POST['bail_percent'];
        $data->bail_amount = $_POST['bail_amount'];
        if ($data->save()) {
            echo alertBox('धरौटी विवरण राख्न सफल !!!', 'thekka_dharauti.php');
        }
}
$thekka_bail = ThekkaBail::find_all();
?>
<?php include("menuincludes/header.php"); ?>
<title>ठेक्का धरौटी विवरण :: <?php echo SITE_SUBHEADING; ?></title>
</head>
    <body>
<?php include("menuincludes/topwrap.php"); ?>
<div id="body_wrap_inner"> 
    	<div class="maincontent">
             <h2 class="headinguserprofile">ठेक्का धरौटी विवरण  | <a href="settings.php" class="btn">पछि जानुहोस</a></h2>
                    <div class="OurContentFull">
                        <div class="userprofiletable">
                        	<form method="POST" enctype="multipart/form-data">
                            <input type="hidden" value="" name="bail_id" id="bail_id">
                            	<div class="inputWrap">
                                	<h1>ठेक्का धरौटी विवरण थप्नुहोस </h1>
                                    <div class="titleInput">धरौटी किसिम : </div>
                                    <div class="newInput"><input type="text" id="bail_name" name="bail_name"></div>
                                    <div class="titleInput">धरौटी प्रतिसद (%) : </div>
                                    <div class="newInput"><input type="text" id="bail_percent" name="bail_percent"></div>
                                    <div class="titleInput">धरौटी रकम रु. : </div>
                                    <div class="newInput"><input type="text" id="bail_amount" name="bail_amount"></div>
                                    <div class="saveBtn myWidth100">
                                    <input type="submit" name="submit" value="सेभ गर्नुहोस" class="btn"></div>
                                	<div class="myspacer"></div>
                                </div><!-- input wrap ends -->
                            
                        </div>
                  </div>
    <div class="myspacer"></div>
    <h2 class="headinguserprofile">ठेक्का धरौटी विवरण हेर्नुहोस</h2>
    <?php if(!empty($thekka_bail)){?>
    <table class="table table-bordered table-responsive">
        <thead>
          <th>सी.नं</th>
          <th>धरौटी किसिम नाम</th>
          <th>धरौटी प्रतिसाद (%)</th>
          <th>धरौटी रकम (रु)</th>
          <th>विवरण</th>
        </thead>
        <?php $i=1; foreach($thekka_bail as $tb):?>
          <tbody>
            <td><?=convertedcit($i);?></td>
            <td><?=$tb->bail_name;?></td>
            <td><?=convertedcit($tb->bail_percent);?></td>
            <td><?=convertedcit($tb->bail_amount);?></td>
            <td>
              <span>
              <button type="button" class="edit_bail button btn-primary" name="id" value="<?=$tb->id?>">
                सच्याउनुहोस्
              </button>
              </span>
              <span>
                <a href="thekka_bail_delete.php?id=<?=$tb->id?>">
                <input value="हटाउनुहोस" type="button" class="button btn-danger">
                </a>
                </span>
            </td>
            </form>
          </tbody>
          <?php $i++; endforeach;?>
    </table>
    </form>
    <?php }else{}?>
    </div><!-- main menu ends -->
    </div><!-- top wrap ends -->
<?php include("menuincludes/footer.php"); ?>
<script>
  JQ(document).ready(function(){
    JQ(document).on("click",".edit_bail",function(){
      var obj = JQ(this).val();
      param = {};
          param.name = obj;
          JQ.post('get_bail_id.php', param, function (res) {
                    var obj1 = JSON.parse(res);
                    JQ("#bail_name").val(obj1.bail_name);
                    JQ("#bail_percent").val(obj1.bail_percent);
                    JQ("#bail_amount").val(obj1.bail_amount);
                    JQ("#bail_id").val(obj1.id);
                    // console.log(res);
                });
    });
  });
</script>
