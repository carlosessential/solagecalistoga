<?php

/**
 * SALES REPORT 2.3.2
 *
 * The language file contains all the text that appears on the report. The first set of
 * configuration defines actually impact the report's output and behavior.
 *
 * @author     Frank Koehl (PM: BlindSide)
 * @author     Conor Kerr <conor.kerr_zen-cart@dev.ceon.net>
 * @copyright  Portions Copyright 2003-2006 Zen Cart Development Team
 * @copyright  Portions Copyright 2003 osCommerce
 * @license    http://www.gnu.org/copyleft/gpl.html   GNU Public License V2.0
 * 
 * author Czech translation :  Josef Zahradník
 * web:                        www.magic-shop.cz   
 */


/*
** CONFIGURATION DEFINES
*/
//////////////////////////////////////////////////////////
// DEFAULT SEARCH OPTIONS
// These values are loaded into the report when (a) the
// report is laoded fresh, or (b) when the defaults button
// is pressed.  If you prefer to have no option set for a
// given entry, you may leave its define empty. Valid
// entries are in the comments following each define.
// Default settings are in brackets [].
//
define('DATE_FORMAT_SHORT', '%d.%m.%Y');  // this is used for strftime()
define('DATE_FORMAT_LONG', '%A %d. %B %Y'); // this is used for strftime()
define('DATE_FORMAT', 'd.m.Y'); // this is used for date()
define('PHP_DATE_TIME_FORMAT', 'm.d.Y H:i:s'); // this is used for date()
define('DATE_TIME_FORMAT', DATE_FORMAT_SHORT . ' %H:%M:%S');
define('DATE_FORMAT_SPIFFYCAL', 'dd.MM.yyyy');  //Use only 'dd', 'MM' and 'yyyy' here in any order

define('DEFAULT_DATE_SEARCH_TYPE', 'preset'); // ['preset'], 'custom' (cannot be empty if next 3 options are set!)
define('DEFAULT_DATE_PRESET', 'today'); // ['yesterday'], 'this_month', 'last_month', 'custom'
define('DEFAULT_START_DATE', ''); // (date in mm-dd-yyyy format)
define('DEFAULT_END_DATE', ''); // (date in mm-dd-yyyy format)

define('DEFAULT_DATE_TARGET', 'purchased'); // ['purchased'], 'status'
define('DEFAULT_DATE_STATUS', '10'); // (status number) [lowest status number]
define('DEFAULT_PAYMENT_METHOD', 'linkpoint_api'); // [any entry in `orders.payment_module_code` field]
define('DEFAULT_CURRENT_STATUS', ''); // [status number]
define('DEFAULT_MANUFACTURER', ''); // manufacturers_id from Admin > Catalog > Manufacturers ("mID=##" in the URL)

define('DEFAULT_TIMEFRAME', 'day'); // ['day'], 'week', 'month', 'year'
define('DEFAULT_TIMEFRAME_SORT', ''); // ['asc'], 'desc'
define('DEFAULT_DETAIL_LEVEL', 'product'); // ['timeframe'], 'product', 'order', 'matrix'

// order line items: 'oID', 'last_name', 'num_products', 'goods', 'shipping', 'discount', 'gc_sold', 'gc_used', 'grand'
// product line items: 'pID', 'name', 'manufacturer', 'model', 'base_price', 'quantity', 'onetime_charges', 'grand'
define('DEFAULT_LI_SORT_A', 'model');
define('DEFAULT_LI_SORT_ORDER_A', ''); // 'asc', 'desc'
define('DEFAULT_LI_SORT_B', 'name');
define('DEFAULT_LI_SORT_ORDER_B', ''); // 'asc', 'desc'

define('DEFAULT_OUTPUT_FORMAT', 'print'); // ['display'], 'print', 'csv'
define('DEFAULT_AUTO_PRINT', ''); // 'true', ['false']
define('DEFAULT_CSV_HEADER', ''); // 'true', ['false']


//////////////////////////////////////////////////////////
// DISPLAY EMPTY TIMEFRAME LINES
// Setting this define to true will disable displaying
// a timeframe line if that timeframe is empty.  By
// default, an empty timeframe displays the value of the
// define TEXT_NO_DATA.
//
// Be aware, if this is enabled and your search yields
// no results at all, the screen will look as if no search
// was performed (which is why this is disabled by default)
//
define('DISPLAY_EMPTY_TIMEFRAMES', false);

//////////////////////////////////////////////////////////
// REPORTING A SUBSET OF CUSTOMERS / PRODUCTS
// By checking the boxes to 'Only Include Specific customers
// or Products (SEARCH_SPECIFIC_CUSTOMERS/PRODUCTS),
// only orders for those customers / products will be
// included in the result. By default, the included customers/
// products will be printed above the results table. If this
// gets too long, this printout can be disabled with
// the DISPLAY booleans below.
//
// If you often want a specific product, you can set a 
// default here, e.g.:
// define('INCLUDE_PRODUCTS', '10, 15');
//
define('INCLUDE_PRODUCTS', '');
define('INCLUDE_CUSTOMERS', '');
define('DISPLAY_TABLE_HEADING_CUSTOMERS', true);
define('DISPLAY_TABLE_HEADING_PRODUCTS', true);
define('TEXT_CUSTOMER_TABLE_HEADING', ' Objednávky k: ');  //Prefix used to print before customer name(s) when filtering by customer


//////////////////////////////////////////////////////////
// PRODUCT MANUFACTURERS COLUMN
// Setting this define to true will display the
// manufacturer on each product line item, and will default
// to the value of TEXT_NONE if there is no manufacturer.
// False will remove the manufacturer column from the report.
//
define('DISPLAY_MANUFACTURER', false);


//////////////////////////////////////////////////////////
// ONE-TIME FEES COLUMN
// If your store does not have *any* one-time fees on its
// products, you can disable displaying the column.
//
// Note that this switch does not affect math calculations,
// so if you happen to have a product with fees attached,
// they will still be accounted for and appear in the total.
//
define('DISPLAY_ONE_TIME_FEES', false);


//////////////////////////////////////////////////////////
// DECIMAL PLACES IN AVERAGES
// Sets the number of decimal places displayed in averages
// on timeframe statistics display
//
define('NUM_DECIMAL_PLACES', 2);


//////////////////////////////////////////////////////////
// TIMEFRAME DATE DISPLAY
// These control the display format of the start and end
// dates of each timeframe line.  Each define corresponds
// to the timeframe of its namesake.  See the PHP manual
// entry on the date() function for a table on the accepted
// formatting characters: http://us2.php.net/date
//
if (strtolower(DATE_FORMAT) == 'm/d/y') {
  // Use US date format (m/d/Y)
  define('TIME_DISPLAY_DAY', 'n-j-Y');
  define('TIME_DISPLAY_WEEK', 'n-j-Y');
  define('TIME_DISPLAY_MONTH', 'n-j-Y');
  define('TIME_DISPLAY_YEAR', 'n-j-Y');
  define('DATE_SPACER', ' thru<br/>&nbsp;&nbsp;&nbsp;');
} else if (strtolower(DATE_FORMAT) == 'd/m/y') {
  // Use UK date format (d/m/Y)
  define('TIME_DISPLAY_DAY', 'jS-M-y');
  define('TIME_DISPLAY_WEEK', 'jS-M-y');
  define('TIME_DISPLAY_MONTH', 'jS-M-y');
  define('TIME_DISPLAY_YEAR', 'jS-M-y');
  define('DATE_SPACER', ' to<br/>&nbsp;&nbsp;&nbsp;');
} else if (strtolower(DATE_FORMAT) == 'd.m.y') {
  // Use UK date format (d/m/Y)
  define('TIME_DISPLAY_DAY', 'd.m.Y');
  define('TIME_DISPLAY_WEEK', 'd.m.Y');
  define('TIME_DISPLAY_MONTH', 'd.m.Y');
  define('TIME_DISPLAY_YEAR', 'd.m.Y');
  define('DATE_SPACER', ' to<br/>&nbsp;&nbsp;&nbsp;');
}


//////////////////////////////////////////////////////////
// EXCLUDE SPECIFIED PRODUCTS
// Prevents specified products from appearing on the sales
// report at all.  **ADDING PRODUCTS TO THIS DEFINE WILL
// IMPACT TOTALS CALCULATIONS!**
//
// The value of the product will be excluded from totals
// for gc_sold, gc_sold_qty, goods, num_products, and
// diff_products.
//
// The values for gc_used, gc_used_qty, discount,
// discount_qty, tax, and shipping all come from the
// orders_total table, and so CANNOT be excluded based
// on product ID.
//
// If an order is made up entirely of excluded products,
// and has no shipping, discounts, tax, or used gift
// certificates, it will have a total of 0.  In this
// situation, the order will not be displayed in the results.
//
// EXAMPLE: define('EXCLUDE_PRODUCTS', serialize(array(25, 14, 43)) );
//
define('EXCLUDE_PRODUCTS', serialize(array( )));



/*
** LANGUAGE DEFINES
*/
// Search menu heading
define('PAGE_HEADING', 'Zpráva o prodeji');
define('HEADING_TITLE_SEARCH', '1. Shromáždìní &amp; filtrování dat');
define('HEADING_TITLE_SORT', '2. Setøídit &amp; upøesnit výsledky');
define('HEADING_TITLE_PROCESS', '3. Vytvoøit zprávu');
define('SEARCH_TIMEFRAME', 'Èasový rámec');
define('SEARCH_TIMEFRAME_DAY', 'Den');
define('SEARCH_TIMEFRAME_WEEK', 'Týden');
define('SEARCH_TIMEFRAME_MONTH', 'Mìsíc');
define('SEARCH_TIMEFRAME_YEAR', 'Roènì');
define('SEARCH_TIMEFRAME_SORT', 'Setøídit èasový rámec');
define('SEARCH_DATE_PRESET', 'Datumová pøedvolba');
define('SEARCH_DATE_CUSTOM', 'Volitelná datumová pøedovolba');
define('SEARCH_DATE_TODAY', 'Dnes (%s)');
define('SEARCH_DATE_YESTERDAY', 'Vèera (%s)');
define('SEARCH_DATE_LAST_MONTH', 'Pøedchozí mìsíc (%s)');
define('SEARCH_DATE_THIS_MONTH', 'Tento mìsíc (%s)');
define('SEARCH_START_DATE', 'Zaèátek datumu');
define('SEARCH_END_DATE', 'Konec datumu (vèetnì)');
define('SEARCH_DATE_FORMAT', 'mm/dd/yyyy');
define('SEARCH_DATE_TARGET', 'Vyhledávání dne...');
define('SEARCH_PAYMENT_METHOD', 'Zpùsob platby');
define('SEARCH_CURRENT_STATUS', 'Aktuální stav objednávky');
define('SEARCH_SPECIFIC_CUSTOMERS', 'Zahrnout pouze konkrétní zákazníky ID (seznam oddìlený èárkami)');
define('SEARCH_SPECIFIC_PRODUCTS', 'Zahrnout pouze specifické produkty ID (seznam oddìlený èárkami)');
define('SEARCH_MANUFACTURER', 'Výrobce produktu');
define('SEARCH_DETAIL_LEVEL', 'Zobrazených informací');
define('SEARCH_OUTPUT_FORMAT', 'Výstupní formát');
define('SEARCH_SORT_PRODUCT', 'Øadit podle produktu...');
define('SEARCH_SORT_ORDER', 'Øadit podle objednávky...');
define('SEARCH_SORT_THEN', 'Potom øadit podle...');
define('BUTTON_SEARCH', 'Ukaž mi peníze!');
define('BUTTON_LOAD_DEFAULTS', 'Výchozí zpráva');
define('BUTTON_DEFAULT_SEARCH', 'Rychlé hledání');
define('SEARCH_WAIT_TEXT', 'Zpracování, èekejte prosím...');


// Form element text
// radio buttons
define('RADIO_DATE_TARGET_PURCHASED', 'Objednávka nákupu');
define('RADIO_DATE_TARGET_STATUS', 'Pøidìlen status (vyberte níže)');
define('RADIO_TIMEFRAME_SORT_ASC', 'Nejstarší nahoøe');
define('RADIO_TIMEFRAME_SORT_DESC', 'Nejnovìjší nahoøe');
define('RADIO_LI_SORT_ASC', 'Vzestupnì');
define('RADIO_LI_SORT_DESC', 'Sestupnì');

// dropdown menus
define('SELECT_DETAIL_TIMEFRAME', 'Èasový rámec celkovì');
define('SELECT_DETAIL_PRODUCT', '&nbsp;+ Produkty - øádkový výpis');
define('SELECT_DETAIL_ORDER', '&nbsp;+ Objednávky - øádkový výpis');
define('SELECT_DETAIL_MATRIX', 'Èasový rámec - statistika');
define('SELECT_OUTPUT_DISPLAY', 'Na obrazovce');
define('SELECT_OUTPUT_PRINT', 'Tiskvový formát');
define('SELECT_OUTPUT_CSV', 'CSV Export');
define('SELECT_PRODUCT_ID', 'Produkt ID');
define('SELECT_QUANTITY', 'Množství');
define('SELECT_LAST_NAME', 'Odbìratel - poslední jméno');

// checkboxes
define('CHECKBOX_AUTO_PRINT', 'Print report automatically');
define('CHECKBOX_CSV_HEADER', 'Column titles in first row');
define('CHECKBOX_NEW_WINDOW', 'Open results in new window');


// checkboxes
define('CHECKBOX_AUTO_PRINT', 'Tiskové sestavy automaticky');
define('CHECKBOX_CSV_HEADER', 'Názvy sloupcù v prvním øádku');
define('CHECKBOX_NEW_WINDOW', 'Otevøít výsledky v novém oknì');


// Report Column Headings
// Timeframe
define('TABLE_HEADING_TIMEFRAME', 'Èasový rámec');
define('TABLE_HEADING_NUM_ORDERS', 'Poèet objednávek');
define('TABLE_HEADING_NUM_PRODUCTS', 'Poèet produktù');
define('TABLE_HEADING_TOTAL_GOODS', 'Hodnota zboží');
define('TABLE_HEADING_TAX', 'DPH');
define('TABLE_HEADING_GOODS_TAX', 'DPH zboží');
define('TABLE_HEADING_ORDER_RECORDED_TAX', 'Order Rec. Tax');
define('TABLE_HEADING_SHIPPING', 'Doprava');
define('TABLE_HEADING_DISCOUNTS', 'Slevy');
define('TABLE_HEADING_GC_SOLD', 'Dárkový certifikát - prodáno');
define('TABLE_HEADING_GC_USED', 'Dárkový certifikát - použité');
define('TABLE_HEADING_TOTAL', 'Celkem');
define('TABLE_FOOTER_TIMEFRAMES', ' èasových rámcù');

// Order Line Items
define('TABLE_HEADING_ORDERS_ID', 'Objednávka ID');
define('TABLE_HEADING_CUSTOMER', 'Odbìratel');
define('TABLE_HEADING_ORDER_TOTAL', 'Objednávka celkem');
define('TABLE_HEADING_ORDER_TOTAL_VALIDATION', 'OT Valid');

// Product Line Items
define('TABLE_HEADING_PRODUCT_ID', 'Produkt ID');
define('TABLE_HEADING_PRODUCT_NAME', 'Produkt jméno');
define('TABLE_HEADING_MANUFACTURER', 'Výrobce');
define('TABLE_HEADING_MODEL', 'Model èíslo');
define('TABLE_HEADING_BASE_PRICE', 'Základní cena');
define('TABLE_HEADING_QUANTITY', 'Množství');
define('TABLE_HEADING_ONETIME_CHARGES', '1-time Fees');
define('TABLE_HEADING_PRODUCT_TOTAL', 'Produktù celkem');

// Data Matrix
define('MATRIX_GENERAL_STATS', 'Základní statistiky');
define('MATRIX_ORDER_REVENUE', 'Pøíjmy celkem');
define('MATRIX_ORDER_PRODUCT_COUNT', 'Poèet produktù celkem');
define('MATRIX_LARGEST', 'Nejvìtší objednávka: ');
define('MATRIX_SMALLEST', 'Nejmenší objednávka: ');
define('MATRIX_AVERAGES', 'Prùmìry');
define('MATRIX_AVG_ORDER', '&nbsp;hodnoty objednávky');
define('MATRIX_AVG_PROD_ORDER', '&nbsp;Výrobkù na objednávku');
define('MATRIX_AVG_PROD_ORDER_DIFF', '&nbsp;Unikátní výrobky na objednávku');
define('MATRIX_AVG_ORDER_CUST', '&nbsp;Objednávky zákazníka');
define('MATRIX_ORDER_STATS', 'Statistika objednávky');
define('MATRIX_TOTAL_PAYMENTS', 'Payment Methods');
define('MATRIX_TOTAL_CC', 'Credit Cards');
define('MATRIX_TOTAL_SHIPPING', 'Shipping Methods');
define('MATRIX_TOTAL_CURRENCIES', 'Used Currencies');
define('MATRIX_TOTAL_CUSTOMERS', 'Unique Customers');
define('MATRIX_PRODUCT_STATS', 'Product Stats');
define('MATRIX_PRODUCT_SPREAD', 'Product Spread');
define('MATRIX_PRODUCT_REVENUE_RATIO', 'Total Revenue %');
define('MATRIX_PRODUCT_QUANTITY_RATIO', 'Total Quantity %');


// CSV Export
define('CSV_FILENAME_PREFIX', 'sales_');
define('CSV_HEADING_START_DATE', 'Start Date');
define('CSV_HEADING_END_DATE', 'End Date');
define('CSV_HEADING_LAST_NAME', 'Last Name');
define('CSV_HEADING_FIRST_NAME', 'First Name');
define('CSV_SEPARATOR', ',');
define('CSV_NEWLINE', "\n");


// Print Format
define('PRINT_DATE_TO', ' - ');
define('PRINT_DATE_TARGET', 'Date of ');
define('PRINT_TIMEFRAMES', '%s timeframes sorted %s');
define('PRINT_DATE_PURCHASED', 'order creation');
define('PRINT_DATE_STATUS', 'assigned status');
define('PRINT_ORDER_STATUS', '%s [%s]');
define('PRINT_PAYMENT_METHOD', 'Payment Method:');
define('PRINT_CURRENT_STATUS', 'Current Order Status:');
define('PRINT_DETAIL_LEVEL', 'Displaying ');

// javascript pop-up alert window
define('ALERT_JS_HIGHLIGHT', '#FF40CF');
define('ALERT_MSG_START', "There are one or more errors with your search parameters:");
define('ALERT_DATE_INVALID', "> One of the dates you entered is not valid");
define('ALERT_DATE_MISSING', "> You must choose a preset date, or define a date range");
define('ALERT_CSV_CONFLICT', "> CSV output is not available for " . SELECT_DETAIL_MATRIX . " display");
define('ALERT_MSG_FINISH', "Please correct the issue(s) and resubmit your search.");

// Other text defines
define('ERROR_MISSING_REQ_INFO', 'Chyba: Povinná pole jsou prázdná');
define('ALT_TEXT_SORT_ASC', 'Tøídit vzestupnì order');
define('ALT_TEXT_SORT_DESC', 'Tøídit sestupnì order');
define('TEXT_REPORT_TIMESTAMP', 'Èas reportu: ');
define('TEXT_PARSE_TIME', 'Parse èas: %s sec.');
define('TEXT_EMPTY_SELECT', '(Nezáleží na tom)');
define('TEXT_QTY', '| Qty: ');
define('TEXT_DIFF', '| Rozdíl: ');
define('TEXT_SAME', '| (stejný)');
define('TEXT_SAME_ONE', '| --');
define('TEXT_PRINT_FORMAT', 'zobrazení zprávy v tištìné podobì');
define('TEXT_PRINT_FORMAT_TITLE', 'TIP: click \'' . PAGE_HEADING . '\' vrátit se do zobrazení displeje');
define('TEXT_NO_DATA', '-- Žádná objednávka --');
?>
