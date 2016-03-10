<?php
/**
 * Common Template - tpl_footer.php
 *
 * this file can be copied to /templates/your_template_dir/pagename<br />
 * example: to override the privacy page<br />
 * make a directory /templates/my_template/privacy<br />
 * copy /templates/templates_defaults/common/tpl_footer.php to /templates/my_template/privacy/tpl_footer.php<br />
 * to override the global settings and turn off the footer un-comment the following line:<br />
 * <br />
 * $flag_disable_footer = true;<br />
 *
 * @package templateSystem
 * @copyright Copyright 2003-2010 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_footer.php 15511 2010-02-18 07:19:44Z drbyte $
 * Added by rbarbour (ZCAdditions.com), Flexible Footer Menu 1.1 (3)
 * Modified by Anne (Picaflor-Azul.com) Winchester Respnsive v1.0
 */
require(DIR_WS_MODULES . zen_get_module_directory('footer.php'));
?>

<!--bof-navigation display -->
<div id="navSuppWrapper">
<?php
if (!isset($flag_disable_footer) || !$flag_disable_footer) {
?>
<div id="navSupp">
<?php if (EZPAGES_STATUS_FOOTER == '1' or (EZPAGES_STATUS_FOOTER == '2' and (strstr(EXCLUDE_ADMIN_IP_FOR_MAINTENANCE, $_SERVER['REMOTE_ADDR'])))) { ?>
<ul>
<li><?php echo '<a href="' . HTTPS_SERVER . DIR_WS_CATALOG . '">'; ?><?php echo HEADER_TITLE_CATALOG; ?></a></li>
<li><?php require($template->get_template_dir('tpl_ezpages_bar_footer.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_ezpages_bar_footer.php'); ?></li>
</ul>
<?php } ?>
</div>

<!--bof-flexible footer menu display -->
<div id="flex-navSupp">
<div class="onerow-fluid <?php echo $fluidisFixed; ?>">

<div id="new-footer">

  <div class="footercontent">

    <!-- right side footer content-->

    <div class="footerright">

      <div id="navcontainer">

        <style>
        .footersociallist { line-height: 3.5em; }

        .visible-xs { display: none; }
        @media (max-width: 767px) {
          .visible-xs { display: inline; }
        }
        </style>



        <ul class="footernavlist footersociallist">
          <!-- bof AddThis -->
          <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=" async="async"></script>

          <li><a class="hide-text icon-fb addthis_button_facebook" href="http://www.facebook.com/SolageCalistoga" target="_blank"><img src="images/social-icon_1fb.png"  height="25" border="0" alt="Facebook"/></a></li>

          <li><a class="hide-text icon-tw addthis_button_twitter" href="http://twitter.com/solagecalistoga" target="_blank"><img src="images/social-icon_2twitter.png"  height="25" border="0" alt="Twitter"/></a></li>

          <li><a class="hide-text icon-pi addthis_button_pinterest_share" href="http://pinterest.com/solagecalistoga/" target="_blank"><img src="images/social-icon_3pinterest.png"  height="25" border="0" alt="Pinterest"/></a></li>

          <li><a class="hide-text icon-ta" href="http://www.tripadvisor.com/Hotel_Review-g32143-d647781-Reviews-Solage_Calistoga-Calistoga_Napa_Valley_California.html" target="_blank"><img src="images/social-icon_4ta.png"  height="25" border="0" alt="Trip Advisor"/></a></li>

          <br class="visible-xs">

          <li><a class="hide-text icon-yt" href="https://www.youtube.com/channel/UC2wWKgwT0LjQOL6MDt9TbGA" target="_blank"><img src="images/social-icon_5yt.png"  height="25" border="0" alt="Youtube"/></a></li>

          <li><a class="hide-text icon-insta" href="http://instagram.com/solagecalistoga" target="_blank"><img src="images/social-icon_6instagram.png"  height="25" border="0" alt="Instagram"/></a></li>

          <li><a class="hide-text icon-gplus addthis_button_google" href="https://plus.google.com/u/0/+solagecalistoga/posts" target="_blank"><img src="images/social-icon_7g.png"  height="25" border="0" alt="Google+"/></a></li>

          <li><a class="icon-share addthis_button_compact" onclick="return false;" style="background:transparent;" href="#"><span class="st_sharethis_custom" st_processed="yes"><img src="images/social-icon_8share.png"  height="25" border="0" alt="Share"/></span></a></li>

        </ul>
        <!--eof AddThis-->





        <img style="padding: 0 5%; opacity: .75; margin:20px auto 30px; max-width: 90%; height: auto; display:block;" src="images/rewards-2015.png" alt="">




        <ul class="footernavlist">

          <li><a href="https://www.solagecalistoga.com/press_highlights">Press</a></li>

          <li class="fancy"><a href="https://www.solagecalistoga.com/frames.php" target="_blank">Sign Up</a></li>

          <li><a href="https://www.solagecalistoga.com/join_team_solage">Join Team Solage</a></li>

          <li><a href="http://www.solagehotelsandresorts.com/" target="_blank">Solage Hotels &amp; Resorts</a></li>

          <li><a href="https://www.solagecalistoga.com/privacy_p_d">Privacy</a></li>

          <li><a href="https://www.solagecalistoga.com/site_map">Site Map</a></li>

<script>
  function resetMobileCookie () {
    $.removeCookie('mredir');
    return true;
  }
</script>

        </ul>

      </div><!-- navcontainer -->    

    </div><!-- footerright -->

  </div><!-- footercontent -->

</div>
<br />


<!--bof sitemap, privacy, conditions -->
<!-- <div id="footer-bottom">
                       <?php if (DEFINE_SITE_MAP_STATUS <= 1) { ?>
                        <a href="<?php echo zen_href_link(FILENAME_SITE_MAP); ?>"><?php echo BOX_INFORMATION_SITE_MAP; ?></a>
                        <?php } ?>
                        <?php if (DEFINE_PRIVACY_STATUS <= 1)  { ?>
                        <a href="<?php echo zen_href_link(FILENAME_PRIVACY); ?>"><?php echo BOX_INFORMATION_PRIVACY; ?></a>
                        <?php } ?>
                        <?php if (DEFINE_CONDITIONS_STATUS <= 1) { ?>
                        <a href="<?php echo zen_href_link(FILENAME_CONDITIONS); ?>"><?php echo BOX_INFORMATION_CONDITIONS; ?></a>
                        <?php } ?>

</div> -->
<!--eof sitemap, privacy, conditions -->

<!--bof- site copyright display -->
<div id="siteinfoLegal" class="legalCopyright"><?php echo FOOTER_TEXT_BODY; ?></div>
<!--eof- site copyright display -->

</div>
</div>
<!--eof-flexible footer menu -->

</div>
<!--eof-navigation display -->



<!--bof-ip address display -->
<?php
if (SHOW_FOOTER_IP == '1') {
?>
<div id="siteinfoIP"><?php echo TEXT_YOUR_IP_ADDRESS . '  ' . $_SERVER['REMOTE_ADDR']; ?></div>
<?php
}
?>
<!--eof-ip address display -->

<!--bof-banner #5 display -->
<?php
  if (SHOW_BANNERS_GROUP_SET5 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET5)) {
    if ($banner->RecordCount() > 0) {
?>
<div id="bannerFive" class="banners"><?php echo zen_display_banner('static', $banner); ?></div>
<?php
    }
  }
?>
<!--eof-banner #5 display -->


<?php
} // flag_disable_footer
?>