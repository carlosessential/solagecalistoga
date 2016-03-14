<?php
/**
 * Common Template - tpl_header.php
 *
 * this file can be copied to /templates/your_template_dir/pagename<br />
 * example: to override the privacy page<br />
 * make a directory /templates/my_template/privacy<br />
 * copy /templates/templates_defaults/common/tpl_footer.php to /templates/my_template/privacy/tpl_header.php<br />
 * to override the global settings and turn off the footer un-comment the following line:<br />
 * <br />
 * $flag_disable_header = true;<br />
 *
 * @package templateSystem
 * @copyright Copyright 2003-2012 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version GIT: $Id: Author: Ian Wilson  Tue Aug 14 14:56:11 2012 +0100 Modified in v1.5.1 $
 * Modifies by Anne (Picaflor-Azul.com), Winchester Black v1.0
 */
?>

<!--bof-header logo and navigation display-->
<?php
if (!isset($flag_disable_header) || !$flag_disable_header) {
?>
<?php
/**
 ******************************* BOF 2.1 **********************************
 */
?>
<div id="headerWrapper" class="<?php echo $fluidisFixed; ?>">
<?php
/**
 ******************************* EOF 2.1 **********************************
 */
?>

<div id="top-wrapper">
<div class="onerow-fluid <?php echo $fluidisFixed; ?>" id="top-inner">
<div id="top-inner-wrapper">
    <div class="top-specials"><a href="https://www.solagecalistoga.com/">Solage Calistoga Home</a></div>
    <div class="top-specials"><a href="https://www.solagecalistoga.com/resort">Resort</a></div>
    <div class="top-specials"><a href="https://www.solagecalistoga.com/gallery">Gallery</a></div>
    <div class="top-specials"><a href="https://www.solagecalistoga.com/dine">Dine</a></div>
    <div class="top-specials"><a href="https://www.solagecalistoga.com/stay">Stay</a></div>
    <div class="top-specials"><a href="https://www.solagecalistoga.com/spa">Spa</a></div>
    <div class="top-specials"><a href="https://www.solagecalistoga.com/explore">Explore</a></div>
    <div class="top-specials"><a href="https://www.solagecalistoga.com/events">Events</a></div>
    <div class="top-specials"><a href="https://www.solagecalistoga.com/getaways">Getaways</a></div>
    <div class="top-specials"><a href="https://www.solagecalistoga.com/contact">Contact</a></div>
    <div class="top-specials"><a href="https://gc.synxis.com/rez.aspx?Hotel=60898&Chain=16771&_ga=1.1640945.1765826002.1454649472">Book Now</a></div>
</div>
</div>
</div>


<div id="top-middle">
<div class="onerow-fluid logo<?php echo $fluidisFixed; ?>">




<!--bof-branding display-->
<div id="logoWrapper">
    <div id="logo"><?php echo '<a href="' . HTTP_SERVER . DIR_WS_CATALOG . '">' . zen_image($template->get_template_dir(HEADER_LOGO_IMAGE, DIR_WS_TEMPLATE, $current_page_base,'images'). '/' . HEADER_LOGO_IMAGE, HEADER_ALT_TEXT, HEADER_LOGO_WIDTH, HEADER_LOGO_HEIGHT) . '</a>'; ?>
    </div>
<?php if (HEADER_SALES_TEXT != '' || (SHOW_BANNERS_GROUP_SET2 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET2))) { ?>
    <div id="taglineWrapper">
<?php
              if (HEADER_SALES_TEXT != '') {
?>
      <div id="tagline">

<?php echo HEADER_SALES_TEXT;?>

      </div>
<?php
              }
?>
<?php
              if (SHOW_BANNERS_GROUP_SET2 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET2)) {
                if ($banner->RecordCount() > 0) {
?>
      <div id="bannerTwo" class="banners"><?php echo zen_display_banner('static', $banner);?></div>
<?php
                }
              }
?>
    </div>
<?php } // no HEADER_SALES_TEXT or SHOW_BANNERS_GROUP_SET2 ?>
</div>
</div>
<div class="onerow-fluid menu<?php echo $fluidisFixed; ?>">

<!--bof handheld menu display-->
<?php require($template->get_template_dir('tpl_modules_mobile_categories_tabs.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_mobile_categories_tabs.php'); ?>
<!--eof handheld menu display-->


<?php if ($detect->isMobile() && !$detect->isTablet() or $detect->isMobile() && !$detect->isTablet() && $_SESSION['display_mode']=='isMobile' or $detect->isTablet() && $_SESSION['display_mode']=='isMobile' or $_SESSION['display_mode']=='isMobile') { ?>

<div id="mobile-nav1">
<?php } else if ($detect->isTablet() or $detect->isMobile() && $_SESSION['display_mode']=='isTablet' or $detect->isTablet() && $_SESSION['display_mode']=='isTablet' or $_SESSION['display_mode']=='isTablet'){ ?>

<div id="mobile-nav1">
<?php } else if ($detect->isMobile() && !$detect->isTablet() && $_SESSION['display_mode']=='isDesktop' or $detect->isTablet() && $_SESSION['display_mode']=='isDesktop' or $_SESSION['display_mode']=='isNonResponsive'){ ?>

<div id="mobile-nav1" class="hidenav1">
<?php } else { ?>

<div id="mobile-nav1">
<?php } ?>


<a href="<?php echo zen_href_link(FILENAME_ACCOUNT, '', 'SSL'); ?>"><i class="fa fa-user"></i></a>

<a href="<?php echo zen_href_link(FILENAME_ADVANCED_SEARCH); ?>"><i class="fa fa-search"></i></a>

<div class="header-cart">
   <a href="<?php echo zen_href_link(FILENAME_SHOPPING_CART, '', 'NONSSL'); ?>">
      <div style="display:inline-block;"><?php echo $currencies->format($_SESSION['cart']->show_total());?></div>
      <div class="items-amount" style="display:inline-block;"><?php echo $_SESSION['cart']->count_contents();?> Items </div>
      <div style="display:inline-block;"><?php echo zen_image($template->get_template_dir(ICON_IMAGE_TINYCART, DIR_WS_TEMPLATE, $current_page_base,'images/icons'). '/' . ICON_IMAGE_TINYCART, ICON_TINYCART_ALT)?></div>
    </a>
   <?php if ($_SESSION['cart']->count_contents() != 0) { ?>
    <?php }?>
</div>
</div>


<!--bof-navigation display-->
<div id="navMainWrapper">
<div class="header-cart">
    <a href="<?php echo zen_href_link(FILENAME_SHOPPING_CART, '', 'NONSSL'); ?>">
      <div style="display:inline-block;"><?php echo $currencies->format($_SESSION['cart']->show_total());?></div>
      <div class="items-amount" style="display:inline-block;"><?php echo $_SESSION['cart']->count_contents();?> Items </div>
      <div style="display:inline-block;"><?php echo zen_image($template->get_template_dir(ICON_IMAGE_TINYCART, DIR_WS_TEMPLATE, $current_page_base,'images/icons'). '/' . ICON_IMAGE_TINYCART, ICON_TINYCART_ALT)?></div>
    </a>
   <?php if ($_SESSION['cart']->count_contents() != 0) { ?>
<?php }?>
</div>
<!--eof-navigation display-->

<div id="navMainSearch"><?php require(DIR_WS_MODULES . 'sideboxes/search_header.php'); ?>
</div>
</div>



<br class="clearBoth" />
<!--eof-branding display-->
<!--eof-header logo and navigation display-->
</div>
<div class="onerow-fluid breadcrumb">
  <!-- bof  breadcrumb -->
  <div id="navBreadCrumb">You are here: <?php echo $breadcrumb->trail(BREAD_CRUMBS_SEPARATOR); ?></div>
  <!-- eof breadcrumb -->
</div>
</div>

<!--bof-optional categories tabs navigation display-->
<?php require($template->get_template_dir('tpl_modules_categories_tabs.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_categories_tabs.php'); ?>
<!--eof-optional categories tabs navigation display-->

<!--bof-header ezpage links-->
<?php if (EZPAGES_STATUS_HEADER == '1' or (EZPAGES_STATUS_HEADER == '2' and (strstr(EXCLUDE_ADMIN_IP_FOR_MAINTENANCE, $_SERVER['REMOTE_ADDR'])))) { ?>
<?php require($template->get_template_dir('tpl_ezpages_bar_header.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_ezpages_bar_header.php'); ?>
<?php } ?>
<!--eof-header ezpage links-->
</div>
<?php
    if ($this_is_home_page) {
?>
<?php
    } ?>




<?php } ?>