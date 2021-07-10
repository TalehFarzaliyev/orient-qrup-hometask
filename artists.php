<?php include 'config/config.php'; ?>
<!DOCTYPE html>
<html lang="en">

<?php include 'includes/header.php'; ?>

<body>
    <div id="go-up" class="header">

        <?php include 'includes/menu.php'; ?>

        <div class="menu-name"></div>
    </div>

    <?php include 'includes/theme.php';
    if (isset($_GET['painter']) and !empty($_GET['painter'])) {
        $painter        = intval($_GET['painter']);
        $select_painter = "SELECT p.id as id_painter, p.painter_name, p.painter_surname, p.painter_image, p.status, pt.* FROM orient_ressamlar.painters p 
                           INNER JOIN orient_ressamlar.painter_translation pt ON pt.painter_id=p.id
                           WHERE pt.lang_id=$lang_id && p.`id`='$painter'";
        $result         = mysqli_query($conn, $select_painter);
        $painter_row    = mysqli_fetch_array($result, MYSQLI_ASSOC);
    }
    ?>

    <div class="portfolio change-theme">
        <h2 class="head-text change-theme profile-header portfolio-header"><?= $painter_row['painter_name']; ?> <?= $painter_row['painter_surname']; ?></h2>
        <div class="icon title-line">
            <img src="assets/img/title-line.png">
        </div>
        <div class="row container">
            <div class="artist-img col-lg-4 col-md-4 col-sm-12">
                <img class="d-block img-thumbnail" src="uploads/<?= $painter_row['painter_image']; ?>">
            </div>
            <div class="about_painter col-lg-8 col-md-8 col-sm-12"><?= $painter_row['about_painter']; ?></div>
        </div>

        <?php
        $sql = "SELECT * FROM works w INNER JOIN works_translation wt ON wt.work_id=w.id 
                WHERE painter_id='" . $painter . "' && wt.lang_id=$lang_id && w.status=1 ORDER BY `id` desc";
        $work = mysqli_fetch_all(mysqli_query($conn, $sql), MYSQLI_ASSOC);
        ?>

        <h6 class="head-text change-theme profile-header portfolio-header work_head"><?php if ($lang_id == 1) {
                                                                                            echo 'Rəssamın əsərlərİ';
                                                                                        } else echo 'works of the painter'; ?></h6>
        <div class="icon title-line">
            <img src="assets/img/title-line.png">
        </div>
        <div class="portfolio-pictures row gallery">
            <?php
            foreach ($work as $key => $value) {
            ?>
                <div id="first-category" class="col-xl-3 col-lg-4 col-md-6 col-sm-12 port-picture">
                    <div class="port-img tiny-img" style="border-width: 8px;">
                        <figure style="border-width: 4px;">
                            <li>
                                <img src="uploads/<?= $value['work_image'] ?>" width="60" height="60" alt="This is a pretty long title" />
                            </li>
                            <div class="linkhover">
                                <div class="hovericon tiny-icon">
                                    <a href="uploads/<?= $value['work_image'] ?>" rel="prettyPhoto[gallery2]" id="search-button" class="circle"><i class="fas fa-search icons"></i></a>
                                </div>
                                <div class="hovertext">
                                    <span class="hovertext-mainitem"><?= $value['work_name'] ?></span>
                                </div>
                            </div>
                        </figure>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>

    <?php include 'includes/footer.php'; ?>

</body>

</html>