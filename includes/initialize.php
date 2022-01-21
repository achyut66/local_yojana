<?php
error_reporting(E_ALL);
require_once("defines.php");
require_once(LIB_INCLUDE.'session.php');
//if(isset($_SESSION['fiscal_year']) && $_SESSION['fiscal_year']==1)
//{
//    require_once(LIB_INCLUDE.'config.php');
//}
//else
//{
//    require_once(LIB_INCLUDE.'config1.php');
//}
require_once(LIB_INCLUDE.'database.php');
require_once(LIB_INCLUDE.'database_prev.php');
require_once(LIB_INCLUDE.'database_object.php');
require_once(LIB_INCLUDE.'functions.php');
require_once(LIB_INCLUDE.'other_function.php');
require_once(LIB_INCLUDE.'transfer_function.php');
require_once(LIB_INCLUDE.'napi_functions.php');
require_once(LIB_INCLUDE.'nepali_calendar.php');
require_once(LIB_INCLUDE.'user.php');
require_once(LIB_INCLUDE.'user1_class.php');
require_once(LIB_INCLUDE.'topic.php');
require_once(LIB_INCLUDE.'fiscal.php');
require_once(LIB_INCLUDE.'engdate.php');
require_once(LIB_INCLUDE.'bill_payment.php');
require_once(LIB_INCLUDE.'units.php');
require_once(LIB_INCLUDE.'postname.php');
require_once(LIB_INCLUDE.'topic_area_class.php');
require_once(LIB_INCLUDE.'topic_area_type_class.php');
require_once(LIB_INCLUDE.'topic_area_type_sub_class.php');
require_once(LIB_INCLUDE.'topic_area_agreement_class.php');
require_once(LIB_INCLUDE.'topic_area_investment_class.php');
require_once(LIB_INCLUDE.'topic_area_investment_source_class.php');
require_once(LIB_INCLUDE.'plan_details_class.php');
require_once(LIB_INCLUDE.'plan_details1_class.php');
require_once(LIB_INCLUDE.'plan_details_anudan_class.php');
require_once(LIB_INCLUDE.'program_details.php');
require_once(LIB_INCLUDE.'plan_total_investment_class.php');
require_once(LIB_INCLUDE.'costumer_association_details_class.php');
require_once(LIB_INCLUDE.'investigation_association_details_class.php');
require_once(LIB_INCLUDE.'more_plan_details_class.php');
require_once(LIB_INCLUDE.'withdraw_plan_installment_details_class.php');
require_once(LIB_INCLUDE.'plan_starting_fund_class.php');
require_once(LIB_INCLUDE.'bank_details_class.php');
require_once(LIB_INCLUDE.'plan_time_addition_affiliation_class.php');
require_once(LIB_INCLUDE.'program_time_addition_affiliation_class.php');
require_once(LIB_INCLUDE.'public_investigation_details_class.php');
require_once(LIB_INCLUDE.'plan_amount_withdraw_details_class.php');
require_once(LIB_INCLUDE.'analysis_based_withdraw_class.php');
require_once(LIB_INCLUDE.'profitable_family_details_class.php');
require_once(LIB_INCLUDE.'bank_information_class.php');
require_once(LIB_INCLUDE.'worker_details_class.php');
require_once(LIB_INCLUDE.'costumer_association_details_0_class.php');
require_once(LIB_INCLUDE.'upload_class.php');
require_once(LIB_INCLUDE.'program_details.php');
require_once(LIB_INCLUDE.'program_more_details.php');
require_once(LIB_INCLUDE.'program_payment.php');
require_once(LIB_INCLUDE.'program_payment_final.php');
require_once(LIB_INCLUDE.'contract_form1.php');
require_once(LIB_INCLUDE.'contract_bid.php');
require_once(LIB_INCLUDE.'contract_more_details.php');
require_once(LIB_INCLUDE.'contract_starting_fund.php');
require_once(LIB_INCLUDE.'contract_analysis_withdraw.php');
require_once(LIB_INCLUDE.'contract_amount_withdraw_details.php');
require_once(LIB_INCLUDE.'contract_time_addition_affiliation.php');
require_once(LIB_INCLUDE.'contract_dharauti.php');
require_once(LIB_INCLUDE.'samiti_plan_total_investment.php');
require_once(LIB_INCLUDE.'samiti_costumer_association_details_0_class.php');
require_once(LIB_INCLUDE.'samiti_costumer_association_details_class.php');
require_once(LIB_INCLUDE.'samiti_investigation_association_details.php');
require_once(LIB_INCLUDE.'samiti_more_plan_details_class.php');
require_once(LIB_INCLUDE.'samiti_profitable_family_details_class.php');
require_once(LIB_INCLUDE.'samiti_plan_starting_fund_class.php');
require_once(LIB_INCLUDE.'samiti_analysis_based_withdraw_class.php');
require_once(LIB_INCLUDE.'samiti_public_investigation_details_class.php');
require_once(LIB_INCLUDE.'samiti_plan_amount_withdraw_details_class.php');
require_once(LIB_INCLUDE.'samiti_plan_time_addition_affiliation_class.php');
require_once(LIB_INCLUDE.'enlist.php');
require_once(LIB_INCLUDE.'contract_info_class.php');
require_once(LIB_INCLUDE.'estimate_add_class.php');
require_once(LIB_INCLUDE.'work_topic_class.php');
require_once(LIB_INCLUDE.'estimate_anudan_details_class.php');
require_once(LIB_INCLUDE.'estimate_other_agreement_class.php');
require_once(LIB_INCLUDE.'estimate_lagat_anuman_class.php');
require_once(LIB_INCLUDE.'estimate_lagat_anuman_break_class.php');
require_once(LIB_INCLUDE.'estimate_lagat_profile.php');
require_once(LIB_INCLUDE.'napi_lagat_anuman_class.php');
require_once(LIB_INCLUDE.'napi_lagat_anuman_break_class.php');
require_once(LIB_INCLUDE.'napi_lagat_profile.php');
require_once(LIB_INCLUDE.'material_anudan_class.php');
require_once(LIB_INCLUDE.'report_function.php');
require_once(LIB_INCLUDE.'budget_topic.php');
require_once(LIB_INCLUDE.'setting_budget_topic_profile.php');
require_once(LIB_INCLUDE.'ekmusta_budget.php');
require_once(LIB_INCLUDE.'convert_function.php');
require_once(LIB_INCLUDE.'expenditure_function.php');
require_once(LIB_INCLUDE.'contract_invitation_for_bid_class.php');
require_once(LIB_INCLUDE.'contract_invitation_entry_class.php');
require_once(LIB_INCLUDE.'setting_document_class.php');
require_once(LIB_INCLUDE.'contract_bid_final_class.php');
require_once(LIB_INCLUDE.'setting_contractor_details_class.php');
require_once(LIB_INCLUDE.'contingency_expenditure_class.php');
require_once(LIB_INCLUDE.'add_contract_dharauti.php');
require_once(LIB_INCLUDE.'contract_dharauti_firta.php');
require_once(LIB_INCLUDE.'contract_entry_final_class.php');
require_once(LIB_INCLUDE.'program_payment_final_deposit_return.php');
require_once(LIB_INCLUDE.'yojana_dharauti_class.php');
require_once(LIB_INCLUDE.'settings_rules_class.php');
require_once(LIB_INCLUDE.'setting_marmat_samhar_class.php');
require_once(LIB_INCLUDE.'settings_marmat_Samhar_class.php');
require_once(LIB_INCLUDE.'settings_contingency_class.php');
require_once(LIB_INCLUDE.'training_expense.php');
require_once(LIB_INCLUDE.'amanat_lagat_class.php');
require_once(LIB_INCLUDE.'amanat_more_details_class.php');
require_once(LIB_INCLUDE.'setting_ward_class.php');
require_once(LIB_INCLUDE.'child_plan.php');
require_once(LIB_INCLUDE.'print_details.php');
require_once(LIB_INCLUDE.'settings_program_upabhokta_samiti.php');
require_once(LIB_INCLUDE.'settings_program_upabhokta_samiti_details.php');
require_once(LIB_INCLUDE.'setting_shrot_class.php');
require_once(LIB_INCLUDE.'print_history.php');
require_once(LIB_INCLUDE.'letter_bill_paper_details.php');
require_once(LIB_INCLUDE.'topic_area_budget_shrot_class.php');
require_once(LIB_INCLUDE.'topic_area_type_budget_shrot_class.php');
require_once(LIB_INCLUDE.'plan_shrot_record_class.php');
require_once(LIB_INCLUDE.'bhautik_lakshya_class.php');
require_once(LIB_INCLUDE.'setting_bhautik_parinam_details_class.php');
require_once(LIB_INCLUDE.'settings_katti_wiwarn.php');
require_once(LIB_INCLUDE.'plan_katti_record.php');
require_once(LIB_INCLUDE.'katti_details_class.php');
require_once(LIB_INCLUDE.'letter_indices.php');
require_once(LIB_INCLUDE.'letter_format.php');
require_once(LIB_INCLUDE.'quotation_enlist_form.php');
require_once(LIB_INCLUDE.'quotation_more_details.php');
require_once(LIB_INCLUDE.'quotation_total_investment.php');
require_once(LIB_INCLUDE.'extra_investment_class.php');
require_once(LIB_INCLUDE.'kar_bibran.php');
require_once(LIB_INCLUDE.'merge_plan_details.php');
require_once(LIB_INCLUDE.'ethekka_info_list.php');
require_once(LIB_INCLUDE.'dharauti_khata_info.php');
require_once(LIB_INCLUDE.'anugaman_samiti_bibaran_class.php');
require_once(LIB_INCLUDE.'setting_budget_nirman_class.php');
require_once(LIB_INCLUDE.'anugaman_patra_details_add.php');
require_once(LIB_INCLUDE.'ethekka_lagat_class.php');
require_once(LIB_INCLUDE.'plan_details_anudan_class.php');
require_once(LIB_INCLUDE.'setting_bipat.php');
require_once(LIB_INCLUDE.'program_katti_bibaran.php');
require_once(LIB_INCLUDE.'abstract_of_cost_class.php');
require_once(LIB_INCLUDE.'abstract_profile_class.php');
require_once(LIB_INCLUDE.'abstract_of_cost_image_class.php');
require_once(LIB_INCLUDE.'quotation_letter_content.php');
require_once(LIB_INCLUDE.'deactivate.php');
require_once(LIB_INCLUDE.'thekka_bail.php');
require_once(LIB_INCLUDE.'costumer_black_list.php');
require_once(LIB_INCLUDE.'upabhokta_dafa_store.php');
