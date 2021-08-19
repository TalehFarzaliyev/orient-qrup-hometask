<?php include $_SERVER['DOCUMENT_ROOT'] . '/config/config.php'; ?>
<!DOCTYPE html>
<html lang="en">

<?php include 'includes/header.php'; ?>

<body>
    <div id="go-up" class="header">

        <?php include 'includes/menu.php'; ?>

        <div class="menu-name"></div>
    </div>

    <?php include 'includes/theme.php';
    $result = mysqli_query($conn, "SELECT * FROM settings s
                                   INNER JOIN settings_translation st ON st.settings_id=s.id
                                   WHERE s.`id`=1 && st.lang_id=$lang_id");
    $setting  = mysqli_fetch_array($result, MYSQLI_ASSOC);
    if (!empty($setting)) {
    ?>

        <div class="blog contact change-theme">
            <div class="section-header">
                <h2><?= translate('contact', $lang_name); ?></h2>
                <div class="title-line">
                    <img class="line" src="assets/img/title-line.png" alt="">
                </div>
            </div>
            <div class="row contact-section">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 map-section"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3092.284373037151!2d45.40836291472001!3d39.19098663719114!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40142e11821ed39b%3A0x5289940cb49c2ed6!2s38%20Heydar%20Aliyev%20street%2C%20Nakhchivan%2C%20Azerbaijan!5e0!3m2!1sen!2s!4v1618574974023!5m2!1sen!2s" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe></div>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 contact-us">
                    <h3 class="contact-header"><?= translate('contact-info', $lang_name); ?></h3>
                    <div class="adress contact-item"><i class="fas fa-map-marker-alt contact-icon"></i><span><?= translate('address', $lang_name); ?><?= $setting['address']; ?></span></div>
                    <div class="phone contact-item"><i class="fas fa-mobile-alt contact-icon"></i><span><?= translate('phone', $lang_name); ?></span>
                        <a href="tel:+994<?= $setting['phone']; ?>" class="contact-link">+994 <?= $setting['phone']; ?></a>
                    </div>
                    <div class="email contact-item"><i class="far fa-envelope contact-icon"></i><span><?= translate('mail', $lang_name); ?>: </span>
                        <a href="mailto:<?= $setting['gmail']; ?>" class="contact-link"><?= $setting['gmail']; ?></a>
                    </div>
                    <div class="social contact-item">
                        <a href="<?= $setting['facebook']; ?>"><i class="fab fa-facebook-square"></i></a>
                        <a href="mailto:<?= $setting['gmail']; ?>"><i class="fas fa-envelope-square"></i></a>
                        <a href="<?= $setting['instagram']; ?>"><i class="fab fa-instagram-square"></i></a>
                        <a href="<?= $setting['youtube']; ?>"><i class="fab fa-youtube-square"></i></a>
                    </div>
                </div>
            </div>
        <?php } ?>
        <div class="form-section container">
            <h3 class="form-header"><?= translate('send-message', $lang_name); ?></h3>
            <form action="/phpmailer/form.php" method="post">
                <div class="form-log row">
                    <input class="form-input col-xl-6 col-lg-6 col-md-6 col-sm-12" type="name" required name="name" placeholder="<?= translate('name', $lang_name); ?>">
                    <input class="form-input col-xl-6 col-lg-6 col-md-6 col-sm-12" type="email" required name="email" placeholder="<?= translate('mail', $lang_name); ?>">
                </div>
                <input class="form-input form-item" type="text" name="subject" required placeholder="<?= translate('subject', $lang_name); ?>">
                <textarea class="form-input form-item" name="content" cols="30" rows="10" required placeholder="<?= translate('content', $lang_name); ?>"></textarea>
                <?php
                if (isset($_GET['lang'])) {
                ?>
                    <input type="hidden" name="lang" value="<?= $_GET['lang'] ?>">
                <?php
                }
                ?>
                <button class="dark-text" type="submit" name="submit" value="submit"><?= translate('send', $lang_name); ?></button>

            </form>
        </div>
        </div>

        <?php include 'includes/footer.php';
        if (isset($_GET['error'])) {
            $error = ucfirst($_GET['error']);
        ?>
            <script>
                setTimeout(function() {
                    alert('<?= $error ?> <?= translate('alert', $lang_name); ?>');
                }, 1000);
            </script>
        <?php
        } else if (isset($_GET['success'])) {
        ?>
            <script>
                setTimeout(function() {
                    alert('<?= translate('success', $lang_name); ?>');
                }, 1000);
            </script>
        <?php
        }
        ?>

</body>

</html>