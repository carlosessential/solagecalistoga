<?php
/**
 * Module Template - categories_tabs
 *
 * Template stub used to display categories-tabs output
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_modules_categories_tabs.php 3395 2006-04-08 21:13:00Z ajeh $
 */


?>



<div id="menu">
<ul class="slimmenu">
  <li class="menu-contact">
    <?php
        // load the UL-generator class and produce the menu list dynamically from there
        require_once (DIR_WS_CLASSES . 'categories_ul_generator.php');
    $zen_CategoriesUL = new zen_categories_ul_generator;
    $menulist = $zen_CategoriesUL->buildTree(true);
    echo $menulist;
    ?>
  </li>   

    <li class="menu-contact"><a href="<?php echo zen_href_link(FILENAME_CONTACT_US, '', 'NONSSL'); ?>" class="mcontact"><?php echo TITLE_CONTACT; ?></a></li>
    <li class="menu-contact">
      
  <?php if ($_SESSION['customer_id']) { ?>
    <li class="menu-contact">
    <a href="<?php echo zen_href_link(FILENAME_ACCOUNT, '', 'SSL'); ?>" class="mcontact"><?php echo HEADER_TITLE_MY_ACCOUNT; ?></a>
    </li>
    <li class="menu-contact">
    <a href="<?php echo zen_href_link(FILENAME_LOGOFF, '', 'SSL'); ?>" class="mcontact"><?php echo HEADER_TITLE_LOGOFF; ?></a>
    </li>
<?php
      } else {
        if (STORE_STATUS == '0') {
?>
    <li class="menu-contact">
    <a href="<?php echo zen_href_link(FILENAME_LOGIN, '', 'SSL'); ?>" class="mcontact"><?php echo HEADER_TITLE_LOGIN; ?></a>
    </li>
<?php } } ?>
    </li>

</ul>

</div>

<script src="<?php echo $template->get_template_dir('jquery.slimmenu.min.js',DIR_WS_TEMPLATE, $current_page_base,'jscript') . '/jquery.slimmenu.min.js' ?>" type="text/javascript"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" type="text/javascript"></script> 

	<?php if ($detect->isMobile() && !$detect->isTablet() or $detect->isMobile() && !$detect->isTablet() && $_SESSION['display_mode']=='isMobile' or $detect->isTablet() && $_SESSION['display_mode']=='isMobile' or $_SESSION['display_mode']=='isMobile') { ?>

<script type="text/javascript">
    $('ul.slimmenu').slimmenu(
			      {
			      resizeWidth: '800',
				  collapserTitle: '',
				  animSpeed: 'medium',
				  easingEffect: null,
				  indentChildren: false,
				  childrenIndenter: '&nbsp;'
				  });
</script>

<?php } else if ($detect->isTablet() or $detect->isMobile() && $_SESSION['display_mode']=='isTablet' or $detect->isTablet() && $_SESSION['display_mode']=='isTablet' or $_SESSION['display_mode']=='isTablet'){ ?>

<script type="text/javascript">
    $('ul.slimmenu').slimmenu(
			      {
			      resizeWidth: '800',
				  collapserTitle: '',
				  animSpeed: 'medium',
				  easingEffect: null,
				  indentChildren: false,
				  childrenIndenter: '&nbsp;'
				  });
</script>

<?php } else if ($detect->isMobile() && !$detect->isTablet() && $_SESSION['display_mode']=='isDesktop' or $detect->isTablet() && $_SESSION['display_mode']=='isDesktop' or $_SESSION['display_mode']=='isNonResponsive'){ ?>

<script type="text/javascript">
    $('ul.slimmenu').slimmenu(
			      {
			      resizeWidth: '0',
				  collapserTitle: '',
				  animSpeed: 'medium',
				  easingEffect: null,
				  indentChildren: false,
				  childrenIndenter: '&nbsp;'
				  });
</script>

<?php } else { ?>

<script type="text/javascript">
    $('ul.slimmenu').slimmenu(
			      {
			      resizeWidth: '800',
				  collapserTitle: '',
				  animSpeed: 'medium',
				  easingEffect: null,
				  indentChildren: false,
				  childrenIndenter: '&nbsp;'
				  });
</script>

  <?php } ?>

