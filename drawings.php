<?php include $_SERVER['DOCUMENT_ROOT'].'/config/config.php'; ?>
<!DOCTYPE html>
<html lang="en">

<?php include 'includes/header.php' ?>

<body>
    <div id="go-up" class="header">

        <?php include 'includes/menu.php'; ?>
        <div class="menu-name"></div>
    </div>

    <?php
    include 'includes/theme.php';
    $result    = mysqli_query($conn, "SELECT p.id as id_post, p.image, p.created_date, p.category_id, pt.*, mt.* FROM orient_ressamlar.posts p 
                                  INNER JOIN orient_ressamlar.posts_translation pt ON pt.post_id=p.id
                                  INNER JOIN orient_ressamlar.menu_translation mt ON mt.menu_id=p.category_id
                                  WHERE pt.lang_id=$lang_id && p.status=1 && p.category_id=74 && mt.lang_id=$lang_id ORDER BY p.`id` desc");
    $materials = mysqli_fetch_all($result, MYSQLI_ASSOC);
    if (!empty($materials)) {
    ?>
        <div class="blog change-theme">
            <div class="section-header">
                <h2><?=$materials[0]['name'];?></h2>
                <div class="title-line">
                    <img class="line" src="assets/img/title-line.png" alt="">
                </div>
            </div>
            <div class="blog-slider">
                <?php
                foreach ($materials as $key => $material_row) {
                    $sql     = "SELECT * FROM posts_gallery WHERE post_id='" . $material_row['id_post'] . "' ORDER BY `id` desc";
                    $gallery = mysqli_fetch_all(mysqli_query($conn, $sql), MYSQLI_ASSOC);
                ?>
                    <div class="vc_item row">
                        <div id="carouselExampleControls-<?= $key; ?>" class="carousel slide col-xl-6 col-lg-6 col-md-12 <?php if ($key % 2 != 0) {
                                                                                                                                echo 'order_class_right';
                                                                                                                            } ?>" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <span class="carousel-line"></span>
                                <?php
                                foreach ($gallery as $keyg => $valueg) {
                                ?>
                                    <div class="carousel-item <?php if ($keyg == 0) {
                                                                    echo 'active';
                                                                } ?>">
                                        <img src="uploads/<?= $valueg['gallery_image']; ?>" class="d-block w-100" alt="...">
                                    </div>
                                <?php } ?>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls-<?= $key; ?>" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls-<?= $key; ?>" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-12 acrylic wow bounceIn <?php if ($key % 2 != 0) {
                                                                                            echo 'order_class_left';
                                                                                        } ?>">
                            <h3><?= $material_row['title']; ?></h3>
                            <p><?= substr($material_row['content'], 0, 200); ?></p>
                            <a href="post.php?post=<?= $material_row['id_post']; ?>&lang=<?= $lang_name; ?>" class="more_button"><?=translate('read-more', $lang_name); ?></a>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    <?php }
    include 'includes/footer.php'; ?>
</body>

</html>