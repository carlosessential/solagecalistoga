<?php
//
// +----------------------------------------------------------------------+
// | Replacement Categories Tree                                          |
// +----------------------------------------------------------------------+
// | Copyright (c) 2005,2007 Christoph Handel                             |
// | Copyright (c) 2003 The zen-cart developers                           |
// |                                                                      |
// | http://www.held-im-ruhestand.de/                                     |
// | http://www.zen-cart.com/index.php                                    |
// |                                                                      |
// | Portions Copyright (c) 2003 osCommerce                               |
// +----------------------------------------------------------------------+
// | This program is free software; you can redistribute it and/or modify |
// | it under the terms of the GNU General Public License as published by |
// | the Free Software Foundation; either version 2 of the License, or    |
// | (at your option) any later version.                                  |
// |                                                                      |
// | This program is distributed in the hope that it will be useful,      |
// | but WITHOUT ANY WARRANTY; without even the implied warranty of       |
// | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        |
// | GNU General Public License for more details.                         |
// |                                                                      |
// | This source file is subject to version 2.0 of the GPL license,       |
// | that is bundled with this package in the file LICENSE, and is        |
// | available through the world-wide-web at the following url:           |
// | http://www.gnu.org/licenses/gpl.txt                                  |
// | Or write to the Free Software Foundation, Inc.,                      |
// | 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA             |
// +----------------------------------------------------------------------+
//

// require generator

//CHRISTOPH BOF
require_once (DIR_WS_CLASSES . 'ch_categories_tree_generator.php');

$main_category_tree = new ch_category_tree;
//CHRISTOPH EOF
$row = 0;
$box_categories_array = array();

// don't build a tree when no categories
$check_categories = $db->Execute("select categories_id from " . TABLE_CATEGORIES . " where categories_status=1 limit 1");
if ($check_categories->RecordCount() > 0) {
	$box_categories_array = $main_category_tree->zen_category_tree();
}

require($template->get_template_dir('tpl_categories.php',DIR_WS_TEMPLATE, $current_page_base,'sideboxes'). '/tpl_categories.php');

$title = BOX_HEADING_CATEGORIES;

require($template->get_template_dir($column_box_default, DIR_WS_TEMPLATE, $current_page_base,'common') . '/' . $column_box_default);
?>
