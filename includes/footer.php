<?php include $_SERVER['DOCUMENT_ROOT'] . '/config/config.php'; ?>
<footer>
   <div class="footer-line" style="background-image: url(assets/img/title-line.png);"></div>
   <div class="footer-text mb-4">
      <div class="first-row">
         <a class="footer-item" href="contact.php?lang=<?= $lang_name; ?>"><?= translate('contact', $lang_name); ?></a>
         <a class="footer-item" href="privacy.php?page=privacy_policy&lang=<?= $lang_name; ?>"><?= translate('privacy', $lang_name); ?></a>
         <a class="footer-item" href="privacy.php?page=terms_of_use&lang=<?= $lang_name; ?>"><?= translate('terms', $lang_name); ?></a>
         <a class="footer-item" href="privacy.php?page=faq&lang=<?= $lang_name; ?>">faq</a>
      </div>
   </div>
   <div class="copyright-section text-center">
      <span class="copyright-item">Copyright © <?php echo date("Y"); ?>.</span>
      <a class="footer-item copyright-item" href="index.php?lang=<?= $lang_name; ?>"><?= translate('nrb', $lang_name); ?></a>
      <span class="copyright-item"><?= translate('all-rights', $lang_name); ?></span><br>
      <span class="copyright-item"><?= translate('programming', $lang_name); ?></span>
      <a class="footer-item copyright-item" href="http://nakhinternet.az/?>"><?= translate('iyttm', $lang_name); ?></a>
   </div>
</footer>
<script type="text/javascript" charset="utf-8">
   $(document).ready(function() {
      $("area[rel^='prettyPhoto']").prettyPhoto();
      $(".gallery:first a[rel^='prettyPhoto']").prettyPhoto({
         animation_speed: 'fast',
         slideshow: 10000,
         hideflash: true
      });
   });
</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/wow/0.1.12/wow.min.js"></script>
<script>
   new WOW().init();
</script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>