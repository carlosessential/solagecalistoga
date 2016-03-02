<?php 

$outputStartBlock = '
	<style = "text/css">
		.disabled {
			color: #999999;
		}
	</style>';
$outputMain = '';
$outputAuth = '';
$outputCapt = '';
$outputVoid = '';
$outputRefund = '';
$outputEndBlock = '';
$output = '';

$outputStartBlock .= '<td><table class="noprint" style="border: 1px solid black;">'."\n";
$outputStartBlock .= '<tr style="background-color: #DDDDDD;">'."\n";
$outputEndBlock .= '</tr>'."\n";
$outputEndBlock .= '</table></td>'."\n";

$outputWarning  = '<tr><td><table border="0" width="100%" cellspacing="0" cellpadding="2">' . "\n";
$outputWarning .= '	<tr class="messageStackError">' . "\n";
$outputWarning .= '		<td class="messageStackError"><img src="images/icons/error.gif" border="0" alt="Error" title=" Error ">There was an error getting the transaction status from Shift4. Please check your Shift4 module settings.</td>' . "\n";
$outputWarning .= '    </tr>' . "\n";
$outputWarning .= '</table></td></tr>' . "\n";

$order_mode_mismatch_warning  = '<tr><td><table border="0" width="100%" cellspacing="0" cellpadding="2">' . "\n";
$order_mode_mismatch_warning .= '	<tr class="messageStackWarning">' . "\n";
$order_mode_mismatch_warning .= '		<td class="messageStackWarning"><img src="images/icons/warning.gif" border="0" alt="Error" title=" Error ">The current Shift4 module Processing Mode is different than the mode under which this order was made. The forms will be disabled.</td>' . "\n";
$order_mode_mismatch_warning .= '    </tr>' . "\n";
$order_mode_mismatch_warning .= '</table></td></tr>' . "\n";

if (method_exists($this, '_doCapt')) {
	if ($is_voided || !$invoice_found) {
		if ($disable_all_forms || ($is_auth_only == 1 && ($amount_captured >= $order_info['order_total']))) {
			$disabled = ' disabled = "disabled" ';
		}	
	} else {
		$disabled = '';
	}
	
	if ($is_auth_only == 0 && $amount_captured >= $order_info['order_total']) {
		$disabled = ' disabled = "disabled" ';
	}
	
	$class = ($disabled) ? "disabled" : "main";
	$link = '<img style="padding-left: 5px" src="images/icon_info.gif" alt="" title="Settling a transaction will finalize it and secure the funds. A settled transaction can be batched. When a transaction is authorized only, it must be settled before the funds can be secured and the transaction batched. After a transaction has been voided, it cannot be settled. You cannot settle more funds than have been authorized." style="border:none"/>';
	$outputCapt .= '<td valign="top" width="50%"><table class="noprint" style="margin: 5px;">'."\n";
	$outputCapt .= '<tr>'."\n";
	$outputCapt .= '<td class="' . $class . '"><strong>Settle Transaction</strong>' . $link . '<a href=""></a><br />'. "\n";
	$outputCapt .= zen_draw_form('shift4capture', FILENAME_ORDERS, zen_get_all_get_params(array('action')) . 'action=doCapture', 'post', '', true) . zen_hide_session_id();
	$outputCapt .= '<br />' . 'Amount to settle:' . ' ' . zen_draw_input_field('capture_amount', '', $disabled . 'id="capture_amount" size="5" value="' . $amount_not_captured . '"') . ' (Already settled: $' . $amount_captured . ')' . '<br />';
	$outputCapt .= 'Check this box to confirm: ' . zen_draw_checkbox_field('capture_confirm', '', false, '', $disabled . ' id="capture_confirm"') . '<br />';
	$outputCapt .= '<br />' . 'Notes (will show on order history):' . '<br />' . zen_draw_textarea_field('capture_note', 'soft', '30', '3', 'Settled from Zen Cart.', $disabled);
	$outputCapt .= zen_draw_hidden_field('shift4', 'edit', '');
	$outputCapt .= zen_draw_hidden_field('void-refund', 'yes', '');
	$outputCapt .= '<br /><br />' . 'Settlements should typically be performed within 7 days of the original authorization.';
	$outputCapt .= '<br /><br /><input class="button-bottom" type="submit" id="button_capture" name="button_capture" ' . $disabled . ' value="Submit Settlement" title="Submit Settlement" onclick="return validate(\'button_capture\')" />';
	$outputCapt .= '</form>';
	$outputCapt .= '</td></tr></table></td>'."\n";
			
}

if (method_exists($this, '_doRefund')) {
	$disabled = ($disable_all_forms || ($is_auth_only && $amount_captured == 0)) ? ' disabled="disabled" ' : '';
	$class = ($disabled) ? "disabled" : "main";
	$void_note = ($is_auth_only && $amount_captured == 0) ? '<tr><td><span style="color: black; background: lightyellow; padding: 3px;">Note: the amount settled is $0. To refund this order, delete it from the <a href="' . zen_href_link(FILENAME_ORDERS) . '">Orders</a> screen.</span></td></tr>' : '';
	$link = '<img style="padding-left: 5px" src="images/icon_info.gif" alt="" title="This form will refund transactions. A refund may create a new transaction, which will be noted in the order history." style="border:none" />';
	$outputRefund .= '<td valign="top" width="50%"><table class="noprint" style="margin: 5px;">';
	$outputRefund .= '<tr>'. $void_note;	
	$outputRefund .= '<td class="' . $class . '" style="vertical-align: middle;"><strong>Refund Transaction</strong>' . $link . '<br />';	
	$outputRefund .= zen_draw_form('shift4refund', FILENAME_ORDERS, zen_get_all_get_params(array('action')) . 'action=deleteconfirm', 'post', '', true) . zen_hide_session_id();;
	$outputRefund .= '<br />Refund Amount: ' . ' ' . zen_draw_input_field('refund_amount', '', $disabled . ' id="refund_amount" size="5"') . ' (Already refunded: $' . $amount_refunded. ')' . '<br />';
	$outputRefund .= 'Check this box to confirm: ' . zen_draw_checkbox_field('refund_confirm', '', false, '', $disabled . ' id="refund_confirm"') . '<br />';
	$outputRefund.= '<br />' . 'Notes:' . '<br />' . zen_draw_textarea_field('void-refund-note', 'soft', '30', '3', 'Refunded from Zen Cart.', $disabled);
	$outputRefund .= '<br /><br />' . 'You may refund an order up to the amount already captured.';
	$outputRefund .= zen_draw_hidden_field('shift4', 'edit', '');
	$outputRefund .= zen_draw_hidden_field('void-refund', 'yes', '');
	$outputRefund .= '<br /><br /><input class="button-bottom" type="submit" id="button_refund" name="button_refund" ' . $disabled . ' value="Submit Refund" title="Submit Refund" onclick="return validate(\'button_refund\')" />';
	$outputRefund .= '</form>';
	$outputRefund .='</td></tr></table></td>'."\n";
}

// prepare output 
if (defined('MODULE_PAYMENT_SHIFT4_STATUS') && MODULE_PAYMENT_SHIFT4_STATUS != '') {
	$output = '<!-- BOF: Shift4 transaction processing tools -->' . "\n";
	$output .= 
				'	<script type="text/javascript" >' . "\n" . 
				'	function disable_buttons() { ' . "\n" . 
				'			document.getElementById("button_refund").value = "Submit Refund";' . "\n" .
				'			document.getElementById("button_refund").disabled = "disabled";' . "\n" .		
				'			document.getElementById("button_capture").value = "Submit Settlement";' . "\n" .
				'			document.getElementById("button_capture").disabled = "disabled";' . "\n" .					
				'	}'  . "\n" . 
				'	function enable_buttons() { ' . "\n" . 
				'			document.getElementById("button_refund").value = "Sumbit Refund";' . "\n" .
				'			document.getElementById("button_refund").disabled = "";' . "\n" .		
				'			document.getElementById("button_capture").value = "Submit Settlement";' . "\n" .
				'			document.getElementById("button_capture").disabled = "";' . "\n" .					
				'	}'  . "\n" . 				
				'	function validate(form_name) {' . "\n" .
				'		disable_buttons();' . "\n" .
				'		if (form_name == "button_refund") {' . "\n" .				
				'			var refund_confirm = document.getElementById("refund_confirm").checked;' ."\n" .
				'			var refund_amount = parseFloat(document.getElementById("refund_amount").value);' . "\n" .					
				'			if (refund_confirm == false) {' . "\n" .
				'				alert("Please check the checkbox to confirm your intent.");' . "\n" . 
				'				enable_buttons();' . "\n" .				
				'				return false;' . "\n" . 
				'			} else if (!refund_amount || isNaN(refund_amount) || refund_amount <= 0) {' . "\n" .
				'				alert("Refund amount is invalid.");' . "\n" .
				'				enable_buttons();' . "\n" .						
				'				return false;' . "\n" .
				'			} else if (refund_amount > ' . $amount_not_refunded . ') {' . "\n" .
				'				var answer = confirm("The total refund amount will be higher than the amount settled. Continue?");' . "\n" . 
				'				if (answer) {' . "\n" .
				'					enable_buttons();' . "\n" .						
				'					return true;' . "\n" .
				'				} else {' . "\n" .
				'					enable_buttons();' . "\n" .		
				'					return false;' . "\n" .
				'				}' . "\n" .
				'			} else {' . "\n" .	
				'				enable_buttons();' . "\n" .						
				'				return true;' . "\n" .
				'			}' . "\n" .			
				'		} else if (form_name == "button_capture") {' . "\n" .		
				'			var capture_amount = parseFloat(document.getElementById("capture_amount").value);' . "\n" .	
				'			var capture_confirm = document.getElementById("capture_confirm").checked;' ."\n" .
				'			if (capture_confirm == false) {' . "\n" .
				'				alert("Please check the checkbox to confirm your intent.");' . "\n" . 	
				'				enable_buttons();' . "\n" .						
				'				return false;' . "\n" . 
				'			} else if ((capture_amount + ' . $amount_captured . ') > ' . $order_info[order_total] . ') {' . "\n" .
				'				alert("Settlement amount cannot be more than the amount authorized.");' . "\n" .
				'				enable_buttons();' . "\n" .						
				'				return false;' . "\n" .
				'			} else if (isNaN(capture_amount) || capture_amount <= 0) {' . "\n" .
				'				var response = alert("Settlement amount is invalid.");' . "\n" .
				'				if (response) {' . "\n" . 
				'					enable_buttons();' . "\n" .						
				'					return true;' . "\n" . 								
				'				} else {' . "\n" . 
				'					enable_buttons();' . "\n" .						
				'					return false;' . "\n" .
				'				}' . "\n" . 	
				'			} else {' . "\n" .
				'				enable_buttons();' . "\n" .						
				'				return true;' . "\n" .		
				'			}' . "\n" . 
				'		} else {' . "\n" . 
				'			enable_buttons();' . "\n" .						
				'			return true;' . "\n" .
				'		}' . "\n" .			
				'	}' . "\n" . 
				'	</script>' . "\n";
	if (!$successful_transaction){
		$output .= $outputWarning;
	} else {
		if ($order_mode_mismatch) {
			$output .= $order_mode_mismatch_warning;
		}
		$output .= $outputStartBlock;
		
		if (method_exists($this, '_doCapt')) $output .= $outputCapt;
		if (method_exists($this, '_doRefund')) $output .= $outputRefund;

		$output .= $outputEndBlock;		
	}
	$output .= '<!-- EOF: Shift4 transaction processing tools -->' . '<br />';
}

?>
