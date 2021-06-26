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
        $select_news    = "SELECT p.id as id_post, p.image, p.created_date, p.category_id, pt.* FROM orient_ressamlar.posts p 
                           INNER JOIN orient_ressamlar.posts_translation pt ON pt.post_id=p.id
                           WHERE pt.lang_id=1 &&  p.`id`='$post'";
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
    </div>

    <?php include 'includes/footer.php'; ?>

</body>

</html>