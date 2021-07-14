<!DOCTYPE html>
<html lang="en">

<?php include 'includes/header.php'; ?>

<body>
    <div id="go-up" class="header">

        <?php include 'includes/menu.php'; ?>

        <div class="menu-name"></div>
    </div>

    <?php include 'includes/theme.php';
    include $_SERVER['DOCUMENT_ROOT'].'/config/config.php';
    if (isset($_GET['post']) and !empty($_GET['post'])) {
        $post           = intval($_GET['post']);
        $select_news    = "SELECT p.id as id_post, p.image, p.created_date, p.category_id, pt.* FROM orient_ressamlar.posts p 
                           INNER JOIN orient_ressamlar.posts_translation pt ON pt.post_id=p.id
                           WHERE pt.lang_id=$lang_id &&  p.`id`='$post'";
        $result         = mysqli_query($conn, $select_news);
        $news_row       = mysqli_fetch_array($result, MYSQLI_ASSOC);
    }
    ?>

    <div class="portfolio change-theme">
        <div class="portfolio-pictures">
            <div id="first-category" class="port-picture container img-section">
                <div class="single-img news-img">
                    <img class="img-thumbnail" src="uploads/<?= $news_row['image']; ?>">
                </div>
                <h4 class="news-head"><?= $news_row['title']; ?></h4>
                <p><?= $news_row['content']; ?></p>
                <span><i class="far fa-clock"></i>&nbsp;&nbsp;<?= date('d.m.Y H:i', strtotime($news_row['created_date'])); ?></span>
            </div>
        </div>

        <?php
        $sql = "SELECT * FROM posts_gallery WHERE post_id='" . $post . "' ORDER BY `id` desc";
        $gallery = mysqli_fetch_all(mysqli_query($conn, $sql), MYSQLI_ASSOC);
        if (!empty($gallery)) {
        ?>

            <h6 class="head-text change-theme profile-header portfolio-header work_head"><?=translate('gallery', $lang_name); ?></h6>
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