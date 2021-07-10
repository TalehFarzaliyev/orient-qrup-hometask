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
    if (isset($_GET['post']) and !empty($_GET['post'])) {
        $post           = intval($_GET['post']);
        $select_post    = "SELECT p.id as id_post, p.image, p.status, pt.* FROM orient_ressamlar.posts p 
                           INNER JOIN orient_ressamlar.posts_translation pt ON pt.post_id=p.id
                           Where pt.lang_id=$lang_id and p.status=1 and p.`id`='$post'";
        $result         = mysqli_query($conn, $select_post);
        $post_row       = mysqli_fetch_array($result, MYSQLI_ASSOC);
    }
    ?>

    <div class="portfolio change-theme">
        <h2 class="head-text change-theme portfolio-header profile-header"><?= $post_row['title']; ?></h2>
        <div class="icon title-line">
            <img src="assets/img/title-line.png">
        </div>
        <div class="portfolio-pictures">
            <div id="first-category" class="port-picture container img-section">
                <div class="single-img">
                    <img src="uploads/<?= $post_row['image']; ?>">
                </div>
                <p><?= $post_row['content']; ?></p>
            </div>
        </div>

        <?php
        $sql = "SELECT * FROM posts_gallery WHERE post_id='" . $post . "' ORDER BY `id` desc";
        $gallery = mysqli_fetch_all(mysqli_query($conn, $sql), MYSQLI_ASSOC);
        if (!empty($gallery)) {
        ?>

        <h6 class="head-text change-theme profile-header portfolio-header work_head"><?php if ($lang_id == 1) {
                                                                                            echo 'Qalereya';
                                                                                        } else echo 'Gallery'; ?></h6>
        <div class="icon title-line">
            <img src="assets/img/title-line.png">
        </div>
        <div class="portfolio-pictures row gallery">
            <?php
            foreach ($gallery as $key => $value) {
            ?>
                <div id="first-category" class="col-xl-3 col-lg-4 col-md-6 col-sm-12 port-picture">
                    <a href="uploads/<?= $value['gallery_image'] ?>" rel="prettyPhoto[gallery2]" id="search-button" class="circle">
                        <div style="border-width: 8px;" class="port-img tiny-img">
                            <figure style="border-width: 4px;"> 
                                <li>
                                    <img src="uploads/<?= $value['gallery_image'] ?>" width="60" height="60" />
                                </li>
                            </figure>
                        </div>
                    </a>
                </div>
            <?php } ?>
        </div>
        <?php } ?>
    </div>

    <?php include 'includes/footer.php'; ?>

</body>

</html>