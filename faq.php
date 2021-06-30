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
                                   WHERE s.`id`=1");
    $setting  = mysqli_fetch_array($result, MYSQLI_ASSOC);
    if (!empty($setting)) {
    ?>

    <div class="blog contact change-theme">
        <div class="section-header">
            <h2>FAQ</h2>
            <div class="title-line">
                <img class="line" src="assets/img/title-line.png" alt="">
            </div>
        </div>
        <div class="container privacy-text"><?=$setting['faq'];?></div>
    </div>

    <?php } include 'includes/footer.php'; ?>

    </body>

</html>