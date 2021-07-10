<!DOCTYPE html>
<html lang="en">

<?php include 'includes/header.php'; ?> <body>
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
    $page     = trim($_GET['page']);
    if (!empty($setting)) {
    ?>

    <div class="blog contact change-theme">
        <div class="section-header">
            <h2>
            <?php
            if($page == 'privacy_policy') {
                if ($lang_id == 1) {echo 'GİZLİLİK SİYASƏTİ';} else echo 'PRIVACY POLICY';
            }else if ($page =='terms_of_use') {
                if ($lang_id == 1) {echo 'İSTİFADƏ ŞƏRTLƏRİ';} else echo 'TERMS OF USE';
            }else{
                if ($lang_id == 1) {echo 'Tez-tez verilən suallar';} else echo 'FAQ';
            } 
            ?>
            </h2>
            <div class="title-line">
                <img class="line" src="assets/img/title-line.png" alt="">
            </div>
        </div>
        <div class="container privacy-text"><?=$setting[$page];?></div>
    </div>

    <?php } include 'includes/footer.php'; ?>

    </body>

</html>