<?php
/**
* Shift4 payment module for Zen Cart 1.39h
*
* LICENSE: based on Authorize.net "AIM" code created by Eric Stamper - 01/30/2004 Released under GPL
* 
* @copyright  Copyright (c) 2011 Shift4 Corporation (http://www.shift4.com)    
*
* Note: the user will know MODULE_PAYMENT_SHIFT4_USERNAME_PRODUCTION as 'API Username', and MODULE_PAYMENT_SHIFT4_PASSWORD_PRODUCTION as 'API Password'.
* 		They are the API credentials, and not the login credentials for Dollars on the Net.
*
*/

/**
 * Shift4 class
 * based on authorize.net AIM payment method class included with Zen-Cart
 *
 */
class shift4 extends base {	

	/**
	 * $this->submit_data is the data submitted in the transaction request
	 * 
	 * @var array  
	 */	
	private $submit_data = array();
	
	/**
	 * $last_shift4_log_id is the last inserted id in the shift4_log table
	 * 
	 * @var integer  
	 */	
	private $last_shift4_log_id;
	
	/**
	 * $i4Go_debug_data is the debugging data for the i4Go failed transaction log
	 * 
	 * @var string  
	 */	
	private $i4Go_debug_data;
	
	/**
	 * $Shift4_debug_data is the debugging data for the Shift4 failed transaction log
	 * 
	 * @var string  
	 */	
	private $Shift4_debug_data;	
	
	/**
	 * $Shift4_error_response is the error response from the gateway
	 * 
	 * @var string  
	 */	
	private $Shift4_error_response;
	
	/**
	 * $db_log_data is the data for log_gateway_data()
	 * 
	 * @var array  
	 */	
	private $db_log_data = array();		

	/**
	 * $attempts is the the number of transaction request attempts
	 * 
	 * @var integer  
	 */
	private $attempts;
	
	/**
	 * $server is the Shift4 server number
	 * 
	 * @var integer
	 */
	private $server;
	
	/**
	* $code determines the internal 'code' name used to designate this payment module
	*
	* @var string
	*/
	public $code;
	
	/**
	* $title is the displayed name for this payment method
	*
	* @var string
	*/
	public $title;
	
	/**
	* $description is a soft name for this payment method
	*
	* @var string
	*/
	public $description;
	
	/**
	* $enabled determines whether or not this module shows in catalog
	*
	* @var boolean
	*/
	public $enabled;
	
	/**
	 * Constructor
	 *
	 * @return Shift4
	 */
	function shift4() {
		global $order, $messageStack;
		$this->code = 'shift4';
		
		/**
		 * Checks if the module is configured.
		 * 
		 * @return boolean
		 */
		function is_module_configured() {
			if (MODULE_PAYMENT_SHIFT4_STATUS == 'Enabled' && (MODULE_PAYMENT_SHIFT4_I4GO_LOGIN_PRODUCTION =='' || MODULE_PAYMENT_SHIFT4_I4GO_SITE_PRODUCTION == '' || MODULE_PAYMENT_SHIFT4_PASSWORD_PRODUCTION == '' || MODULE_PAYMENT_SHIFT4_SERIAL_NUMBER_PRODUCTION == '' || MODULE_PAYMENT_SHIFT4_MERCHANT_ID_PRODUCTION == '' || MODULE_PAYMENT_SHIFT4_USERNAME_PRODUCTION == '')) {
				return false;
			} else {
				return true;
			}
		}	
		
		if (IS_ADMIN_FLAG === true) {
		  //  Payment module title in Admin
		  $this->title = MODULE_PAYMENT_SHIFT4_TEXT_ADMIN_TITLE;
		  
		  if (!is_module_configured()) {
			$this->title .=  '<span class="alert"> (not configured)</span>';
		  } elseif (stristr(MODULE_PAYMENT_SHIFT4_ORDER_MODE, 'demo') !== FALSE || MODULE_PAYMENT_SHIFT4_ORDER_MODE == 'Testing') {
		  	$this->title .=  '<span class="alert"> (demo mode)</span>';
		  }		  
		} else {
		  $this->title = MODULE_PAYMENT_SHIFT4_TEXT_CATALOG_TITLE;
		}
		
		// message on payment page
		if (!is_module_configured() || (MODULE_PAYMENT_SHIFT4_ORDER_MODE != 'Live')) {
			$messageStack->add('header', 'The Shift4 payment module is not configured to process live transactions.', 'warning');
		}
		
		$this->description = MODULE_PAYMENT_SHIFT4_TEXT_DESCRIPTION;
		$this->enabled = ((MODULE_PAYMENT_SHIFT4_STATUS == 'Enabled') ? true : false);
		$this->sort_order = MODULE_PAYMENT_SHIFT4_SORT_ORDER;
		$this->form_action_url = zen_href_link(FILENAME_CHECKOUT_PROCESS, '', 'SSL', false);
		
		if ((int)MODULE_PAYMENT_SHIFT4_ORDER_STATUS_ID > 0) {
		  $this->order_status = MODULE_PAYMENT_SHIFT4_ORDER_STATUS_ID;
		}
		
		if (is_object($order)) $this->update_status();
	}
	
	/**
	* Returns enabled status of module
	*
	* @return boolean
	*/	
	function is_enabled() {
		$is_enabled = (MODULE_PAYMENT_SHIFT4_STATUS == 'Enabled') ? true : false;
		return $is_enabled;
	}
	
	/**
	* Calculate zone matches and flag settings to determine whether this module should display to customers or not
	*
	* @return void
	*/
	function update_status() {
		global $order, $db;	
		
		if (($this->enabled == true) && ((int)MODULE_PAYMENT_SHIFT4_ZONE > 0)) {
		  	$check_flag = false;
		  	$check = $db->Execute("
									SELECT zone_id 
									FROM " . TABLE_ZONES_TO_GEO_ZONES . " 
									WHERE geo_zone_id = '" . MODULE_PAYMENT_SHIFT4_ZONE . "' 
									AND zone_country_id = '" . $order->billing['country']['id'] . "' 
									ORDER BY zone_id
								 ");
		  
		  	while(!$check->EOF) {
				if ($check->fields['zone_id'] < 1) {
					$check_flag = true;
					break;
				} elseif ($check->fields['zone_id'] == $order->billing['zone_id']) {
					$check_flag = true;
					break;
				}
				$check->MoveNext();
		 	 }
		
		 	 if ($check_flag == false) {
				$this->enabled = false;
		  	}
		}
	}
	
	/**
	* Javascript that validates payment information input and changes the form action
	* 
	* @return string
	*/
	function javascript_validation() {
		$js = 
			'  if (payment_value == "' . $this->code . '") {' . "\n" .
			'    var cc_owner = document.checkout_payment.shift4_cc_owner.value;' . "\n" .
			'    var cc_number = document.checkout_payment.shift4_cc_number.value;' . "\n" .
			'    var cc_cvv = document.checkout_payment.shift4_cc_cvv.value;' . "\n\n";			
			
		$js .= 
			'    if (cc_owner == "" || cc_owner.length < ' . CC_OWNER_MIN_LENGTH . ') {' . "\n" .
			'      error_message = error_message + "' . MODULE_PAYMENT_SHIFT4_TEXT_JS_CC_OWNER . '\n";' . "\n" .
			'      error = 1;' . "\n" .
			'    }' . "\n" .
			'    if (cc_number == "" || cc_number.length < ' . CC_NUMBER_MIN_LENGTH . ') {' . "\n" .
			'      error_message = error_message + "' . MODULE_PAYMENT_SHIFT4_TEXT_JS_CC_NUMBER . '\n";' . "\n" .
			'      error = 1;' . "\n" .
			'    }' . "\n" ;
		
		$js .= 
			'    if (cc_cvv == "" || cc_cvv.length < "3" || cc_cvv.length > "4") {' . "\n".
			'      error_message = error_message + "' . MODULE_PAYMENT_SHIFT4_TEXT_JS_CC_CVV . '\n";' . "\n" .
			'      error = 1;' . "\n" .
			'    }' . "\n" ;		
		
		$js .= 
			'    cc_number = null;' . "\n" .
			'  } else {' . "\n" .
			'    document.checkout_payment.action = "' . zen_href_link(FILENAME_CHECKOUT_CONFIRMATION, '', 'SSL') . '";' . "\n" . 
			'  }' . "\n";
			
		return $js;
	}
	
	/**
	* Display Credit Card Information Submission Fields on the Checkout Payment Page
	*
	* @return array
	*/
	function selection() {
		global $order, $messageStack;
	
		$this->check_i4go_response();		
		
		for ($i=1; $i<13; $i++) {
		  $expires_month[] = array('id' => sprintf('%02d', $i), 'text' => strftime('%B',mktime(0,0,0,$i,1,2000)));
		}

		$today = getdate();
		for ($i=$today['year']; $i < $today['year']+10; $i++) {
		  $expires_year[] = array('id' => strftime('%y',mktime(0,0,0,1,1,$i)), 'text' => strftime('%Y',mktime(0,0,0,1,1,$i)));
		}

		$onFocus = ' onfocus="methodSelect(\'pmt-' . $this->code . '\')"';

		$failure_url = zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL');
		$success_url = zen_href_link(FILENAME_CHECKOUT_CONFIRMATION, '', 'SSL');
		
		$api_credentials = $this->get_api_credentials();
		
		if (!$api_credentials) {
			$messageStack->add_session('checkout_payment', MODULE_PAYMENT_SHIFT4_TEXT_FAILED_TESTING_CREDENTIALS, 'error');
		}	

		$branding_url = 'http://www.shift4.com/zencart_enduser';

		$selection = array(
							'id' => $this->code,
							'module' => MODULE_PAYMENT_SHIFT4_TEXT_CATALOG_TITLE,
							'fields' => array(
												array(
													'title' => '',
													'field' => '<table class="shift4-payment-form" style="margin-left: 30px; margin-top: 5px;" cellspacing="0" cellpadding="0"><tr><td style="width: 12em;">' . MODULE_PAYMENT_SHIFT4_TEXT_CREDIT_CARD_OWNER . '</td><td width="40%" rowspan="8" align="center" style="vertical-align: top;"><a href="' . $branding_url . '" title="i4Go" style="font-size: 10pt;" target="_blank"><img src="' . DIR_WS_INCLUDES . FILENAME_MODULES .'/payment/shift4/i4Go.png" /></a></td></tr><tr><td>' . zen_draw_input_field('shift4_cc_owner', $order->billing['firstname'] . ' ' . $order->billing['lastname'], 'size="25" id="'.$this->code.'-cc-owner"'. $onFocus) . '</td></tr>',
													'tag' 	=> $this->code.'-cc-owner'
													),
												array(
													'title' => '',
													'field' => '<tr><td>' . MODULE_PAYMENT_SHIFT4_TEXT_CREDIT_CARD_NUMBER . '</td></tr><tr><td>' . zen_draw_input_field('shift4_cc_number', '', 'size="25" id="' . $this->code.'-cc-number"' . $onFocus . ' autocomplete="off"') . '</td></tr>',
													'tag' 	=> $this->code . '-cc-number'
													),													
												array(
													'title' => '',
													'field' => '<tr><td>' . MODULE_PAYMENT_SHIFT4_TEXT_CREDIT_CARD_EXPIRES . '</td></tr><tr><td>' . zen_draw_pull_down_menu('shift4_cc_expires_month', $expires_month, '', 'id="' . $this->code .'-cc-expires-month"' . $onFocus) . '&nbsp;' . zen_draw_pull_down_menu('shift4_cc_expires_year', $expires_year, '', 'id="'.$this->code.'-cc-expires-year"' . $onFocus) . '</td></tr>',
													'tag' 	=> $this->code . '-cc-expires-month'
													),												
												array(
													'title' => '',
													'field' => '<tr><td>' . MODULE_PAYMENT_SHIFT4_TEXT_CVV . '</td></tr><tr><td>' . zen_draw_input_field('shift4_cc_cvv', '', 'size="4", maxlength="4"' . ' id="' . $this->code .'-cc-cvv"' . $onFocus . ' autocomplete="off"') . '<a href="' . zen_href_link(FILENAME_POPUP_CVV_HELP, '', 'SSL') . '" rel="gb_page_center[500, 500]" title="CVV help">' . MODULE_PAYMENT_SHIFT4_TEXT_POPUP_CVV_LINK . '</a></td></tr></table>',
													'tag' 	=> $this->code . '-cc-cvv'
													),										
												array(
													'title'	=> '',
													'field'	=> zen_draw_hidden_field('i4Go_AccountID', $value = $api_credentials['accountID']), 
													'tag'	=> $this->code . '-account-id'
													),
												array(
													'title' => '',
													'field' => zen_draw_hidden_field('i4Go_SiteID', $value = $api_credentials['siteID']), 
													'tag' 	=> $this->code . '-site-id'
													),
												array(
													'title'	=> '',
													'field'	=> zen_draw_hidden_field('i4Go_SuccessURL', $value = $success_url), 
													'tag'	=> $this->code . '-success-url'
													),
												array(
													'title'	=> '',
													'field'	=> zen_draw_hidden_field('i4Go_FailureURL', $value = $failure_url), 
													'tag'	=> $this->code . '-failure-url'
													),													
												array(
													'title' => '',
													'field' => zen_draw_hidden_field('i4Go_Remap_CardNumber', $value = 'shift4_cc_number'), 
													'tag' 	=> $this->code . '-map2'
													),
												array(
													'title' => '',
													'field' => zen_draw_hidden_field('i4Go_Remap_ExpirationMonth', $value = 'shift4_cc_expires_month'), 
													'tag' 	=> $this->code . '-map3'
													),
												array(
													'title' => '',
													'field' => zen_draw_hidden_field('i4Go_Remap_ExpirationYear', $value = 'shift4_cc_expires_year'), 
													'tag' 	=> $this->code . '-map4'
													),
												array(
													'title' => '',
													'field' => zen_draw_hidden_field('i4Go_Remap_CVV2Code', $value = 'shift4_cc_cvv'), 
													'tag' 	=> $this->code . '-map5'
													)
											)
							);		
		
		
		return $selection;	
	}
	
	/**
	* Convert abbreviated card type to full name
	*
	* @return string
	*/	
	function unabbreviate($abbr) {
		
		$lowercased_abbr = strtolower($abbr);
		
		switch ($lowercased_abbr) {
			case "vs":
				$result = 'Visa';
				break;			
				
			case "mc":
				$result = 'Mastercard';
				break;
				
			case "ns":
				$result = 'Discover';
				break;	
				
			case "ax":
				$result = 'American Express';
				break;
				
			case "amex":
				$result = 'American Express';
				break;	
				
			case "yc":
				$result = 'Gift Card';
				break;
				
			case "gc":
				$result = 'Gift Card';
				break;
				
			case "dc":
				$result = 'Diners Club';
				break;	
				
			case "jc":
				$result = 'JCB';
				break;

			case "jcb":
				$result = 'JCB';
				break;					
				
			default:
				$result = $abbr;				
		}
		return $result;		
	}

	
	/**
	* Display payment information on the Checkout Confirmation page
	*
	* @return array
	*/
	function confirmation() {
		global $order;
	
		// lowercase array keys to avoid problems
		$_POST = array_change_key_case($_POST, CASE_LOWER);	
		
		$card_number = '000000000000' . substr($_POST['i4go_uniqueid'], 0, 4);
		$_SESSION['unique_id'] = $_POST['i4go_uniqueid'];
		$_SESSION['cc_type'] = $this->unabbreviate($_POST['i4go_cardtype']);
		$_SESSION['cc_owner'] = $_POST['shift4_cc_owner'];
		
		$confirmation = array(
							'fields' => array(array('title' => MODULE_PAYMENT_SHIFT4_TEXT_CREDIT_CARD_TYPE,
													'field' => "&nbsp;&nbsp;" . $this->unabbreviate($_POST['i4go_cardtype'])),
											  array('title' => MODULE_PAYMENT_SHIFT4_TEXT_CREDIT_CARD_OWNER,
													'field' => '&nbsp;&nbsp;' . $_POST['shift4_cc_owner']),
											  array('title' => MODULE_PAYMENT_SHIFT4_TEXT_CREDIT_CARD_NUMBER,
													'field' => '&nbsp;&nbsp;' . str_repeat('*', (strlen($card_number) -4)) . substr($card_number, -4)),
											  array('title' => MODULE_PAYMENT_SHIFT4_TEXT_CREDIT_CARD_EXPIRES,
													'field' => '&nbsp;&nbsp;' . $_POST['i4go_expirationmonth'] .  '/' . $_POST['i4go_expirationyear'])
											)
						);
		return $confirmation;
	}
	

	/**
	* Prepare order data, manage transaction attempts
	*
	* @return boolean
	*/
	function before_process() {	
		global $db, $order;
		
		// lowercase array keys to avoid problems
		$_POST = array_change_key_case($_POST, CASE_LOWER);		
		$order->info['cc_number'] = '************' . substr($_SESSION['unique_id'], 0, 4);
		$order->info['cc_type'] = $_SESSION['cc_type'];
		$order->info['cc_owner'] = $_SESSION['cc_owner'];		
		unset($this->submit_data);		
		$product_description = '';
		$product_descriptors = array(0 => '', 1 => '', 2 => '', 3 => '');
		$_SESSION['shift4_invoice'] = (stristr(MODULE_PAYMENT_SHIFT4_ORDER_MODE, 'demo') !== FALSE) ? '' : $this->get_new_invoice();
		$api_credentials = $this->get_api_credentials();
		$order->info['total'] = number_format($order->info['total'], 2);
		
		for ($i = 0; $i < sizeof($order->products); $i++) {
		  	$product_id = $order->products[$i]['id'];
		 	$product_url = zen_href_link(FILENAME_PRODUCT_INFO, '', 'SSL') . "&amp;products_id=$product_id";
			$product_description .= $order->products[$i]['qty'] . ' x ' . "&#160;<a href=\"$product_url\">" . $order->products[$i]['name'] . '</a>&#160;' . $order->products[$i]['model'] . '<br />';
			if ($i <= 3) {$product_descriptor[$i] = $order->products[$i]['name'];}
		}
		
		//  Remove the last "\n"
		$product_description = substr(trim($product_description), 0, -2);		
		$order_time = date("F j, Y, g:i a");
	
		if (MODULE_PAYMENT_SHIFT4_TRANSACTION_MODE == 'Immediate Charge') {
			$request_code = '1D';
		} else {
			$request_code = '1B';
		}	
		
		if (!$api_credentials) {
			$this->process_parsed_result('testing credentials');
		} else {		
			$this->submit_data = array(
									'STX' => 'YES',
									'VERBOSE' => 'YES',
									'ContentType' => 'xml',
									'APIFormat' => '0',
									'APIOptions' => 'ALLDATA',
									'APISignature' => '$',
									'CVV2Indicator' => '0',
									'MerchantID' => $api_credentials['merchantID'],
									'UserName' => $api_credentials['userName'],// user knows this as 'API Username'
									'Password' => $api_credentials['password'],// user knows this as 'API Password'
									'APISerialNumber' => $api_credentials['serialNumber'],
									'CardPresent' => 'N',
									'CustomerName' => $_SESSION['customer_first_name'] . ' ' . $_SESSION['customer_last_name'],
									'CustomerReference' => $_SESSION['customer_id'],
									'DestinationZipCode' => $order->delivery['postcode'],
									'FunctionRequestCode' => $request_code,
									'Invoice' => $_SESSION['shift4_invoice'],
									'PrimaryAmount' => $order->info['total'],
									'Notes' => $product_description,
									'SaleFlag' => 'S',
									'ProductDescriptor1' => $product_descriptor[0],
									'ProductDescriptor2' => $product_descriptor[1],
									'ProductDescriptor3' => $product_descriptor[2],
									'ProductDescriptor4' => $product_descriptor[3],
									'StreetAddress' => $order->billing['street_address'],
									'UniqueID' => $_SESSION['unique_id'],
									'Vendor' => MODULE_PAYMENT_SHIFT4_MODULE_VERSION,
									'ZipCode' => $order->billing['postcode']
									);

			if (!empty($order->info['tax'])) {
				if ($order->info['tax'] != 0) {
					$this->submit_data['TaxIndicator'] = 'Y';
					$this->submit_data['TaxAmount'] = $order->info['tax'];
				}
			}	
			
			$this->submit_data['ETX'] = 'YES';
					
			$attempts = 0;
			$proceed = false;
			unset($request_result);
			
			// make up to 2 transaction attempts
			do {
				$request_result = $this->transaction_request($this->submit_data);
				$attempts++;	
				
				if (!empty($request_result) && (stripos($request_result, 'timeout') === false)) {
					$proceed = true;
					break;
				} else {
					$timeout_log_data = $this->submit_data;
					$timeout_log_data['CustomerID'] = $_SESSION['customer_id'];
					$timeout_log_data['SessionID'] = zen_session_id();
					$timeout_log_data['TransactionTime'] = date("Y-m-d H:i:s");
					$timeout_log_data['CardType'] = $order->info['cc_type'];
					$timeout_log_data['CardNumber'] = '*****' . substr($_SESSION['unique_id'], 0, 4);
					$timeout_log_data['CustomerNameLastFirst'] = $_SESSION['customer_last_name'] . ', ' . $_SESSION['customer_first_name'];
					$this->log_timeout($timeout_log_data);
				}
				
			} while ($attempts < 2);
			
			if ($proceed) {
				$parsed_result = $this->parse_transaction_response($request_result);
				$this->process_parsed_result($parsed_result);
			} else {
				$this->process_parsed_result('redirect to payment timeout error indicator');
			}			
		}
		
		return true;
	}

	/**
	* Post-process activities.
	*
	* $invoice is a string to preserve leading zeros.
	*
	* @return boolean
	*/
	function after_process() {
		global $db, $order;

		$invoice = $_SESSION['shift4_invoice'];
		$order_number_created = $_SESSION['order_number_created'];
		$order_mode = (stristr(MODULE_PAYMENT_SHIFT4_ORDER_MODE, 'demo') !== FALSE) ? 'demo - no settings needed' : strtolower(MODULE_PAYMENT_SHIFT4_ORDER_MODE);
			
		if (MODULE_PAYMENT_SHIFT4_ORDER_MODE != 'Live') {
			$message = "An order (ID $order_number_created) was made with the Shift4 module in demo mode.";
			zen_mail(STORE_NAME, STORE_OWNER_EMAIL_ADDRESS, 'Shift4 module: order made in demo mode', $message, STORE_OWNER, STORE_OWNER_EMAIL_ADDRESS);
		}
		
		$auth_only = (MODULE_PAYMENT_SHIFT4_TRANSACTION_MODE == "Immediate Charge") ? 0 : 1;
		$query_update = "
								UPDATE " . TABLE_ORDERS . "
								SET
									shift4_order_mode = :order_mode,
									shift4_invoice = :invoice,
									shift4_unique_id = :unique_id,
									shift4_is_auth_only = :auth_only
								WHERE orders_id = :order_number_created
								";
		$query_update = $db->bindVars($query_update, ':order_mode', $order_mode, 'string');
		$query_update = $db->bindVars($query_update, ':invoice', $invoice, 'string');
		$query_update = $db->bindVars($query_update, ':unique_id', $_SESSION['unique_id'], 'string');
		$query_update = $db->bindVars($query_update, ':auth_only', $auth_only, 'integer');
		$query_update = $db->bindVars($query_update, ':order_number_created', $order_number_created, 'integer');						
		$db->Execute($query_update);	
		
		$order_amount_captured = (MODULE_PAYMENT_SHIFT4_TRANSACTION_MODE == "Immediate Charge") ? $order->info['total'] : '0.00';
		
		$query_order_status = "
								INSERT INTO " . TABLE_ORDERS_STATUS_HISTORY . "
								(
									comments, 
									orders_id, 
									orders_status_id, 
									customer_notified,
									date_added,
									shift4_amount_captured
								) 
								VALUES 
								(
									'Credit Card payment. " . MODULE_PAYMENT_SHIFT4_TRANSACTION_MODE . ". Settled: $" . $order_amount_captured . "', 
									:order_number_created,
									:order_status, 
									-1,
									now(),
									" . $order_amount_captured . "
								)
								";
		$query_order_status = $db->bindVars($query_order_status, ':order_number_created', $order_number_created, 'integer');
		$query_order_status = $db->bindVars($query_order_status, ':order_status', $this->order_status, 'integer');						
		$db->Execute($query_order_status);
		
		$query_shift4_log_order_id = "
									UPDATE shift4_log
									SET
										shift4_log_order_id = :order_number_created,
										shift4_log_shift4_invoice = :invoice
									WHERE shift4_log_id = :shift4_log_id
									";
		$query_shift4_log_order_id = $db->bindVars($query_shift4_log_order_id, ':invoice', $invoice, 'string');								
		$query_shift4_log_order_id = $db->bindVars($query_shift4_log_order_id, ':order_number_created', $order_number_created, 'integer');
		$query_shift4_log_order_id = $db->bindVars($query_shift4_log_order_id, ':shift4_log_id', $this->last_shift4_log_id, 'integer');
		$db->Execute($query_shift4_log_order_id);
		
		unset($_SESSION['unique_id']);
		unset($_SESSION['cc_type']);
		unset($_SESSION['cc_owner']);
		unset($_SESSION['shift4_invoice']);
		unset($_SESSION['order_number_created']);
		unset($order_number_created);
		unset($this->last_shift4_log_id);
		unset($invoice);
		
		return false;
	}
		
	/**
	* Install the payment module and its configuration settings
	*
	* @return void
	*/
	function install() {
		global $db, $messageStack;
		
		if (defined('MODULE_PAYMENT_SHIFT4_STATUS')) {
			$messageStack->add_session('Shift4 module is already installed.', 'error');
			zen_redirect(zen_href_link(FILENAME_MODULES, 'set=payment&module=shift4', 'NONSSL'));
			return 'failed';
		}
		
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enable Shift4 Module', 'MODULE_PAYMENT_SHIFT4_STATUS', 'Enabled', 'Enable Shift4 module to accept and process credit card payments. ', '6', '0', 'zen_cfg_select_option(array(\'Enabled\', \'Disabled\'), ', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('i4Go Account ID', 'MODULE_PAYMENT_SHIFT4_I4GO_LOGIN_PRODUCTION', '', 'Your i4Go account ID provided by Shift4.', '6', '0', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('i4Go Site ID', 'MODULE_PAYMENT_SHIFT4_I4GO_SITE_PRODUCTION', '', 'Your i4Go site ID provided by Shift4.', '6', '0', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Processing Mode', 'MODULE_PAYMENT_SHIFT4_ORDER_MODE', 'Demo - no settings needed', '\"Demo\" mode allows you to test the module without entering any settings or creating any Shift4 accounts. While in \"Demo\" mode, transactions will be sent to a demo processor. Demo transactions will not be viewable in Dollars on the Net.<br /><br />While in \"Live\" mode, transactions will be sent to a live processor. Live transactions will be viewable at <a href=\"http://www.dollarsonthenet.net\" target=\"_blank\">http://www.dollarsonthenet.net</a>.', '6', '0', 'zen_cfg_select_option(array(\'Demo - no settings needed\', \'Live\'), ', now())");
		//$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Processing Mode', 'MODULE_PAYMENT_SHIFT4_ORDER_MODE', 'Demo - no settings needed', '\"Demo\" mode allows you to test the module without entering any settings or creating any Shift4 accounts. While in \"Demo\" mode, transactions will be sent to a demo processor. Demo transactions will not be viewable in Dollars on the Net.<br /><br />\"Testing mode\" requires additional settings from Shift4; see the readme file for more information.<br /><br />While in \"Live\" mode, transactions will be sent to a live processor. Live transactions will be viewable at <a href=\"http://www.dollarsonthenet.net\" target=\"_blank\">http://www.dollarsonthenet.net</a>.', '6', '0', 'zen_cfg_select_option(array(\'Demo - no settings needed\', \'Testing\', \'Live\'), ', now())"); // To enable "testing" mode, uncomment this line, comment out the nearly identical line above, uninstall the module, and reinstall the module.
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort order of display.', 'MODULE_PAYMENT_SHIFT4_SORT_ORDER', '0', 'The order of display for this payment option (1-first, 2-second, and so on). Entering \'0\' defaults to alphabetical order.', '6', '0', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Payment Zone Restriction', 'MODULE_PAYMENT_SHIFT4_ZONE', '0', 'If a zone is selected, this payment module will only be enabled for that zone. A setting of \"--none--\" allows payments from any location.', '6', '2', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) VALUES ('Set Order Status', 'MODULE_PAYMENT_SHIFT4_ORDER_STATUS_ID', '0', 'Set the default status of orders made with this payment module.', '6', '0', 'zen_cfg_pull_down_order_statuses(', 'zen_get_order_status_name', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Debug Mode', 'MODULE_PAYMENT_SHIFT4_DEBUGGING', 'Off', 'Enabling debug mode logs information about each failed transaction in a separate file in the Cache folder and can be emailed to the store owner. These files can be deleted manually, or in the Store Manager page (Tools > Store Manager: \'Cleanup Debug Log Files\')', '6', '0', 'zen_cfg_select_option(array(\'Off\', \'Log File\', \'Log and Email\'), ', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, set_function, use_function) VALUES ('API Password', 'MODULE_PAYMENT_SHIFT4_PASSWORD_PRODUCTION', '', 'Your API password provided by Shift4.', '6', '0', now(), 'zen_cfg_password_input_no_autocomplete(', 'zen_cfg_password_display')");	// user knows this as 'API Password'
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Account Number', 'MODULE_PAYMENT_SHIFT4_SERIAL_NUMBER_PRODUCTION', '', 'Your Account Number provided by Shift4.', '6', '0', now())"); // also known as Serial Number
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Merchant ID', 'MODULE_PAYMENT_SHIFT4_MERCHANT_ID_PRODUCTION', '', 'Your Merchant ID provided by Shift4.', '6', '0', now())");  	
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enforce Address Validation', 'MODULE_PAYMENT_SHIFT4_ENFORCE_AVS', 'Do not enforce', 'Set to \'Enforce\' to automatically void the transaction and cancel the order if shopper\'s payment information fails the address validation. The shopper will be returned to the payment page with an error message.', '6', '0', 'zen_cfg_select_option(array(\'Enforce\', \'Do not enforce\'), ', now())"); 
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Transaction Mode', 'MODULE_PAYMENT_SHIFT4_TRANSACTION_MODE', 'Book and Ship', '\'Immediate Charge'' authorizes and finalizes the transaction. \'Book and Ship\' authorizes the funds and will allow you to manually settle the transaction at <a href=\"http://www.dollarsonthenet.net\">http://www.dollarsonthenet.net</a>. <br /><br />The \'Book and Ship\' option is often used when a merchant bills the shopper after shipment. Settlements should be done within a limited number of days of the original authorization to avoid expiration of the authorization hold.', '6', '0', 'zen_cfg_select_option(array(\'Book and Ship\', \'Immediate Charge\'), ', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('API Username', 'MODULE_PAYMENT_SHIFT4_USERNAME_PRODUCTION', '', 'Your API username provided by Shift4.', '6', '0', now())");  // user knows this as 'API Username'
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Log Gateway Data', 'MODULE_PAYMENT_SHIFT4_LOG_GATEWAY', 'No', 'Set to \'Yes\' if you want to save all gateway communications data to the database. The database table is named \"shift4_log\" and will be viewable using phpMyAdmin.', '6', '0', 'zen_cfg_select_option(array(\'Yes\', \'No\'), ', now())");

		$qry_find_shift4_voided = $db->Execute("
											SELECT column_name 
											FROM information_schema.columns 
											WHERE column_name = 'shift4_is_voided' 
											AND table_name = '" . TABLE_ORDERS_STATUS_HISTORY . "'
											AND table_schema = '" . DB_DATABASE . "'
											");
				
		if ($qry_find_shift4_voided->RecordCount() == 0) {		
			$db->Execute("
						ALTER TABLE " . TABLE_ORDERS_STATUS_HISTORY . " 
						ADD shift4_is_voided BIT(1) NOT NULL DEFAULT b'0'
						");
		}			
		
		$qry_find_shift4_partial_capture = $db->Execute("
											SELECT column_name 
											FROM information_schema.columns 
											WHERE column_name = 'shift4_is_partial_capture' 
											AND table_name = '" . TABLE_ORDERS_STATUS_HISTORY . "'
											AND table_schema = '" . DB_DATABASE . "'
											");
				
		if ($qry_find_shift4_partial_capture->RecordCount() == 0) {		
			$db->Execute("
						ALTER TABLE " . TABLE_ORDERS_STATUS_HISTORY . " 
						ADD shift4_is_partial_capture BIT(1) NOT NULL DEFAULT b'0'
						");
		}		
		
		$qry_find_shift4_capture_amount = $db->Execute("
											SELECT column_name 
											FROM information_schema.columns 
											WHERE column_name = 'shift4_amount_captured' 
											AND table_name = '" . TABLE_ORDERS_STATUS_HISTORY . "'
											AND table_schema = '" . DB_DATABASE . "'
											");
				
		if ($qry_find_shift4_capture_amount->RecordCount() == 0) {		
			$db->Execute("
						ALTER TABLE " . TABLE_ORDERS_STATUS_HISTORY . "
						ADD shift4_amount_captured DECIMAL( 14, 2 ) NOT NULL 
						");
		}		

		$qry_find_shift4_refunded_amount = $db->Execute("
											SELECT column_name 
											FROM information_schema.columns 
											WHERE column_name = 'shift4_amount_refunded' 
											AND table_name = '" . TABLE_ORDERS_STATUS_HISTORY . "'
											AND table_schema = '" . DB_DATABASE . "'
											");
				
		if ($qry_find_shift4_refunded_amount->RecordCount() == 0) {		
			$db->Execute("
						ALTER TABLE " . TABLE_ORDERS_STATUS_HISTORY . "
						ADD shift4_amount_refunded DECIMAL( 14, 2 ) NOT NULL 
						");
		}
		
		$qry_find_shift4_mode = $db->Execute("
											SELECT column_name 
											FROM information_schema.columns 
											WHERE column_name = 'shift4_order_mode' 
											AND table_name = '" . TABLE_ORDERS . "'
											AND table_schema = '" . DB_DATABASE . "'
											");
				
		if ($qry_find_shift4_mode->RecordCount() == 0) {		
			$db->Execute("
						ALTER TABLE " . TABLE_ORDERS . " 
						ADD shift4_order_mode ENUM( 'demo - no settings needed', 'testing', 'live' ) NULL DEFAULT NULL
						");
		}	

		$qry_find_shift4_transaction_mode = $db->Execute("
														SELECT column_name 
														FROM information_schema.columns 
														WHERE column_name = 'shift4_is_auth_only' 
														AND table_name = '" . TABLE_ORDERS . "'
														AND table_schema = '" . DB_DATABASE . "'
														");
				
		if ($qry_find_shift4_transaction_mode->RecordCount() == 0) {		
			$db->Execute("
						ALTER TABLE " . TABLE_ORDERS . " 
						ADD shift4_is_auth_only BIT(1) NOT NULL DEFAULT b'0'
						");
		}	
		
		$qry_find_shift4_invoice = $db->Execute("
												SELECT column_name 
												FROM information_schema.columns 
												WHERE column_name = 'shift4_invoice' 
												AND table_name = '" . TABLE_ORDERS . "'
												AND table_schema = '" . DB_DATABASE . "'
												");
				
		if ($qry_find_shift4_invoice->RecordCount() == 0) {		
			// The data type is varchar because we want the leading zeros
			$db->Execute("
						ALTER TABLE " . TABLE_ORDERS . " 
						ADD shift4_invoice VARCHAR(11) NULL DEFAULT NULL
						");
		}		

		$qry_find_shift4_unique_id = $db->Execute("
											SELECT column_name 
											FROM information_schema.columns 
											WHERE column_name = 'shift4_unique_id' 
											AND table_name = '" . TABLE_ORDERS . "'
											AND table_schema = '" . DB_DATABASE . "'
											");
				
		if ($qry_find_shift4_unique_id->RecordCount() == 0) {		
			// The data type is varchar because we want the leading zeros
			$db->Execute("
						ALTER TABLE " . TABLE_ORDERS . " 
						ADD shift4_unique_id VARCHAR(16) NULL DEFAULT NULL
						");
		}	
		
		$qry_find_shift4_table = $db->Execute("
										   SELECT table_name 
										   FROM information_schema.tables
										   WHERE table_name = 'shift4_invoices'
										   AND table_schema = '" . DB_DATABASE . "'
										   ");
				
		if ($qry_find_shift4_table->RecordCount() == 0) {
			$db->Execute("
						CREATE TABLE shift4_invoices
						(
							shift4_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
						)
						");
		}	
		
		$qry_find_shift4_logging = $db->Execute("
										   SELECT table_name 
										   FROM information_schema.tables
										   WHERE table_name = 'shift4_log'
										   AND table_schema = '" . DB_DATABASE . "'
										   ");
				
		if ($qry_find_shift4_logging->RecordCount() == 0) {
			$db->Execute("
						CREATE TABLE shift4_log
						(
							shift4_log_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
							shift4_log_time DATETIME NOT NULL,
							shift4_log_customer_id INT NOT NULL,
							shift4_log_customer_name VARCHAR(35) NOT NULL,
							shift4_log_order_id INT NULL,
							shift4_log_shift4_invoice VARCHAR(11) NOT NULL,
							shift4_log_request_code VARCHAR(2) NOT NULL,
							shift4_log_response_code VARCHAR(1) NULL DEFAULT NULL,
							shift4_log_error_indicator VARCHAR(1) NOT NULL,		
							shift4_log_error_text VARCHAR(100) NULL DEFAULT NULL,
							shift4_log_sent TEXT NOT NULL,
							shift4_log_received TEXT NOT NULL,
							shift4_log_session_id VARCHAR(128) NOT NULL,						
							shift4_log_transaction_time VARCHAR(7) NOT NULL
							)
						");
		}
		
		$qry_find_shift4_timeout_log = $db->Execute("
												   SELECT table_name 
												   FROM information_schema.tables
												   WHERE table_name = 'shift4_timeout_log'
												   AND table_schema = '" . DB_DATABASE . "'
												   ");
				
		if ($qry_find_shift4_timeout_log->RecordCount() == 0) {
			$db->Execute("
						CREATE TABLE  shift4_timeout_log 
						(
							shift4_timeout_log_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
							shift4_timeout_log_time DATETIME NOT NULL,
							shift4_timeout_log_customer_id INT(11) NOT NULL,
							shift4_timeout_log_customer_name VARCHAR(50) NOT NULL,
							shift4_timeout_log_invoice VARCHAR(11) NOT NULL,
							shift4_timeout_log_request_code VARCHAR(2) NOT NULL,
							shift4_timeout_log_session_id VARCHAR(128) NOT NULL,
							shift4_timeout_log_notes TEXT NOT NULL,
							shift4_timeout_log_amount DECIMAL(14, 2) NOT NULL,
							shift4_timeout_log_cardtype VARCHAR(32) NOT NULL,
							shift4_timeout_log_cardnumber VARCHAR(32) NOT NULL
						)
						");
		}	

		$cache_directory = DIR_FS_SQL_CACHE . '/Shift4';
		
		if (!file_exists($cache_directory)) {
			$mkdir_result = mkdir($cache_directory);
		}
	}
	
	/**
	* Remove the module and all its settings
	*
	* @return void
	*/
	function remove() {
		global $db;
		$db->Execute("
					DELETE FROM " . TABLE_CONFIGURATION . " 
					WHERE configuration_key IN ('" . implode("', '", $this->keys()) . "')
					");
	}
	
	/**
	* This is what is shown in the module administration, in this order.
	*
	* @return array
	*/
	function keys() {
		return array(				
					'MODULE_PAYMENT_SHIFT4_STATUS', 	
					'MODULE_PAYMENT_SHIFT4_ORDER_MODE',					
					'MODULE_PAYMENT_SHIFT4_I4GO_LOGIN_PRODUCTION',
					'MODULE_PAYMENT_SHIFT4_I4GO_SITE_PRODUCTION',					
					'MODULE_PAYMENT_SHIFT4_SERIAL_NUMBER_PRODUCTION',					
					'MODULE_PAYMENT_SHIFT4_USERNAME_PRODUCTION', // user knows this as 'API Username'					
					'MODULE_PAYMENT_SHIFT4_PASSWORD_PRODUCTION', // user knows this as 'API Password'
					'MODULE_PAYMENT_SHIFT4_MERCHANT_ID_PRODUCTION',
					'MODULE_PAYMENT_SHIFT4_ENFORCE_AVS',
					'MODULE_PAYMENT_SHIFT4_TRANSACTION_MODE',
					'MODULE_PAYMENT_SHIFT4_SORT_ORDER', 
					'MODULE_PAYMENT_SHIFT4_ZONE', 
					'MODULE_PAYMENT_SHIFT4_ORDER_STATUS_ID', 
					'MODULE_PAYMENT_SHIFT4_LOG_GATEWAY',
					'MODULE_PAYMENT_SHIFT4_DEBUGGING'
					); 
	}  
	
	/**
	* Check to see whether module is installed
	*
	* @return boolean
	*/
	function check() {
		global $db;
		
		if (!isset($this->_check)) {
			$check_query = $db->Execute("
										SELECT configuration_value 
										FROM " . TABLE_CONFIGURATION . " 
										WHERE configuration_key = 'MODULE_PAYMENT_SHIFT4_STATUS'
										");
			$this->_check = $check_query->RecordCount();
		}
		
		return $this->_check;
	}
	
	/**
	 * Determines if error code is in a certain list of codes, including any code that begins with "2"
	 * 
	 * @param string $error_code
	 * @return void
	*/	
	function check_error_code($error_code) {
		$code_list = array('1001','9033','9489','9901','9902','9951','9960','9961','9962','9964','9978','4003');
		
		if (in_array($error_code, $code_list)) {
			return true;
		} elseif (substr($error_code, 0, 1) == '2') {
			return true;
		} else {
			return false;	
		}
	}	
	
	/**
	 * Check for i4go_responsecode
	 * 
	 * @return void
	 */	
	 function check_i4go_response() {
	 	global $messageStack;
		$misconfiguration = false;
		$description = false;
		$message = '';
		
		// lowercase array keys to avoid problems
		$_POST = array_change_key_case($_POST, CASE_LOWER);
		
		// account for i4Go using either GET or POST
		$lowercase_GET = array_change_key_case($_GET, CASE_LOWER);
		$_POST = array_merge($_GET, $_POST);
			
		if (isset($_POST['i4go_responsecode'])) {	
			$message = MODULE_PAYMENT_SHIFT4_TEXT_DECLINED_MESSAGE;		
			$i4go_error_codes = explode(",", str_ireplace(" ", "", $_POST['i4go_responsecode']));
			
			foreach ($i4go_error_codes as $key => $value) {
				//codes >= 299 indicate configuration problems or Shift4 server problems
				if ($value >= 299) {
					$misconfiguration = true;
				}elseif ($value == 201) {
					$wrong_card_type = true;
				}
			}
			
			// attempt to load xml file with descriptions of each error code
			$error_code_descriptions_xml = file_get_contents('https://certify.i4go.com/api/i4goresponsecodes.xml');		
			$i4go_response_description = array();
			$log_data = '';
			
			if ($error_code_descriptions_xml) {
				// get error description based on error code
				if (simplexml_load_string($error_code_descriptions_xml)) {
					$i4go_response_code_list = simplexml_load_string($error_code_descriptions_xml);
					$length = count($i4go_response_code_list);
					$length--;					
					
					for ($i=0; $i<=$length; $i++) {
						try {
							foreach ($i4go_error_codes as $key => $value) {
								if ($i4go_response_code_list->responsecode[$i]->attributes()->value == $value) {
									$log_data .= 'i4Go response code ' . $i4go_response_code_list->responsecode[$i]->attributes()->value . ': ' . $i4go_response_code_list->responsecode[$i]->attributes()->desc . '. ';	
									$i4go_response_description[(int) $i4go_response_code_list->responsecode[$i]->attributes()->value] = $i4go_response_code_list->responsecode[$i]->attributes()->desc;
								}	
							}
						} catch (Exception $e) {	
							$exception_message = $e->getMessage();
							
							if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
								$this->i4Go_debug_data .= 'Caught exception while matching response code with description: ' . $exception_message . '. ';
							}
						}	
					}
				}
			}			

			if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {

				// Prevent duplicate logging, as Zen Cart calls selection() several times while rendering checkout_payment.
				if (empty($_SESSION['selection_count'])){
					$_SESSION['selection_count'] = 1;
				} else {
					$_SESSION['selection_count']++;
				}

				if ($_SESSION['selection_count'] == 2) {
				
					if (!empty($i4go_response_description)) {
						$description = true;
						reset($i4go_response_description);
					}				
				
					if (empty($log_data)) {
						$this->i4Go_debug_data = 'i4Go response code(s): ' . $_POST['i4go_responsecode'];
					} else {
						$this->i4Go_debug_data = $log_data;
					}
		
					$this->log_failed_transaction($this->i4Go_debug_data);					
					
					if ($misconfiguration) {
						if ($description) {
							$body = 'i4Go error: ' . current($i4go_response_description);
						} else {
							foreach ($i4go_error_codes as $key => $value) {
								$error_codes .= $value . ', ';
							}
							
							// remove last ","
							$error_codes = substr(trim($error_codes), 0, -1);	
							$body = 'i4Go error code(s): ' . $error_codes;
						}
						
						zen_mail(STORE_NAME, STORE_OWNER_EMAIL_ADDRESS, 'Shift4 module: misconfiguration or gateway error', $body, STORE_OWNER, STORE_OWNER_EMAIL_ADDRESS);
					} else {
						if ($description) {$message = current($i4go_response_description);}
					}
				}
				
				if ($_SESSION['selection_count'] == 2) {
					unset($_SESSION['selection_count']);
				}
			}
			
			if ($misconfiguration) {
				$message = MODULE_PAYMENT_SHIFT4_TEXT_TIMEOUT_MESSAGE;
			}elseif ($wrong_card_type) {
				$message = 'That credit card type is not accepted. Please use another credit card.';
			} 
			if (!empty($message)) {$messageStack->add('checkout_payment', $message, 'error');}
		}

	 }

	/**
	 * Log transaction timeouts.
	 * 
	 * @param string $timeout_data
	 * @return void
	 */
	function log_timeout($timeout_data) {
		global $db;
		$query_shift4_timeout_log = "
									INSERT INTO shift4_timeout_log
									(									
										shift4_timeout_log_time,	
										shift4_timeout_log_customer_id,
										shift4_timeout_log_customer_name,										
										shift4_timeout_log_invoice,
										shift4_timeout_log_request_code,
										shift4_timeout_log_session_id,
										shift4_timeout_log_notes,
										shift4_timeout_log_amount,
										shift4_timeout_log_cardtype,
										shift4_timeout_log_cardnumber
									)
									VALUES
									(
										:time,
										:customer_id,
										:customer_name,
										:invoice,
										:request_code,
										:session_id,
										:notes,
										:amount,
										:cardtype,
										:cardnumber
									)
									";
					
		$query_shift4_timeout_log = $db->bindVars($query_shift4_timeout_log, ':customer_id', $timeout_data['CustomerID'], 'integer');	
		$query_shift4_timeout_log = $db->bindVars($query_shift4_timeout_log, ':customer_name', $timeout_data['CustomerNameLastFirst'], 'string');	
		$query_shift4_timeout_log = $db->bindVars($query_shift4_timeout_log, ':invoice', $timeout_data['Invoice'], 'string');	
		$query_shift4_timeout_log = $db->bindVars($query_shift4_timeout_log, ':request_code', $timeout_data['FunctionRequestCode'], 'string');	
		$query_shift4_timeout_log = $db->bindVars($query_shift4_timeout_log, ':session_id', $timeout_data['SessionID'], 'string');
		$query_shift4_timeout_log = $db->bindVars($query_shift4_timeout_log, ':notes', $timeout_data['Notes'], 'string');
		$query_shift4_timeout_log = $db->bindVars($query_shift4_timeout_log, ':time', date("Y-m-d H:i:s"), 'string');
		$query_shift4_timeout_log = $db->bindVars($query_shift4_timeout_log, ':amount', $timeout_data['PrimaryAmount'], 'float');
		$query_shift4_timeout_log = $db->bindVars($query_shift4_timeout_log, ':cardnumber', $timeout_data['CardNumber'], 'string');
		$query_shift4_timeout_log = $db->bindVars($query_shift4_timeout_log, ':cardtype', $timeout_data['CardType'], 'string');
		$db->Execute($query_shift4_timeout_log);
	}	


	
	/**
	 * Create text file log of failed transactions, email log to store owner.
	 * 
	 * @param string $log_data
	 * @return void
	 */
	function log_failed_transaction($log_data = '[no data was provided]') {				
		$key = date("m-j-Y_H-i-s") . substr(microtime(), 1, 6);
		$log_folder = DIR_FS_SQL_CACHE . '/Shift4';
		
		if (!is_dir($log_folder)) {
			mkdir($log_folder);		
		}
		
		$log_file = $log_folder . '/Shift4_' . $key . '.log';
		
		try {
			$fh = fopen($log_file, "a");
			$log_data = '[' . date("F-j-Y g:i:s") . '] ' . $log_data . PHP_EOL;
			fwrite($fh, $log_data);
			fclose($fh);	
		} catch (Exception $e) {
			$exception_message = 'There was an error creating the log file: ' . $e->getMessage();
			$log_data = $exception_message . PHP_EOL . $log_data;
		}
		
		if (MODULE_PAYMENT_SHIFT4_DEBUGGING == 'Log and Email') {
			zen_mail(STORE_NAME, STORE_OWNER_EMAIL_ADDRESS, 'Shift4 module: failed transaction', $log_data, STORE_OWNER, STORE_OWNER_EMAIL_ADDRESS);
		}

		unset($this->Shift4_debug_data);
		unset($this->i4Go_debug_data);
	}	

	/**
	 * Log all gateway communications.
	 * 
	 * @param string $db_log_data
	 * @return void
	 */
	function log_gateway_data($db_log_data) {
		global $db;

		if (MODULE_PAYMENT_SHIFT4_LOG_GATEWAY == "Yes") {	
			$query_shift4_db_logging = "
										INSERT INTO shift4_log
										(						
											shift4_log_time,
											shift4_log_customer_id,
											shift4_log_customer_name,
											shift4_log_shift4_invoice,
											shift4_log_request_code,
											shift4_log_response_code,
											shift4_log_error_indicator,
											shift4_log_error_text,
											shift4_log_sent,
											shift4_log_received,
											shift4_log_session_id,	
											shift4_log_transaction_time							
										)
										VALUES
										(	
											:log_time,
											:customer_id,
											:customer_name,
											:invoice,
											:request_code,
											:response_code,
											:error_indicator,
											:error_text,
											:sent,
											:received,
											:session_id,
											:transaction_time						
										)
										";
						
			$query_shift4_db_logging = $db->bindVars($query_shift4_db_logging, ':log_time', date("Y-m-d H:i:s"), 'string');				
			$query_shift4_db_logging = $db->bindVars($query_shift4_db_logging, ':customer_id', $db_log_data['customer_id'], 'integer');	
			$query_shift4_db_logging = $db->bindVars($query_shift4_db_logging, ':customer_name', $db_log_data['customer_name'], 'string');	
			$query_shift4_db_logging = $db->bindVars($query_shift4_db_logging, ':invoice', $db_log_data['invoice'], 'string');	
			$query_shift4_db_logging = $db->bindVars($query_shift4_db_logging, ':request_code', $db_log_data['request_code'], 'string');	
			$query_shift4_db_logging = $db->bindVars($query_shift4_db_logging, ':response_code', $db_log_data['response_code'], 'string');	
			$query_shift4_db_logging = $db->bindVars($query_shift4_db_logging, ':error_indicator', $db_log_data['error_indicator'], 'string');	
			$query_shift4_db_logging = $db->bindVars($query_shift4_db_logging, ':error_text', $db_log_data['error_text'], 'string');	
			$query_shift4_db_logging = $db->bindVars($query_shift4_db_logging, ':sent', $db_log_data['sent'], 'string');	
			$query_shift4_db_logging = $db->bindVars($query_shift4_db_logging, ':received', $db_log_data['received'], 'string');
			$query_shift4_db_logging = $db->bindVars($query_shift4_db_logging, ':session_id', $db_log_data['session_id'], 'string');
			$query_shift4_db_logging = $db->bindVars($query_shift4_db_logging, ':transaction_time', $db_log_data['transaction_time'], 'string');			
			$db->Execute($query_shift4_db_logging);

			$this->last_shift4_log_id = mysql_insert_id();
		}
		
		unset($this->db_log_data);		
	}	

	/**
	 * Redirect user to payment page with message
	 * 
	 * @param string $type
	 * @return void
	 */
	function redirect_to_payment($type = '') {
		global $messageStack;
		
		switch ($type) {
			case "timeout":
				$messageStack->add_session('checkout_payment', MODULE_PAYMENT_SHIFT4_TEXT_TIMEOUT_MESSAGE, 'error');
				break;
				
			case "avs":
				$messageStack->add_session('checkout_payment', MODULE_PAYMENT_SHIFT4_TEXT_DECLINED_AVS_MESSAGE, 'error');
				break;
				
			case "testing credentials":	
				$messageStack->add_session('checkout_payment', MODULE_PAYMENT_SHIFT4_TEXT_FAILED_TESTING_CREDENTIALS, 'error');
				break;
				
			default:
				$messageStack->add_session('checkout_payment', MODULE_PAYMENT_SHIFT4_TEXT_DECLINED_MESSAGE, 'error');
				break;
		}
		
		zen_redirect(zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL', true, false));		
	}
	
	/*
	* Transaction Request
	*
	* @param array $request_data_array
	* @param string $order_mode
	* @return string		
	*/
	function transaction_request($request_data_array, $order_mode = '') {			
		set_time_limit(65);
		unset($response);
		$result = '';
		$sanitized_log_data = $this->sanitize_array($request_data_array);
		$this->Shift4_debug_data .= PHP_EOL . 'Transaction request data:' . PHP_EOL . "\t " . $this->newline_print_r($sanitized_log_data);	
		
		if (MODULE_PAYMENT_SHIFT4_LOG_GATEWAY == "Yes") {
			foreach ($sanitized_log_data as $key => $value) {
					$request_data_readable .= $key . ' = ' . $value . PHP_EOL;
			}
			
			$this->db_log_data['sent'] = $request_data_readable;
			$this->db_log_data['request_code'] = $request_data_array['FunctionRequestCode'];
			$this->db_log_data['customer_name'] = $this->submit_data['CustomerName'];
			$this->db_log_data['customer_id'] = $_SESSION['customer_id'];
			$this->db_log_data['session_id'] = zen_session_id();
		}	
		
		// format array: key=value&key=value
		while(list($key, $value) = each($request_data_array)) {
			$request_data_string .= $key . '=' . urlencode(str_replace(',', '', $value)) . '&';
		}
		
		// Remove the last "&"
		$request_data_string = substr(trim($request_data_string), 0, -1);	

		if (MODULE_PAYMENT_SHIFT4_ORDER_MODE != 'Live' || (!empty($order_mode) && $order_mode != 'live')) {
			$url = 'https://certify.dollarsonthenet.net' . MODULE_PAYMENT_SHIFT4_URL_PATH;		  
		} elseif (isset($server)) {
			if ($server < 12) {
				$server++;
			} else {
				$server = 1;
			}
			$url = 'https://server' . $server . '.dollarsonthenet.net' . MODULE_PAYMENT_SHIFT4_URL_PATH;
		} else {
			// there are 12 Shift4 servers
			$server = mt_rand(1,12);
			$url = 'https://server' . $server . '.dollarsonthenet.net' . MODULE_PAYMENT_SHIFT4_URL_PATH;	
		}		

		try {
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_VERBOSE, 0);
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $request_data_string);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); /* compatibility for SSL communications on some Windows servers (IIS 5.0+) */
			curl_setopt($ch, CURLOPT_TIMEOUT, 30);
			
			if (CURL_PROXY_REQUIRED == 'True') {
			  $proxy_tunnel_flag = (defined('CURL_PROXY_TUNNEL_FLAG') && strtoupper(CURL_PROXY_TUNNEL_FLAG) == 'false') ? false : true;
			  curl_setopt ($ch, CURLOPT_HTTPPROXYTUNNEL, $proxy_tunnel_flag);
			  curl_setopt ($ch, CURLOPT_PROXYTYPE, CURLPROXY_HTTP);
			  curl_setopt ($ch, CURLOPT_PROXY, CURL_PROXY_SERVER_DETAILS);
			}
		
			$response = trim(curl_exec($ch));
			$commError = curl_error($ch);
			$commInfo = @curl_getinfo($ch);
			curl_close ($ch);
			
			$curl_time = $commInfo['total_time'];
			
			if (empty($commError)) {$commError = 'none';}
			
			if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
				$this->Shift4_debug_data .= PHP_EOL . 'Transaction URL: ' . $commInfo['url'] . PHP_EOL . 'Transaction time: ' . $curl_time . ' seconds' . PHP_EOL . 'cURL error: ' . $commError  . PHP_EOL . 'Response:' . PHP_EOL . "\t " . $response;		
			}
			
			$result = $response;
		} catch(Exception $e) {	
			$exception_message = $e->getMessage();
			
			if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
				$this->Shift4_debug_data .= PHP_EOL . 'Caught exception: ' . $exception_message;
			}				
			
			$result = 'timeout';
		}
		
		if (MODULE_PAYMENT_SHIFT4_LOG_GATEWAY == "Yes") {		
			$parsed_xml = simplexml_load_string($response);
			$this->db_log_data['response_code'] = strtoupper($parsed_xml->responsecode);
			$this->db_log_data['error_indicator'] = strtoupper($parsed_xml->errorindicator);
			$this->db_log_data['error_text'] = strtoupper($parsed_xml->errortext);				
			$this->db_log_data['received'] = $response;
			$this->db_log_data['transaction_time'] = $curl_time;
			$this->db_log_data['invoice'] = $request_data_array['Invoice'];
			$this->log_gateway_data($this->db_log_data);
			$_SESSION['get_invoice_log_id'] = mysql_insert_id();			
			$_SESSION['demo_invoice'] = (string) $parsed_xml->invoice;
			}	
				
		return $result;
	}

	/**
	 * Parse Transaction Response
	 * 
	 * @param string $response_xml
	 * @return string
	 */
	function parse_transaction_response($response_xml) {
		global $order;
		
		$parsed_xml = simplexml_load_string($response_xml);
		
		if (!$parsed_xml) {
			$this->Shift4_error_response = $response_xml;
			return 'gateway error';
		}
		
		$xml_text = strtoupper($parsed_xml->xmltext);
		
		if ($xml_text != 'OK') {
			$this->Shift4_error_response = $xml_text;
			return 'gateway error';
		}
		
		$response_code = strtoupper($parsed_xml->responsecode);
		$error_indicator = strtoupper($parsed_xml->errorindicator);
		$request_code = strtoupper($parsed_xml->functionrequestcode);
		$valid_avs = strtoupper($parsed_xml->validavs);
		$cvv2_valid = strtoupper($parsed_xml->cvv2valid);
		$error_code = strtoupper($parsed_xml->primaryerrorcode);
		$sale_flag = strtoupper($parsed_xml->saleflag);
		$long_error = strtoupper($parsed_xml->longerror);
		$primary_error_code = strtoupper($parsed_xml->primaryerrorcode);
		$primary_amount = $parsed_xml->primaryamount;
		$_SESSION['auth_code'] = (string) $parsed_xml->authorization;
		$_SESSION['receipt_text'] = (string) $parsed_xml->receipttext;
		$api_options = strtoupper($parsed_xml->apioptions);
		$invoice = (string) $parsed_xml->invoice;
		
		if (stristr(MODULE_PAYMENT_SHIFT4_ORDER_MODE, 'demo') !== FALSE) {$_SESSION['shift4_invoice'] = $invoice;}
		
		if (($request_code == '1D') || ($request_code == '1B')) {
			if ($sale_flag == 'S') {
				if ($error_indicator == 'N') {
					if (($response_code == 'A') || ($response_code == 'C')) {
						if ($cvv2_valid == 'N') {	
							return 'send void';
						} else if ($valid_avs == 'N' && MODULE_PAYMENT_SHIFT4_ENFORCE_AVS == 'Enforce') {							
							return 'send void avs';
						} else {
							return 'authorized';
						}
					}
				} else {			
					if (!$this->check_error_code($error_code)) {	
						return 'send void';
					} else {								
						return 'redirect to payment timeout error indicator';
					}		
				}
			} elseif ($sale_flag == 'C') {
				if ($error_indicator == 'N') {	
					return 'credit successful';		
				} else {
					return 'credit failed';	
				}
			} else {
				return 'unknown error';
			}
		} elseif ($request_code == '08') {
			if ($error_indicator == 'N') {
				return 'redirect to payment declined void successful';		
			} else {
				return 'redirect to payment declined void failed';	
			}
		} elseif ($request_code == '07') {
			if ($error_indicator == 'N') {
				return 'get invoice success';
			} elseif (($primary_error_code == 9815) || (stripos($long_error, 'invoice not found') !== false)) {
				return 'get invoice not found';
			} else {
				return 'get invoice other failure';
			}				
		} else {		
			return 'unknown error';				
		}		
	}	
	
	
	/*
	* Acts on the parsed result of the transaction request and calls logging methods
	*
	* @param string $parsed_result
	* @return boolean	
	*/	
	function process_parsed_result($parsed_result) {
		switch($parsed_result) {
			case "authorized":
				break;
			
			case "send void":
				$api_credentials = $this->get_api_credentials();
				
				if (!$api_credentials) {
					$this->process_parsed_result('testing credentials');
				} else {	
					$void_data = array(
										'STX' => 'YES',
										'APIFormat' => '0',
										'APISignature' => '$',
										'ContentType' => 'xml',
										'MerchantID' => $api_credentials['merchantID'],
										'UserName' => $api_credentials['userName'],// user knows this as 'API Username'
										'Password' => $api_credentials['password'],// user knows this as 'API Password'
										'APISerialNumber' => $api_credentials['serialNumber'],
										'FunctionRequestCode' => '08',
										'Invoice' => $_SESSION['shift4_invoice'],
										'UniqueID' => $_SESSION['unique_id'],
										'Vendor' => MODULE_PAYMENT_SHIFT4_MODULE_VERSION,
										'ETX' => 'YES'								
										);	
										
					if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
						$this->Shift4_debug_data .= PHP_EOL . 'Prepare to send void request.';
						$this->Shift4_debug_data .= PHP_EOL . 'Send void request.';
					}		
					
					unset($result);
					$result = $this->transaction_request($void_data);

					if (!empty($result) && (stripos($result, 'timeout') === false)) {
						$parsed_response_result = $this->parse_transaction_response($result);
						$this->process_parsed_result($parsed_response_result);
					} else {
						$this->redirect_to_payment('timeout');
					}	
				}
				break;
			
			case "send void avs":
				if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
					$this->Shift4_debug_data .= PHP_EOL . 'AVS is enforced. Sending void request.';
				}	
				$this->process_parsed_result('send void');
				break;
				
			case "redirect to payment timeout error indicator":
				if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
					$this->Shift4_debug_data .= PHP_EOL . 'Probable gateway timeout. Return user to payment page.';
					$this->log_failed_transaction($this->Shift4_debug_data);
				}	
				$this->redirect_to_payment('timeout');
				break;

			case "redirect to payment declined void successful":
				if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
					$this->Shift4_debug_data .= PHP_EOL . 'Void request was successful.';
					$this->log_failed_transaction($this->Shift4_debug_data);
				}	
				$this->redirect_to_payment('declined');
				break;
				
			case "redirect to payment declined void failed":
				if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
					$this->Shift4_debug_data .= PHP_EOL . 'Void request was not successful.';
					$this->log_failed_transaction($this->Shift4_debug_data);
				}	
				$this->redirect_to_payment('declined');
				break;
				
			case "gateway error":
				if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
					$this->Shift4_debug_data .= PHP_EOL . 'Gateway error.';
					$this->log_failed_transaction($this->Shift4_debug_data);
				}	

				$body = 'The Shift4 gateway returned an error. ' . $this->Shift4_error_response;
				zen_mail(STORE_NAME, STORE_OWNER_EMAIL_ADDRESS, 'Shift4 gateway error', $body, STORE_OWNER, STORE_OWNER_EMAIL_ADDRESS);
				$this->redirect_to_payment('timeout');
				break;	
				
			case "testing credentials":
				$this->redirect_to_payment('testing credentials error');		
				
			default:
				if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
					$this->Shift4_debug_data .= PHP_EOL . "Unrecognized response: $parsed_result. Return user to payment page";
					$this->log_failed_transaction($this->Shift4_debug_data);
				}	
				$this->redirect_to_payment('declined');				
		}
		return true;
	}

	/**
	* Zen Cart calls this function at checkout_confirmation.
	*
	* @return void
	*/
	function process_button() {
	}
	
	/**
	* Zen Cart calls this function at checkout_payment.
	* 
	* @return void
	*/
	function pre_confirmation_check() {
	}	
	
	/**
	* Search the order history comments for a given string
	*
	* @param string $needle
	* @return boolean
	*/
	function search_order_history($needle, $order_id) {
		global $db;
	
		$search_history_query = "
								SELECT comments
								FROM " . TABLE_ORDERS_STATUS_HISTORY . "
								WHERE orders_id = :id
								ORDER BY orders_status_history_id DESC
								LIMIT 1
								";
		
		$search_history_query = $db->bindVars($search_history_query, ':id', $order_id, 'integer');
		$search_history_query_result = $db->Execute($search_history_query);
		$latest_comment = ($search_history_query_result->RecordCount() > 0) ? $search_history_query_result->fields['comments'] : '';		
		
		if (stripos($latest_comment, $needle) === false) {
			return false;
		} else {
			return true;
		}
	}		
	
	/*
	* Replaces newlines in print_r output to be cross-platform
	*
	* @param array $in
	* @return array
	*/
	function newline_print_r($in) {
		return strtr(print_r($in, true), array("\r\n" => PHP_EOL, "\r" => PHP_EOL, "\n" => PHP_EOL));
	}
	
	/**
	 * Sanitize an array
	 * 
	 * @param array $data
	 * @return $sanitized_array
	 */
	function sanitize_array($input_array = '[no data was provided]') {	
		$keyword_list = array(
						'password',
						'apipassword',
						'cc_number',							
						'cardnumber',
						'cvv2',
						'cvv',
						'cvvcode',
						'shift4_cc_number',
						'shift4_cc_expires_month',
						'shift4_cc_expires_year',
						'shift4_cc_cvv',
						'cvv2code',
						'trackinformation',
						'cckey',
						'secretanswer',
						'notes',
						'text',
						'creditcard',
						'verification',
						'cardtype',
						'expiration',
						'expirationmonth',
						'expirationyear',
						);
		$input_array = array_change_key_case($input_array, CASE_LOWER);
		
		foreach ($input_array as $key => $value) {
			foreach ($keyword_list as $filter_word) {
				if (strpos($key, $filter_word) !== FALSE) {
					$input_array[$key] = '(filtered)';
				}
			}
		}
		$sanitized_array = &$input_array;
		return $sanitized_array;
	}

	/**
	* Used to display error message details
	*
	* @return array
	*/
	function get_error() {	
		$error = array('title' => MODULE_PAYMENT_SHIFT4_TEXT_ERROR,
					   'error' => stripslashes(urldecode($_GET['error'])));		
		return $error;
	}
	
	/**
    * Return order info
    *
    * @param int $order_id
    * @return array
	* @return false (if fails)
    */	
	function get_order_info($order_id) {
		global $db;
		$query_order_info = "
							SELECT 
								shift4_invoice,
								order_total,
								shift4_unique_id,
								shift4_order_mode,
								customers_name,
								customers_id,
								delivery_postcode,
								billing_postcode,
								billing_street_address,
								shift4_is_auth_only
							FROM " . TABLE_ORDERS . "
							WHERE orders_id = :id
							";
		$query_order_info = $db->bindVars($query_order_info, ':id', $order_id, 'integer');
		$order_info = $db->Execute($query_order_info);
		
		if ($order_info->RecordCount() > 0) {
			if (empty($order_info->fields['delivery_postcode'])) {
				$order_info->fields['delivery_postcode'] = $order_info->fields['billing_postcode'];
			}
			return $order_info->fields;
		} else {
			return false;
		}	
	}		

	/**
	 * Returns i4Go URL. Called from /includes/templates/template_default/templates/tpl_checkout_payment_default.php
	 * 
	 * @return string
	 */
	function get_i4go_url() {
		
		if (MODULE_PAYMENT_SHIFT4_ORDER_MODE == 'Live') {
			$i4Go_url = 'https://secure.i4go.com';
		} else {
			$i4Go_url = 'https://certify.i4go.com';
		}
		
		$i4Go_url .= MODULE_PAYMENT_SHIFT4_I4GO_URL_PATH;
	
		return $i4Go_url;
	}	
	
	/**
	* Get new invoice number
	*
	* @return string
	*/
	function get_new_invoice() {
		global $db;
	
		// create 10 digit order invoice number to send in transaction request
		$db->Execute("
					INSERT INTO shift4_invoices
					(
						shift4_id
					)
					VALUES 
					(
						NULL
					)
					");
	
		$invoice = mysql_insert_id();

		if (strlen($invoice) < 10) {
			$invoice = str_pad($invoice, 10, "0", STR_PAD_LEFT);
		} else {
			$invoice = substr($invoice, -10);	
		}
		
		return $invoice;
	}
	
	/**
	 * Get API credentials
	 * 
	 * @param string $order_mode 
	 * @return array
	 * @return false (if failed)
	 */	
	 function get_api_credentials($order_mode = '') {
		if (stristr(MODULE_PAYMENT_SHIFT4_ORDER_MODE, 'demo') !== FALSE || $order_mode == 'demo') {
			$test_credentials_file = file_get_contents('https://myportal.shift4.com/downloads/certifydemo.xml');
			if ($test_credentials_file) {
				if (simplexml_load_string($test_credentials_file)) {
					$test_credentials_xml = simplexml_load_string($test_credentials_file);
					$credentials['serialNumber'] = (string) $test_credentials_xml->config->dotn->serialNumber;
					$credentials['userName'] = (string) $test_credentials_xml->config->dotn->userName;
					$credentials['password'] = (string) $test_credentials_xml->config->dotn->password;
					$credentials['merchantID'] = (string) $test_credentials_xml->config->dotn->merchantID;
					$credentials['siteID'] = (string) $test_credentials_xml->config->i4Go->siteID;
					$credentials['accountID'] = (string) $test_credentials_xml->config->i4Go->accountID;
					$credentials['i4go_url'] = (string) $test_credentials_xml->config->i4Go->url;
				} else {
					return false;
				}
			} else {
				return false;
			}
		} else {			
			$credentials['merchantID'] = MODULE_PAYMENT_SHIFT4_MERCHANT_ID_PRODUCTION;
			$credentials['userName'] = MODULE_PAYMENT_SHIFT4_USERNAME_PRODUCTION;
			$credentials['password'] = MODULE_PAYMENT_SHIFT4_PASSWORD_PRODUCTION;
			$credentials['serialNumber']  = MODULE_PAYMENT_SHIFT4_SERIAL_NUMBER_PRODUCTION;
			$credentials['siteID'] = MODULE_PAYMENT_SHIFT4_I4GO_SITE_PRODUCTION;
			$credentials['accountID'] = MODULE_PAYMENT_SHIFT4_I4GO_LOGIN_PRODUCTION;
			//$credentials['i4go_url'] = strtoupper($test_credentials_xml->config->i4go->url);
		}

		return $credentials;
	}
	
	/**
    * Return total amount captured for an order
    *
    * @param int $order_id
    * @return int
    */	
	function get_amount_captured ($order_id) {
		global $db;
		$order_info = $this->get_order_info($order_id);
		$query_amount_captured = "
								SELECT 
									SUM(shift4_amount_captured) AS shift4_amount_captured
								FROM " . TABLE_ORDERS_STATUS_HISTORY . "
								WHERE orders_id = :id
								";
		$query_amount_captured = $db->bindVars($query_amount_captured, ':id', $order_id, 'integer');
		$amount_captured_results = $db->Execute($query_amount_captured);
		$amount_captured = $amount_captured_results->fields['shift4_amount_captured'];

		return $amount_captured;
	}
	
	/**
    * Return total amount refunded for an order
    *
    * @param int $order_id
    * @return int
    */	
	function get_amount_refunded ($order_id) {
		global $db;
		$order_info = $this->get_order_info($order_id);
		$query_amount_refunded = "
								SELECT 
									SUM(shift4_amount_refunded) AS shift4_amount_refunded
								FROM " . TABLE_ORDERS_STATUS_HISTORY . "
								WHERE orders_id = :id
								";
		$query_amount_refunded = $db->bindVars($query_amount_refunded, ':id', $order_id, 'integer');
		$amount_refunded_results = $db->Execute($query_amount_refunded);
		$amount_refunded = $amount_refunded_results->fields['shift4_amount_refunded'];

		return $amount_refunded;
	}	
	
	/**
    * Build admin page components.
    *
    * @param int $order_id
	* @param string $mode
    * @return string
    */
	function admin_notification($order_id, $mode = '') {
		global $db, $messageStack;
		$order_id = strip_tags($order_id);
		$disable_all_forms = false;
		$proceed_to_get_info = true;			
		$successful_transaction = true;
		$invoice_found = true;
		$output = '';
		$order_info = $this->get_order_info($order_id);
	
		$is_voided = false;

		if ($order_info) {
			$_SESSION['shift4_invoice'] = $order_info['shift4_invoice'];			
			$shift4_unique_id = $order_info['shift4_unique_id'];
			$shift4_order_mode = $order_info['shift4_order_mode'];
			$is_auth_only = $order_info['shift4_is_auth_only'];
			$amount_captured = $this->get_amount_captured($order_id);
			$amount_refunded = $this->get_amount_refunded($order_id);
			$amount_not_captured = number_format(($order_info['order_total'] - $amount_captured), 2);
			$amount_not_refunded = number_format($amount_captured - $amount_refunded, 2);
			if ($amount_not_funded < 0) {$amount_not_refunded = 0;}

			if(stristr($shift4_order_mode, MODULE_PAYMENT_SHIFT4_ORDER_MODE) === FALSE) {
				$disable_all_forms = true;
				$order_mode_mismatch = true;	
			}			
			
			if (empty($shift4_unique_id) || empty($_SESSION['shift4_invoice']) || empty($shift4_order_mode)) {
				$proceed_to_get_info = false;
				$disable_all_forms = true;
			}

			$query_is_void = "
							SELECT 
								shift4_is_voided
							FROM " . TABLE_ORDERS_STATUS_HISTORY . "
							WHERE orders_id = :id
							AND shift4_is_voided = '1'
							";
			$query_is_void = $db->bindVars($query_is_void, ':id', $order_id, 'integer');
			$voided_query_result = $db->Execute($query_is_void);
			$is_voided = ($voided_query_result->RecordCount() > 0) ? true : false;				

		} else {
			$proceed_to_get_info = false;
			$disable_all_forms = true;
		}
		
		if ($proceed_to_get_info) {
			if ($mode == 'get invoice') {
				$api_credentials = $this->get_api_credentials($shift4_order_mode);
				$_SESSION['customer_id'] = $order_info['customers_id'];
				$this->submit_data['CustomerName'] = $order_info['customers_name'];
				$_SESSION['order_number_created'] = $order_id;
				
				if ($api_credentials) {
					$get_invoice_array = array(
											'STX' => 'YES',
											'VERBOSE' => 'YES',
											'ContentType' => 'xml',
											'APIFormat' => '0',
											'APIOptions' => 'ALLDATA',
											'APISignature' => '$',
											'MerchantID' => $api_credentials['merchantID'],
											'UserName' => $api_credentials['userName'], // user knows this as 'API Username'
											'Password' => $api_credentials['password'], // user knows this as 'API Password'
											'APISerialNumber' => $api_credentials['serialNumber'],
											'FunctionRequestCode' => '07',
											'Invoice' => $_SESSION['shift4_invoice'],
											'UniqueID' => $shift4_unique_id,
											'Vendor' => MODULE_PAYMENT_SHIFT4_MODULE_VERSION,
											'ETX' => 'YES'								
											);
					
					unset($result);
					$result = $this->transaction_request($get_invoice_array, $shift4_order_mode);
					
					if (!empty($result) && (stripos($result, 'timeout') === false)) {
						$parsed_result = $this->parse_transaction_response($result);
									
						$query_log_order_id = "
												UPDATE shift4_log
												SET
													shift4_log_order_id = :order_id
												WHERE shift4_log_id = :shift4_log_id
												";
							
						$query_log_order_id = $db->bindVars($query_log_order_id, ':order_id', $order_id, 'integer');
						$query_log_order_id = $db->bindVars($query_log_order_id, ':shift4_log_id', $_SESSION['get_invoice_log_id'], 'integer');
						$db->Execute($query_log_order_id);	

						$invoice_parsed_xml = simplexml_load_string($result);				
						$dotn_primary_amount = number_format((float) $invoice_parsed_xml->primaryamount, 2);	
						$order_total = number_format((float) $order_info['order_total'], 2);					

						if ($parsed_result == 'get invoice success') {					
							$successful_transaction = true;
						} elseif ($parsed_result == 'get invoice not found') {
							$invoice_found = false;
							$successful_transaction = true;
						}
					}
				} else {
					$successful_transaction = false;
				}
			}
		} else {
			$messageStack->add_session('Order information was not found', 'error');
		}
		
		if ($mode == 'get invoice') {
			if ($invoice_found) {
				return $invoice_parsed_xml;
			} else {
				return "invoice not found";
			}
		} else {
			require(DIR_FS_CATALOG . DIR_WS_MODULES . 'payment/shift4/shift4_admin_notification.php');
			
			return $output;		
		}
	}
	
	/**
	* Capture a previously-authorized transaction.
	*
	* @param int $order_id
	* @param string $notes
	* @param int $amount
	* @param string $currency
	*
	* @return boolean
	*/	
	function _doCapt($order_id, $notes = '', $amount = 0, $currency = 'USD') {
		global $db, $messageStack;
		$order_id = strip_tags($order_id);
		$notes = strip_tags($notes);
		$amount = strip_tags($amount);
		$has_new_invoice = false;
		$order_info = $this->get_order_info($order_id);
	
		unset($this->Shift4_debug_data);		
		$proceed_to_capture = true;
		
		if (!isset($_POST['capture_confirm']) && $_POST['capture_confirm'] != 'on') {
			$messageStack->add_session('Confirmation checkbox is empty', 'error');
			$proceed_to_capture = false;
		}
		
		if (isset($_POST['button_capture']) && $_POST['button_capture'] == 'Submit Settlement') {
			if ($_POST['capture_amount'] != '' && $_POST['capture_amount'] > 0 && is_numeric($_POST['capture_amount'])) {
				$amount_captured = $this->get_amount_captured($order_id);
				if (($_POST['capture_amount'] + $amount_captured) <= $order_info['order_total']) {
					$capture_amount = number_format(strip_tags($_POST['capture_amount']), 2);
				} else {
					$messageStack->add_session('Settlement amount cannot be more than the authorized amount', 'error');
				}	
			} else {
				$messageStack->add_session('Settlement amount is invalid.', 'error');
				$proceed_to_capture = false;		  
			}
		}

		$new_order_status = (int)MODULE_PAYMENT_SHIFT4_ORDER_STATUS_ID;
		$comments = strip_tags($_POST['capture_note']);
		
		if ($new_order_status == 0) {
			$new_order_status = 1;
		}		

		if ($order_info) {	
			if ($proceed_to_capture) {	
				$this->submit_data['CustomerName'] = $order_info['customers_name'];
				$_SESSION['order_number_created'] = $order_id;			
				$query_partial_capture = "
										SELECT
											shift4_is_partial_capture 
										FROM " . TABLE_ORDERS_STATUS_HISTORY . "
										WHERE shift4_is_partial_capture = '1'
										AND orders_id = :order_id
										ORDER BY orders_status_history_id DESC
										LIMIT 1
										";
				$query_partial_capture = $db->bindVars($query_partial_capture, ':order_id', $order_id, 'integer');
				$partial_capture_result = $db->Execute($query_partial_capture);
				
				if ($partial_capture_result->RecordCount() > 0) {
					$has_new_invoice = true;
					$shift4_invoice = (stristr(MODULE_PAYMENT_SHIFT4_ORDER_MODE, 'demo') !== FALSE) ? '' : $this->get_new_invoice();
				} else {
					$shift4_invoice = $order_info['shift4_invoice'];
				}	
					
				$shift4_unique_id = $order_info['shift4_unique_id'];
				$shift4_order_mode = $order_info['shift4_order_mode'];
			}		
		} else {
			$proceed_to_capture = false;
			$disable_all_forms = true;
		}		
		
		if ($proceed_to_capture) {
			$api_credentials = $this->get_api_credentials($shift4_order_mode);
			$capture_notes = 'Invoice of initial order: ' . $order_info['shift4_invoice'] . '. ';
			
			if (!empty($notes)) {$capture_notes .= " " . $notes;}
			if (!empty($comments)) {$capture_notes .= " " . $comments;}
			
			if ($api_credentials) {			
				$request_data = array(
								'STX' => 'YES',
								'VERBOSE' => 'YES',
								'ContentType' => 'xml',
								'APIFormat' => '0',
								'APIOptions' => 'ALLDATA',
								'APISignature' => '$',
								'MerchantID' => $api_credentials['merchantID'],
								'UserName' => $api_credentials['userName'],// user knows this as 'API Username'
								'Password' => $api_credentials['password'],// user knows this as 'API Password'
								'APISerialNumber' => $api_credentials['serialNumber'],
								'CustomerName' => $order_info['customers_name'],
								'CardPresent' => 'N',
								'FunctionRequestCode' => '1D',
								'Invoice' => $shift4_invoice,
								'PrimaryAmount' => $capture_amount,							
								'SaleFlag' => 'S',
								'Notes' => $capture_notes,
								'UniqueID' => $shift4_unique_id,
								'Vendor' => MODULE_PAYMENT_SHIFT4_MODULE_VERSION,
								'ETX' => 'YES'					
								);
				
				if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
					$this->Shift4_debug_data .= PHP_EOL . 'Send settlement request from order detail page.';
				}
				
				unset($result);
				$result = $this->transaction_request($request_data, $shift4_order_mode);
				$successful_transaction = false;
				
				if (!empty($result) && (stripos($result, 'timeout') === false)) {
					$parsed_result = $this->parse_transaction_response($result);

					if (MODULE_PAYMENT_SHIFT4_LOG_GATEWAY == "Yes") {		
						$query_log_order_id_capture = "
													UPDATE shift4_log
													SET
														shift4_log_order_id = :order_id,
														shift4_log_shift4_invoice = :invoice
													WHERE shift4_log_id = :shift4_log_id
													";
							
						$query_log_order_id_capture = $db->bindVars($query_log_order_id_capture, ':order_id', $order_id, 'integer');
						$query_log_order_id_capture = $db->bindVars($query_log_order_id_capture, ':invoice', $_SESSION['demo_invoice'], 'string');	
						$query_log_order_id_capture = $db->bindVars($query_log_order_id_capture, ':shift4_log_id', $_SESSION['get_invoice_log_id'], 'integer');
						$db->Execute($query_log_order_id_capture);
					}	
					
					if ($parsed_result == 'authorized') {
						if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
							$this->Shift4_debug_data .= PHP_EOL . 'Settlement request was successful.';
						}
						
						$successful_transaction = true;
					}
				} else {
					if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
						$this->Shift4_debug_data .= PHP_EOL . 'Settlement request failed.';
						$this->log_failed_transaction($this->Shift4_debug_data);
					}	
				}			
				
				if ($successful_transaction) {
					$messageStack->add_session("Funds settlement initiated. Amount: \$$capture_amount.", 'success');
					$is_partial = ($capture_amount < $order_info['order_total']) ? 1 : 0;
					$funds_comment = $is_partial ? 'Funds partially settled. ' : 'Funds settled. ';
					$new_invoice = ($has_new_invoice) ? 'Invoice: ' . $_SESSION['shift4_invoice'] . '. ' : '';
					
					$sql_update_order_status = array(
											'orders_id' => (int) $order_id,
											'orders_status_id' => (int) $new_order_status,
											'date_added' => 'now()',
											'comments' => $funds_comment . 'Amount: $' . $capture_amount . '. ' . $new_invoice . $comments,
											'customer_notified' => 0,
											'shift4_is_partial_capture' => $is_partial,
											'shift4_amount_captured' => $capture_amount
											);
					zen_db_perform(TABLE_ORDERS_STATUS_HISTORY, $sql_update_order_status);				
					
					$db->Execute("
								UPDATE " . TABLE_ORDERS  . "
								SET orders_status = '" . (int) $new_order_status . "'
								WHERE orders_id = '" . (int) $order_id . "'
								");		
				} else {
					$messageStack->add_session('There was an error. Verify transaction status in Dollars on the Net.', 'error');
				}
			} else {
				$successful_transaction = false;
			}
		}

		return $successful_transaction;
	}
	
	/**
	* Void a transaction.
	* 
	* @param int $order_id
	* @param string $notes
	* @param string $currency
	*
	* @return boolean
	*/
	function _doVoid($order_id, $notes = '', $currency = 'USD', $amount_refunded = 0) {
		global $db, $messageStack;
		$order_id = strip_tags($order_id);
		$notes = strip_tags($notes);
		unset($this->Shift4_debug_data);
		$proceed_to_void = true;	
		
		if (isset($_POST['button_void']) && $_POST['button_void'] == 'Submit Void') {
			if (isset($_POST['void_confirm']) && $_POST['void_confirm'] != 'on') {
				$messageStack->add_session('Confirmation checkbox is empty.', 'error');
				$proceed_to_void = false;
			}
		}

		$new_order_status = (int)MODULE_PAYMENT_SHIFT4_ORDER_STATUS_ID;
		$void_note = strip_tags($_POST['void_note']);
		$refund_amount_message = ($amount_refunded == 0) ? '' : '$' . $amount_refunded . '. ';
		if (!empty($notes)) {$void_note .= " " . $notes;}
		if ($new_order_status == 0) {$new_order_status = 1;}	
		$order_info = $this->get_order_info($order_id);
		
		if ($order_info) {				
			if ($proceed_to_void) {			
				$shift4_invoice = $order_info['shift4_invoice'];
				$shift4_unique_id = $order_info['shift4_unique_id'];
				$shift4_order_mode = $order_info['shift4_order_mode'];
			}
		} else {
			$proceed_to_void = false;
			$disable_all_forms = true;
		}
			
		if ($proceed_to_void) {
			$api_credentials = $this->get_api_credentials($shift4_order_mode);
			$this->submit_data['CustomerName'] = $order_info['customers_name'];
			$_SESSION['order_number_created'] = $order_id;
			if ($api_credentials) {
				$request_data = array(
									'STX' => 'YES',
									'APIFormat' => '0',
									'APISignature' => '$',
									'ContentType' => 'xml',
									'MerchantID' => $api_credentials['merchantID'],
									'UserName' => $api_credentials['userName'],// user knows this as 'API Username'
									'Password' => $api_credentials['password'],// user knows this as 'API Password'
									'APISerialNumber' => $api_credentials['serialNumber'],
									'FunctionRequestCode' => '08',
									'Invoice' => $shift4_invoice,
									'UniqueID' => $shift4_unique_id,
									'Vendor' => MODULE_PAYMENT_SHIFT4_MODULE_VERSION,
									'ETX' => 'YES'							
									);	
				
				if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
					$this->Shift4_debug_data .= PHP_EOL . 'Send void request from order detail page.';
				}
				
				unset($result);
				$result = $this->transaction_request($request_data, $shift4_order_mode);
				$successful_transaction = false;
				
				if (!empty($result) && (stripos($result, 'timeout') === false)) {
					$parsed_result = $this->parse_transaction_response($result);
					
					if (MODULE_PAYMENT_SHIFT4_LOG_GATEWAY == "Yes") {	
						$query_log_order_id_void = "
													UPDATE shift4_log
													SET
														shift4_log_order_id = :order_id,
														shift4_log_shift4_invoice = :invoice
													WHERE shift4_log_id = :shift4_log_id
													";
						
						$query_log_order_id_void = $db->bindVars($query_log_order_id_void, ':order_id', $order_id, 'integer');
						$query_log_order_id_void = $db->bindVars($query_log_order_id_void, ':invoice', $_SESSION['demo_invoice'], 'string');	
						$query_log_order_id_void = $db->bindVars($query_log_order_id_void, ':shift4_log_id', $_SESSION['get_invoice_log_id'], 'integer');
						$db->Execute($query_log_order_id_void);						
					}
					
					if ($parsed_result == 'redirect to payment declined void successful') {
						if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
							$this->Shift4_debug_data .= PHP_EOL . 'Void request was successful.';
						}
						
						$successful_transaction = true;
					} else {
						if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
							$this->Shift4_debug_data .= PHP_EOL . 'Void request failed.';
							$this->log_failed_transaction($this->Shift4_debug_data);
						}
					}
				} else {
					if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
						$this->Shift4_debug_data .= PHP_EOL . 'Void request failed.';
						$this->log_failed_transaction($this->Shift4_debug_data);
					}
				}			
				
				if ($successful_transaction) {
					$messageStack->add_session("Transaction refunded.", 'success');
					$sql_data_array = array('orders_id' => (int) $order_id,
											'orders_status_id' => (int) $new_order_status,
											'date_added' => 'now()',
											'comments' => 'Transaction refunded. ' . $refund_amount_note . $void_note,
											'shift4_amount_refunded' => $amount_refunded,
											'customer_notified' => 0,
											'shift4_is_voided' => 1
											);
					zen_db_perform(TABLE_ORDERS_STATUS_HISTORY, $sql_data_array);
					
					$db->Execute("UPDATE " . TABLE_ORDERS  . "
								  SET orders_status = '" . (int) $new_order_status . "'
								  WHERE orders_id = '" . (int) $order_id . "'");		
				} else {
					$messageStack->add_session('There was an error. Verify transaction status in Dollars on the Net.', 'error');
				}
			} else {
				$successful_transaction = false;
			}
		}	
		return $successful_transaction;
	}
  
	/**
	* Refund a transaction
	*
	* @param int $order_id
	* @param string $notes
	* @param int $amount
	* @param string $currency
	* @param boolean $new_invoice
	*
	* @return boolean
	*/
	function _doRefund($order_id, $notes = '', $amount = 0, $currency = 'USD', $new_invoice = true) {
		global $db, $messageStack;
		$order_id = strip_tags($order_id);
		$notes = strip_tags($notes);
		$amount = strip_tags($amount);
			
		if (isset($_POST['button_refund']) && $_POST['button_refund'] == 'Submit Refund') {
		  if (isset($_POST['refund_confirm']) && $_POST['refund_confirm'] != 'on') {
			$messageStack->add_session('Confirmation checkbox is empty.', 'error');
			$proceed_to_refund = false;
		  }
		}	
		
		$new_order_status = (int)MODULE_PAYMENT_SHIFT4_ORDER_STATUS_ID;		
		unset($this->Shift4_debug_data);
		$proceed_to_refund = true;	
	
		if (!empty($_POST['void-refund-note'])) {
			$comments = strip_tags($_POST['void-refund-note']);
		} elseif (!empty($notes)) {
			$comments = strip_tags($notes);
		}
		
		if (!empty($comments) && substr($comments, -1) != '.') {$comments .= '.';}			
		
		$order_info = $this->get_order_info($order_id);		
		
		if ($new_order_status == 0) {$new_order_status = 1;}			
		
		if (isset($_POST['button_refund']) && $_POST['button_refund'] == 'Submit Refund') {
			$refund_amount = number_format(strip_tags($_POST['refund_amount']), 2);
			$new_order_status = 1;
			if ($refund_amount == 0) {
				$messageStack->add_session('No refund amount was provided.', 'error');
				$proceed_to_refund = false;
			}
		} else {
			$refund_amount = $amount;
			$new_order_status = 1;
		}
		
		if ($order_info) {			
			if ($proceed_to_refund) {
				$shift4_invoice = $order_info['shift4_invoice'];		
				$shift4_unique_id = $order_info['shift4_unique_id'];
				$shift4_order_mode = $order_info['shift4_order_mode'];
				$customers_name = $order_info['customers_name']; 	
				$customers_id = $order_info['customers_id']; 	
				$delivery_postcode = $order_info['delivery_postcode'];	
				$billing_street_address = $order_info['billing_street_address'];			
			}

		} else {
			$proceed_to_refund = false;
			$disable_all_forms = true;
		}	
		
		if ($proceed_to_refund) {
			$this->submit_data['CustomerName'] = $order_info['customers_name'];
			$_SESSION['order_number_created'] = $order_id;			
			
			if ($new_invoice) {
				if (stristr(MODULE_PAYMENT_SHIFT4_ORDER_MODE, 'demo') !== FALSE) {
					$new_refund_invoice = '';
				} else {
					$new_refund_invoice = $this->get_new_invoice();
				}	
			} else {
				$new_refund_invoice = $shift4_invoice;
			}
			
			$refund_notes = 'Refund for invoice ' . $shift4_invoice . ". " . $comments;		
			$api_credentials = $this->get_api_credentials($shift4_order_mode);

			if (!$api_credentials) {
				$this->process_parsed_result('testing credentials');
			} else {			
				$request_data = array(
									'STX' => 'YES',
									'VERBOSE' => 'YES',
									'ContentType' => 'xml',
									'APIFormat' => '0',
									'APIOptions' => 'ALLDATA',
									'APISignature' => '$',
									'CVV2Indicator' => '0',
									'MerchantID' => $api_credentials['merchantID'],
									'UserName' => $api_credentials['userName'],// user knows this as 'API Username'
									'Password' => $api_credentials['password'],// user knows this as 'API Password'
									'APISerialNumber' => $api_credentials['serialNumber'],
									'CardPresent' => 'N',
									'CustomerName' => $customers_name,
									'CustomerReference' => $customers_id,
									'DestinationZipCode' => $delivery_postcode,
									'FunctionRequestCode' => '1D',
									'Notes' => $refund_notes,
									'PrimaryAmount' => $refund_amount, 	
									'SaleFlag' => 'C',							
									'StreetAddress' => $billing_street_address,
									'Invoice' => $new_refund_invoice,
									'UniqueID' => $shift4_unique_id,
									'Vendor' => MODULE_PAYMENT_SHIFT4_MODULE_VERSION,
									'ETX' => 'YES'						
									);
				
				if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
					$this->Shift4_debug_data .= PHP_EOL . 'Send refund request from order detail page.';
				}
				
				unset($result);
				$result = $this->transaction_request($request_data, $shift4_order_mode);
				$successful_transaction = false;
				
				if (!empty($result) && (stripos($result, 'timeout') === false)) {
					$parsed_result = $this->parse_transaction_response($result);
					
					if (MODULE_PAYMENT_SHIFT4_LOG_GATEWAY == "Yes") {	
						$query_log_order_id_refund = "
													UPDATE shift4_log
													SET
														shift4_log_order_id = :order_id,
														shift4_log_shift4_invoice = :invoice
													WHERE shift4_log_id = :shift4_log_id
													";
							
						$query_log_order_id_refund = $db->bindVars($query_log_order_id_refund, ':order_id', $order_id, 'integer');
						$query_log_order_id_refund = $db->bindVars($query_log_order_id_refund, ':invoice', $_SESSION['demo_invoice'], 'string');	
						$query_log_order_id_refund = $db->bindVars($query_log_order_id_refund, ':shift4_log_id', $_SESSION['get_invoice_log_id'], 'integer');
						$db->Execute($query_log_order_id_refund);	
					}
						
					if ($parsed_result == 'credit successful') {
						if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
							$this->Shift4_debug_data .= PHP_EOL . 'Refund request was successful.';
						}
						
						$successful_transaction = true;
					} else {
						if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
							$this->Shift4_debug_data .= PHP_EOL . 'Refund request failed.';
							$this->log_failed_transaction($this->Shift4_debug_data);
						}
					}
				} else {
					if (MODULE_PAYMENT_SHIFT4_DEBUGGING != 'Off') {
						$this->Shift4_debug_data .= PHP_EOL . 'Refund request failed.';
						$this->log_failed_transaction($this->Shift4_debug_data);
					}
				}			
				
				if ($successful_transaction) {
					$messageStack->add_session("Refunded amount: \$$refund_amount.", 'success');
					$invoice_comment = 'Invoice: ';
					$invoice_comment .= (stristr(MODULE_PAYMENT_SHIFT4_ORDER_MODE, 'demo') === FALSE) ? $new_refund_invoice . '. ' : $_SESSION['shift4_invoice'] . '. ';	
					$sql_data_array = array('orders_id' => (int) $order_id,
											'orders_status_id' => (int) $new_order_status,
											'date_added' => 'now()',
											'comments' => 'Transaction refunded. Amount: $'. $refund_amount . '. ' . $invoice_comment . $comments,
											'customer_notified' => 0,
											'shift4_amount_refunded' => $refund_amount
											);
					zen_db_perform(TABLE_ORDERS_STATUS_HISTORY, $sql_data_array);
					
					$db->Execute("UPDATE " . TABLE_ORDERS  . "
								  SET orders_status = '" . (int) $new_order_status . "'
								  WHERE orders_id = '" . (int) $order_id . "'");
					unset($_SESSION['shift4_invoice']);					
				} else {
					$messageStack->add_session('There was an error. Verify transaction status in Dollars on the Net.', 'error');
				}
			}
		}
		
		return $successful_transaction;	
	}    

}

?>
