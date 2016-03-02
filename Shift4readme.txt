============================================
SHIFT4 PAYMENT MODULE FOR ZEN CART 1.39h
VERSION: 1.0
COPYRIGHT: 2011 Shift4 Corporation
DATE: 9/6/2011
============================================

REQUIREMENTS
============
> A working installation of Zen Cart v1.3.9h
> PHP 5.3.x with cURL (libcurl) installed and enabled
> MySQL 5.x
> Apache 2.2 
> A valid SSL certificate
> Dollars on the Net (DOTN) and i4Go accounts with Shift4 Corporation

FILES CHANGED
=============
admin/includes/languages/english/store_manager.php
admin/modules.php
admin/orders.php
admin/store_manager.php
admin/includes/functions/general.php
email/email_template_checkout.html
includes/classes/order.php
includes/modules/pages/checkout_confirmation/header_php.php
includes/templates/template_default/templates/tpl_checkout_payment_default.php

ADDITIONAL FILES & FOLDERS
==========================
admin/images/icons/custom_range.gif
admin/images/icons/down_arrow.gif
admin/images/icons/icon_print.gif
admin/images/icons/preset_range.gif
admin/images/icons/up_arrow.gif
admin/images/Shift4.png
admin/stats_sales_report.php
admin/includes/boxes/extra_boxes/sales_report_reports_dhtml.php
admin/includes/classes/sales_report.php
admin/includes/extra_datafiles/sales_report_filenames.php
admin/includes/javascript/sales_report.js.php
admin/includes/languages/english/extra_definitions/stats_sales_report.php
admin/includes/languages/english/stats_sales_report.php
admin/includes/languages/czech/extra_definitions/stats_sales_report.php
admin/includes/languages/czech/stats_sales_report.php
includes/languages/english/modules/payment/shift4.php
includes/modules/payment/shift4.php
includes/modules/payment/shift4/shift4_admin_notification.php
includes/modules/payment/shift4/btn_info.gif

DATABASE CHANGES
================
NOTE: These changes are automatically made when the module is installed, and are not removed when the module is uninstalled to keep the transaction records for reporting purposes.
Additional columns in the "orders" table: "shift4_invoice", "shift4_unique_id", "shift4_order_mode", "shift4_is_auth_only"
Additional columns in the "orders_status_history" table: "shift4_amount_captured", "shift4_is_partial_capture", "shift4_is_voided", "shift4_amount_refunded"
Additional table called "shift4_logs"
Additional table called "shift4_invoices"
Additional table called "shift4_timeout_log"


NOTES
=====
>> Order ID in Zen Cart will not match with the Dollars on the Net Invoice #. The Dollars on the Net Invoice # will appear on the order record.

>> As part of the Zen Cart installation, the "admin" folder must be renamed. Therefore, the name of the Shift4 module folder "admin" will not match the name of the Zen Cart installed version. Prior to installation, the Shift4 module's "admin" folder must be renamed to match the name of the "admin" folder in the user's Zen Cart installation.

>> To edit displayed error messages when a card transaction is declined, modify languages/english/modules/payment/shift4.php

>> The folder "cache/Shift4" is created automatically during module installation to store Shift4 module log files. To clear log files from Zen Cart administration panel, click Tools > Store Manager. Look for "Cleanup Debug Log Files" and click the "confirm" button. These log files can also be deleted manually after navigating directly to the "cache/Shift4" folder.

SUPPORT
=======
http://www.shift4.com/contact_us.cfm

