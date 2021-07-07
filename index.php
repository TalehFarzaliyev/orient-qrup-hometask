<?php include 'config/config.php' ?>
<!DOCTYPE html>
<html lang="en">

<?php include 'includes/header.php' ?>

<body>
    <div id="go-up" class="header">
        <?php include 'includes/menu.php'; ?>
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <?php
                $result = mysqli_query($conn, "SELECT * FROM orient_ressamlar.slider s
                                               INNER JOIN orient_ressamlar.slider_translation st ON st.slider_id=s.id
                                               WHERE s.`painter_id`=0 && s.status=1 && st.lang_id=$lang_id");
                $main   = mysqli_fetch_array($result, MYSQLI_ASSOC);
                if (!empty($main)) {
                ?>
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="uploads/<?= $main['image']; ?>" alt="First slide">
                        <div class="carousel-caption d-md-block homepage-caption">
                            <p class="homepage-text"><?= $main['title']; ?></p>
                        </div>
                    </div>
                    <?php }
                $result = mysqli_query($conn, "SELECT s.id as id_slider, s.painter_id, s.image, s.status, st.*, p.* FROM orient_ressamlar.slider s 
                                               INNER JOIN orient_ressamlar.slider_translation st ON st.slider_id=s.id
                                               INNER JOIN orient_ressamlar.painters p ON p.id=s.painter_id
                                               Where st.lang_id=$lang_id and s.status=1 ORDER BY s.`id` desc");
                $artist = mysqli_fetch_all($result, MYSQLI_ASSOC);
                if (!empty($artist)) {
                    foreach ($artist as $key => $artist_row) {
                        $sql = "SELECT * FROM works WHERE painter_id='" . $artist_row['painter_id'] . "' ORDER BY `id` desc LIMIT 6";
                        $work = mysqli_fetch_all(mysqli_query($conn, $sql), MYSQLI_ASSOC);
                    ?>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="uploads/<?= $artist_row['image']; ?>" alt="Second slide">
                            <div class="carousel-caption d-md-block slider-caption">
                                <a href="artists.php?painter=<?= $artist_row['id']; ?>&lang=<?= $lang_name; ?>" class="painter_name"><?= $artist_row['painter_name']; ?> <?= $artist_row['painter_surname']; ?></a>
                                <p class="caption-head"><?= $artist_row['title']; ?></p>
                                <div class="row">
                                    <?php
                                    foreach ($work as $keyw => $valuew) {
                                    ?>
                                        <div class="col-4">
                                            <div class="col-pictures">
                                                <img src="uploads/<?= $valuew['work_image'] ?>" alt="">
                                            </div>
                                        </div>
                                    <?php
                                    }
                                    ?>
                                </div>
                            </div>
                        </div>
                <?php }
                } ?>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>

            <?php
            $result = mysqli_query($conn, "SELECT * FROM orient_ressamlar.settings WHERE `id`=1");
            $social  = mysqli_fetch_array($result, MYSQLI_ASSOC);
            if (!empty($social)) {
            ?>
                <div class="social-icon">
                    <a class="gmail" href="<?= $social['gmail']; ?>"><i class="fas fa-envelope social-media"></i></a>
                    <a class="instagram" href="<?= $social['instagram']; ?>"><i class="fab fa-instagram social-media"></i></a>
                    <a class="facebook" href="<?= $social['facebook']; ?>"><i class="fab fa-facebook-f social-media"></i></a>
                    <a class="youtube" href="<?= $social['youtube']; ?>"><i class="fab fa-youtube social-media"></i></a>
                </div>
        </div>
    </div>

<?php }
            include 'includes/theme.php'; ?>

<div class="portfolio change-theme portfolio-button">
    <a href="portfolio.php?lang=<?= $lang_name; ?>" class="view_button wow swing"><?php if ($lang_id == 1) {
                                                                                    echo 'BİRLİYİN PROFİLİ';
                                                                                } else echo 'ASSOCIATION PROFILE'; ?></a>
</div>

<?php
$result = mysqli_query($conn, "SELECT p.id as id_post, p.image, p.created_date, p.category_id, pt.*, mt.*, m.* FROM orient_ressamlar.posts p 
                               INNER JOIN orient_ressamlar.posts_translation pt ON pt.post_id=p.id
                               INNER JOIN orient_ressamlar.menu_translation mt 
                               INNER JOIN orient_ressamlar.menu m ON mt.menu_id=m.id 
                               WHERE pt.lang_id=$lang_id && p.status=1 && p.category_id=m.id && mt.name='sərgilər' ORDER BY p.`id` desc LIMIT 8");
$news  = mysqli_fetch_all($result, MYSQLI_ASSOC);
if (!empty($news)) {
?>
    <div class="blog change-theme news-section">
        <div class="section-header">
            <h2><?php if ($lang_id == 1) {
                    echo 'Xəbərlər';
                } else echo 'News'; ?></h2>
            <div class="title-line icon">
                <img class="line" src="assets/img/title-line.png" alt="">
            </div>
        </div>
        <div class="owl-carousel owl-theme container">
            <?php
            foreach ($news as $post) {
            ?>
                <div class="card wow bounceIn">
                    <img class="card-img-top" src="uploads/<?= $post['image']; ?>" alt="Card image cap">
                    <div class="card-body">
                        <h6 class="card-title text-center"><?= $post['title']; ?></h6>
                        <p class="card-text"><?= substr($post['content'], 0, 100); ?></p>
                        <div class="date_button">
                            <span><i class="far fa-clock"></i>&nbsp;&nbsp;<?= date('d.m.Y H:i', strtotime($post['created_date'])); ?></span>
                            <a href="single_news.php?post=<?= $post['id_post']; ?>&lang=<?= $lang_name; ?>" class="btn btn-primary change_button_color"><?php if ($lang_id == 1) {
                                                                                                                                                            echo 'Ardını oxu';
                                                                                                                                                        } else echo 'Read more'; ?></a>
                        </div>
                    </div>
                </div>

            <?php
            }
            ?>
        </div>
    </div>
<?php
}

$result    = mysqli_query($conn, "SELECT p.id as id_post, p.image, p.created_date, p.category_id, pt.*, mt.*, m.* FROM orient_ressamlar.posts p 
                                  INNER JOIN orient_ressamlar.posts_translation pt ON pt.post_id=p.id
                                  INNER JOIN orient_ressamlar.menu_translation mt 
                                  INNER JOIN orient_ressamlar.menu m ON mt.menu_id=m.id 
                                  WHERE pt.lang_id=$lang_id && p.status=1 && p.category_id=m.id && mt.name='rəsm texnikaları' ORDER BY p.`id` desc LIMIT 4");
$materials = mysqli_fetch_all($result, MYSQLI_ASSOC);
if (!empty($materials)) {
?>
    <div class="blog change-theme">
        <div class="section-header">
            <h2><?php if ($lang_id == 1) {
                    echo 'Rəsm texnikaları';
                } else echo 'Drawing techniques'; ?></h2>
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
                        <a href="singleimg.php?post=<?= $material_row['id_post']; ?>&lang=<?= $lang_name; ?>" class="more_button"><?php if ($lang_id == 1) {
                                                                                                echo 'Ətraflı';
                                                                                            } else echo 'Read more'; ?></a>
                    </div>
                </div>
            <?php } ?>
        </div>
        <br>
        <div class="text-center">
            <a href="drawings.php?lang=<?= $lang_name; ?>" class="see-more"><?php if ($lang_id == 1) {
                                                            echo 'Daha çox gör';
                                                        } else echo 'See more'; ?></a>
        </div>
        <br>
    </div>
<?php }
include 'includes/footer.php'; ?>
</body>

</html>