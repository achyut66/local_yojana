<?php
require_once("includes/initialize.php");
if(!$session->is_logged_in()){ redirect_to("logout.php");}
$postnames = Postname::find_all();
$res = array();
$counter=$_POST['counter'];
$ward=$_POST['ward'];
empty($ward)? $ward=0 : $ward=$ward;
$html = '';
$html .='<tr class="remove_post_detail">
                                    <td class="tdWidth5">'.$counter.'</td>
                                    <td class="tdWidth17"><input type="text" name="name[]" class="input100percent"  required /></td>
                                    <td class="tdWidth17"><input type="text" name="cit_no[]" class="input100percent" required /></td>                                    
                                    <td class="tdWidth17"><input type="text" name="mobile_no[]" class="input100percent" required /></td>
                                </tr>';
$res['html'] = $html;
echo json_encode($res); exit;