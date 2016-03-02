<?php
/**
* Shift4 payment module for Zen Cart 1.39h
*
* LICENSE: based on Authorize.net "AIM" code created by Eric Stamper - 01/30/2004 Released under GPL
* 
* @copyright  Copyright (c) 2011 Shift4 Corporation (http://www.shift4.com)    
*
*/

// Admin Configuration Items

define('MODULE_PAYMENT_SHIFT4_TEXT_ADMIN_TITLE', 'Shift4: Secure Payment Processing'); // Plugin title
define('MODULE_PAYMENT_SHIFT4_TEXT_DESCRIPTION', '<center><img src="images/Shift4.png" /><br /><br /><a href="http://www.shift4.com/zencart_merchant" target="_blank">Click Here to Learn More About Shift4</a><br /><br /><span style="font-size: .85em; color: #777;">Version 1.0.0a</span></center><br /><hr />');

// Catalog Items
define('MODULE_PAYMENT_SHIFT4_TEXT_CATALOG_TITLE', 'Credit Card');  // Payment option title to be displayed to the customer
define('MODULE_PAYMENT_SHIFT4_TEXT_CREDIT_CARD_TYPE', 'Credit Card Type:');
define('MODULE_PAYMENT_SHIFT4_TEXT_CREDIT_CARD_OWNER', 'Credit Card Owner:');
define('MODULE_PAYMENT_SHIFT4_TEXT_CREDIT_CARD_NUMBER', 'Credit Card Number:');
define('MODULE_PAYMENT_SHIFT4_TEXT_CREDIT_CARD_EXPIRES', 'Expiration Date:');
define('MODULE_PAYMENT_SHIFT4_TEXT_CVV', 'Card Security Code:');
define('MODULE_PAYMENT_SHIFT4_TEXT_POPUP_CVV_LINK', '<span style="border: none;">&nbsp;What\'s this?</span>');
define('MODULE_PAYMENT_SHIFT4_TEXT_JS_CC_OWNER', '* The credit card owner\'s name must be at least ' . CC_OWNER_MIN_LENGTH . ' characters.');
define('MODULE_PAYMENT_SHIFT4_TEXT_JS_CC_NUMBER', '* The credit card number must be at least ' . CC_NUMBER_MIN_LENGTH . ' characters.');
define('MODULE_PAYMENT_SHIFT4_TEXT_JS_CC_CVV', '* The CVV number must be entered.');
define('MODULE_PAYMENT_SHIFT4_TEXT_DECLINED_MESSAGE', 'The credit card information could not be authorized. Please correct your information and try again, or contact us for assistance.');
define('MODULE_PAYMENT_SHIFT4_TEXT_ERROR', 'Credit Card Error');
define('MODULE_PAYMENT_SHIFT4_TEXT_TIMEOUT_MESSAGE', 'There was a problem communicating with the credit card processor. Please try again, or contact us for assistance.');
define('MODULE_PAYMENT_SHIFT4_TEXT_DECLINED_AVS_MESSAGE', 'There was a problem verifying the billing address. Please correct your information and try again, or contact us for assistance.');
define('MODULE_PAYMENT_SHIFT4_TEXT_FAILED_TESTING_CREDENTIALS', 'There was a problem loading the demo API credentials');

// Additional Items
define('MODULE_PAYMENT_SHIFT4_URL_PATH', '/api/S4Tran_Action.cfm');
define('MODULE_PAYMENT_SHIFT4_I4GO_URL_PATH', '/index.cfm?fuseaction=account.DirectPostCardEntry');
define('MODULE_PAYMENT_SHIFT4_MODULE_VERSION', 'S4ZenCart1.0.2RC1');
?>
