<?php require_once('database.php');

class Planamountwithdrawdetails
{
	protected static $table_name = "plan_amount_withdraw_details";
	protected static $db_fields = 
			array('id','get_qty','other_kaifiyet','doc_name','get_unit_id','plan_end_date','plan_end_date_english','yojana_sakine_date','yojana_sakine_date_english','upabhokta_aproved_date',
            'upabhokta_aproved_date_english','expenditure_approved_date'
            ,'expenditure_approved_date_english','plan_evaluated_date','plan_evaluated_date_english',
            'plan_evaluated_amount','final_payable_amount','payment_till_now','advance_payment','remaining_payment_amount',
            'final_contengency_amount','final_renovate_amount','final_dpr_amount','final_due_amount','final_disaster_management_amount','final_total_amount_deducted',
            'final_total_paid_amount','anudan_remaining_amount', 'costumer_agreement',
            'plan_id','bank_acc','chalani_no','bank_lagat_date','us_bank_acc','us_bank_name',
			'created_date','created_date_english','final_bhuktani_ghati_amount','agreement_other_calc','retention','tds','vat_amt',
			'agreement_gauplaika_calc','other_agreement_calc','customer_agreement_calc');
       public $id;
       public $get_qty;
       public $get_unit_id;
       public $plan_end_date;
       public $chalani_no;
       public $bank_lagat_date;
       public $other_kaifiyet;
       public $doc_name;
       public $us_bank_name;
	   public $retention;
	   public $tds;
	   public $vat_amt;
       public $us_bank_acc;
       public $final_bhuktani_ghati_amount;
       public $plan_end_date_english;
       public $upabhokta_aproved_date;
       public $upabhokta_aproved_date_english;
       public $expenditure_approved_date;
       public $expenditure_approved_date_english;
       public $plan_evaluated_date;
       public $plan_evaluated_date_english;
        public $plan_evaluated_amount;
        public $final_payable_amount;
        public $payment_till_now;
        public $advance_payment;
        public $anudan_remaining_amount;
        public $costumer_agreement;
        public $remaining_payment_amount;
        public $final_contengency_amount;
        public $final_renovate_amount;
        public $final_dpr_amount;
        public $final_due_amount;
        public $final_disaster_management_amount;
        public $final_total_amount_deducted;
        public $final_total_paid_amount;
         public $plan_id;
         public $yojana_sakine_date;
         public $yojana_sakine_date_english ;
          public $created_date;
         public $created_date_english;
         public $agreement_gauplaika_calc;
		public $agreement_other_calc;
		public $other_agreement_calc;
		public $customer_agreement_calc;
		public $bank_acc;
        // Common database method   
          public function getPaymentTillNow($plan_id)
            {
            
                     $topic_selected = self::find_by_plan_id($plan_id);
                     return $topic_names = $topic_selected->payment_till_now;   
            }
            public function find_by_plan_array($plan_id_string)
            {
                global $database;
		$result_array=self::find_by_sql("select * from ".self::$table_name." where plan_id in(".$plan_id_string.") order by created_date_english ASC");
		return $result_array;
            }
	  public function getAllPlanId()
        {
            global $database;
            $id_array=array();
            $result_array=self::find_by_sql("select * from ".self::$table_name);
            foreach($result_array as $result)
            {
                array_push($id_array, $result->plan_id);
            }    
            return $id_array;
        }
               public static function check_plan_id($id=0)
	{
		global $database;
		$result_array=self::find_by_sql("select * from ".self::$table_name. " where plan_id={$id} limit 1 ");
		$result = array_shift($result_array);
		if(!empty($result))
		{
			return 1;
		}
		else
		{
			return 0;
		}
	

	}
         public static function get_payement_till_now($plan_id)
         {
             global $analysis;
             global $starting_fund;
             $data = $analysis->getTotalPayableAmount($plan_id);
//           print_r($data);exit;
           if(empty($data))
           {
               $advance_amount=$starting_fund->find_by_plan_id($plan_id);
                    if(empty($advance_amount))
                    {
                        $net_payable_amount=0;
                    }
                    else 
                     {
                        $net_payable_amount=$advance_amount->advance;
                     }
                   
           }
           else
           {
               $net_payable_amount=$data;
           }
        return $net_payable_amount;
         }
	public static function find_all()
	{
		global $database;
		return self::find_by_sql("select * from ".self::$table_name);
		 	
	}
        public function getName($string_id="")
            {
            
                     $topic_selected = self::find_by_id($string_id);
                     return $topic_names = $topic_selected->name;   
            }
	
	public static function find_by_id($id=0)
	{
		global $database;
		$result_array=self::find_by_sql("select * from ".self::$table_name. " where id={$id} limit 1");
		return !empty($result_array)? array_shift($result_array) : false;
	}
        public static function find_by_plan_id($id=0)
	{
		global $database;
		$result_array=self::find_by_sql("select * from ".self::$table_name. " where plan_id={$id} limit 1");
		return !empty($result_array)? array_shift($result_array) : false;
	}
        public static function find_by_user_id($user_id=0)
	{
		global $database;
		$result_array=self::find_by_sql("select * from ".self::$table_name. " where user_id={$user_id} limit 1");
		return !empty($result_array)? array_shift($result_array) : false;
	}

        public function getLink($pagination){
            $link=$page_no='';
            $html=$per_page='';
            $total_pages=$pagination->total_pages();
             if($pagination->total_count>$per_page){
                if($pagination->has_previous_page()){//check if it has previous page function used from class
                    $prev_link='<a href="'.$link.'?page_no='.$pagination->previous_page().'">prev</a>';
                 }
                    else{
                        $prev_link="";
                    }
                    //check if it has next page function used from class
                        if($pagination->has_next_page()){
                        $next_link='<a href="'.$link.'?page_no='.$pagination->next_page().'">next</a>';
                        }
                    else{
                        $next_link="";
                    }
                    $html .= $prev_link;
                for($i=1;$i<=$total_pages;$i++){
                    if($i==$pagination->current_page){
                        $html.="<span style='color:red; background:black; padding-top:1px; padding-right:5px; padding-buttom:1px; padding-left:5px;'>".$pagination->current_page."</span>";
                    }
                    else{
                        $html.='<span> <a href="'.$link.'?page_no='.$i.'">'.$i.'</span>';


                    }
            }
        $html.=$next_link;
            }            
      return $html;      
}

	public  function savePostData($post, $clause)
	{
		foreach(self::$db_fields as $db_field)
		{
			if($clause=="create" && $db_field=="id")
			{
				continue;
			}
			if(property_exists($this, $db_field))
			{
				$this->$db_field= $post[$db_field];
			}
		}

		return $this->save();
	}
	public static function find_by_sql($sql="")
	{
		global $database;
		$result_set=$database->query($sql);
		$object_array = array();
		while ($row = $database->fetch_array($result_set))
		{
			$object_array[]= self::instantiate($row);
		}
		return $object_array;
	}
         public function set_page_query($page_no,$per_page,$link){
            global $pagination;
            $html='';
            $total_count=self::count_all();
            $pagination->set_pagination($page_no, $per_page, $total_count);
            $sql = "select * from ".self::$table_name." limit ".$pagination->per_page. " offset ".$pagination->offset();
             $result = self::find_by_sql($sql);
             $html=self::getLink($pagination);  
             $output=array();
             array_push($output, $html);
             array_push($output, $result);
            return $output;
        }
	public static function count_all()
	{
		global $database;
		$sql = "select count(*) from ".self::$table_name;
		$result_set = $database->query($sql);
		$row = $database->fetch_array($result_set);
		return array_shift($row);
	}
	
	private static function instantiate($record)
	{
		 // could check that $record exists and is an array
		 // simple, long form approach
		 $object= new self;
		/* $object->id			= $record['id'];
		 $object->username		= $record['username'];
		 $object->password 		= $record['password'];
		 $object->first_name 	= $record['first_name'];
		 $object->last_name 	= $record['last_name'];*/
		 
		 
		 // more dynamic, short-form approach:
		foreach($record as $attribute=>$value)
		{
			if ($object->has_attribute($attribute))
			{
				$object->$attribute=$value;
			}
		}
		return $object;
	}
	
	private function has_attribute($attribute)
	{
		// get_object_vars returns an associative array with all attributes
		// (incl. private ones!) as the keys and their current values as the value
		$object_vars = get_object_vars($this);
		// we don't care about the value, we just want to know if the key exists
		// will return true or false
		return array_key_exists($attribute, $object_vars);
	}
	protected function attributes()
	{
		// return an array of attribute keys and their values
		$attributes = array();
		foreach(self::$db_fields as $field)
		{
			if(property_exists($this, $field))
			{
				$attributes[$field] = $this->$field;
			}
		}
		return $attributes;
	}
	protected function sanitized_attributes()
	{
		global $database;
		$clean_attributes = array();
		// sanitize the values before submitting
		// note: does not alter the actual value of each attribute
		foreach($this->attributes() as $key => $value)
		{
			$clean_attributes[$key] = $database->escape_value($value);
		}
		return $clean_attributes;
	}
	public function save()
	{
		// a new record won't have an id yet
		return isset($this->id) ? $this->update() : $this->create();
	}
	public function create()
	{
		global $database;
		// dont forget sql syntax and good habits
		// insert into table ('key', 'key') values ('value', 'value')
		// single quotes around all values
		// escape all values to prevent sql injection
		$attributes = $this->sanitized_attributes();
		$sql = "insert into ". self::$table_name ."(";
		$sql .= join(",", array_keys($attributes));
		$sql .=") values ('";
		$sql .= join("', '", array_values($attributes));
		$sql .= "')";
                if ($database->query($sql))
		{
			$this->id = $database->insert_id();
			return $this->id;
		}
		else 
		{
			return false;
		}
	}
	
	public function update()
	{
		global $database;
		$attributes = $this->sanitized_attributes();
		$attribute_pairs = array();
		foreach ($attributes as $key => $value)
		{
			$attribute_pairs[] = "{$key}='{$value}'";
		}
		$sql = "update ".self::$table_name." set ";
		$sql .= join(", ", $attribute_pairs);
		$sql .= "where id=".$database->escape_value($this->id);
		$database->query($sql);
		return ($database->affected_rows() ==1)? true : false;
	}
	
	public function delete()
	{
		global $database;
		// delete from table where condition limit 1
		$sql = "delete from " .self::$table_name ;
		$sql .= " where id=".$database->escape_value($this->id);
		$sql .= " limit 1";
		$database->query($sql);
		return ($database->affected_rows() == 1) ? true : false;
	}
	public static function find_by_sql_cit_no()
	{
	    global $database;
	    $sql = "SELECT x.final_total_paid_amount, y.cit_no FROM plan_amount_withdraw_details x inner JOIN costumer_association_details y ON x.plan_id = y.plan_id";
	    $result_set = $database->query($sql);
	    $object_array = array();
	   while ($row = $database->fetch_array($result_set))
		{
			$object_array[]= self::instantiate($row);
		}
		return $object_array;
	}
       
}
?>