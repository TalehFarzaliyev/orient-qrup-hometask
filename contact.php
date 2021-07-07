<!DOCTYPE html>
<html lang="en">

<?php include 'includes/header.php'; ?>

<body>
    <div id="go-up" class="header">

        <?php include 'includes/menu.php'; ?>

        <div class="menu-name"></div>
    </div>

    <?php include 'includes/theme.php';
    include 'config/config.php';
    $result = mysqli_query($conn, "SELECT * FROM orient_ressamlar.settings s
                                   INNER JOIN orient_ressamlar.settings_translation st ON st.settings_id=s.id
                                   WHERE s.`id`=1 && st.lang_id=$lang_id");
    $setting  = mysqli_fetch_array($result, MYSQLI_ASSOC);
    if (!empty($setting)) {
    ?>

    <div class="blog contact change-theme">
        <div class="section-header">
            <h2><?php if ($lang_id == 1) {echo 'ƏLAQƏ';} else echo 'CONTACT'; ?></h2>
            <div class="title-line">
                <img class="line" src="assets/img/title-line.png" alt="">
            </div>
        </div>
        <div class="row contact-section">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 map-section"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3092.284373037151!2d45.40836291472001!3d39.19098663719114!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40142e11821ed39b%3A0x5289940cb49c2ed6!2s38%20Heydar%20Aliyev%20street%2C%20Nakhchivan%2C%20Azerbaijan!5e0!3m2!1sen!2s!4v1618574974023!5m2!1sen!2s" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe></div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 contact-us">
                <h3 class="contact-header"><?php if ($lang_id == 1) {echo 'Əlaqə məlumatları';} else echo 'Contact information'; ?></h3>
                <div class="adress contact-item"><i class="fas fa-map-marker-alt contact-icon"></i><span><?php if ($lang_id == 1) {echo 'Ünvan: ';} else echo 'Address: '; ?><?=$setting['address'];?></span></div>
                <div class="phone contact-item"><i class="fas fa-mobile-alt contact-icon"></i><span><?php if ($lang_id == 1) {echo 'Telefon: ';} else echo 'Phone: '; ?></span>
                    <a href="tel:+<?=$setting['phone'];?>" class="contact-link"><?=$setting['phone'];?></a>
                </div>
                <div class="email contact-item"><i class="far fa-envelope contact-icon"></i><span><?php if ($lang_id == 1) {echo 'E-poçt: ';} else echo 'Mail: '; ?></span>
                    <a href="mailto:" class="contact-link"><?=$setting['gmail'];?></a>
                </div>
                <div class="social contact-item">
                    <a href="<?=$setting['facebook'];?>"><i class="fab fa-facebook-square"></i></a>
                    <a href="<?=$setting['gmail'];?>"><i class="fas fa-envelope-square"></i></a>
                    <a href="<?=$setting['instagram'];?>"><i class="fab fa-instagram-square"></i></a>
                    <a href="<?=$setting['youtube'];?>"><i class="fab fa-youtube-square"></i></a>
                </div>
            </div>
        </div>
        <?php } ?>
        <div class="form-section container">
            <h3 class="form-header"><?php if ($lang_id == 1) {echo 'Məktub göndər';} else echo 'Send message'; ?></h3>
            <form>
                <div class="form-log row">
                    <input class="form-input col-xl-6 col-lg-6 col-md-6 col-sm-12" type="name" name="name" placeholder="<?php if ($lang_id == 1) {echo 'Ad';} else echo 'Name'; ?>">
                    <input class="form-input col-xl-6 col-lg-6 col-md-6 col-sm-12" type="email" name="email" placeholder="<?php if ($lang_id == 1) {echo 'E-poçt';} else echo 'Mail'; ?>">
                </div>
                <input class="form-input form-item" type="text" name="movzu" placeholder="<?php if ($lang_id == 1) {echo 'Mövzu';} else echo 'Content'; ?>">
                <textarea class="form-input form-item" name="textarea" cols="30" rows="10" placeholder="<?php if ($lang_id == 1) {echo 'Məktub';} else echo 'Letter'; ?>"></textarea>
                <button class="dark-text" type="submit" name="submit" value="submit"><?php if ($lang_id == 1) {echo 'Göndər';} else echo 'Send'; ?></button>
            </form>
        </div>
    </div>

    <?php include 'includes/footer.php'; ?>


</body>

</html>