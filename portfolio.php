<!DOCTYPE html>
<html lang="en">

<?php 
    include 'includes/header.php'; 
    include $_SERVER['DOCUMENT_ROOT'].'/config/config.php';
?>

<body>
    <div id="go-up" class="header">

    <?php include 'includes/menu.php'; ?>

        <div class="menu-name"></div>
    </div>

    <?php include 'includes/theme.php'; 
        $page = isset($_GET['page']) ? $_GET['page'] : 1;
        $number_of_content = mysqli_num_rows(mysqli_query($conn, "SELECT `category_id` FROM `posts` WHERE category_id=75"));
        $limit = 8;
        $lastpage = ceil($number_of_content / $limit);
        $start = ($page - 1) * $limit;
        if ($lastpage >= $page) {
            $result = mysqli_query($conn, "SELECT p.id as id_post, p.image, p.created_date, p.category_id, pt.*, mt.* FROM orient_ressamlar.posts p 
                                           INNER JOIN orient_ressamlar.posts_translation pt ON pt.post_id=p.id
                                           INNER JOIN orient_ressamlar.menu_translation mt ON mt.menu_id=p.category_id
                                           WHERE pt.lang_id=$lang_id && p.status=1 && p.category_id=75 && mt.lang_id=$lang_id ORDER BY p.`id` desc LIMIT " . $start . ',' . $limit);
            $post  = mysqli_fetch_all($result, MYSQLI_ASSOC);
            if (!empty($post)) {
    ?>

    <div class="portfolio change-theme">
        <h2 class="head-text change-theme profile-header portfolio-header"><?=translate('association', $lang_name); ?></h2>
        <div class="icon title-line">
            <img src="assets/img/title-line.png">
        </div>
        <div class="portfolio-pictures row gallery" style="background-image: url(assets/img/wood4.jpg);">
        <?php
                    foreach ($post as $value) {
                    ?>
            <div id="first-category" class="col-xl-3 col-lg-4 col-md-6 col-sm-12 port-picture">
                <div class="port-img tiny-img">
                    <figure>
                        <li>
                            <img src="uploads/<?=$value['image'];?>" width="60" height="60" alt="This is a pretty long title" />
                        </li>
                        <div class="linkhover">
                            <div class="hovericon tiny-icon">
                                <a href="single-post.php?post=<?= $value['id_post']; ?>&lang=<?=$lang_name;?>" class="circle"><i class="fas fa-link icons"></i></a>
                                <a href="uploads/<?=$value['image'];?>" rel="prettyPhoto[gallery2]" id="search-button" class="circle"><i class="fas fa-search icons"></i></a>
                            </div>
                            <div class="hovertext">
                                <span class="hovertext-mainitem"><?=$value['title'];?></span>
                            </div>
                        </div>
                    </figure>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
    <br>
    <div class="text-center">
        <?php }
        if ($number_of_content > $limit) {
            $x = 2;
            if ($page > 1) {
                $previous = $page - 1;
                echo '<a href="?page=' . $previous . '&lang=' . $lang_name . '">« </a>';
            }
            if ($page == 1) {
                echo '<a>[1]</a>';
            } else {
                echo '<a href="?page=1&lang=' . $lang_name . '" style= "margin-left: 10px;">1</a>';
            }
            if ($page - $x > 2) {
                echo '...';
                $i = $page - $x;
            } else {
                $i = 2;
            }
            for ($i; $i <= $page + $x; $i++) {
                if ($i == $page) {
                    echo '&nbsp;<a style= "margin-left: 10px;">[' . $i . ']</a>&nbsp;';
                } else {
                    echo '<a href="?page=' . $i . '&lang=' . $lang_name . '" style= "margin-left: 10px;">' . $i . '</a>';
                }
                if ($i == $lastpage) break;
            }
            if ($page + $x < $lastpage - 1) {
                echo '...';
                echo '<a href="?page=' . $lastpage . '&lang=' . $lang_name . '" style= "margin-left: 10px;">' . $lastpage . '</a>';
            } elseif ($page + $x == $lastpage - 1) {
                echo '<a href="?page=' . $lastpage . '&lang=' . $lang_name . '" style= "margin-left: 10px;">' . $lastpage . '</a>';
            }
            if ($page < $lastpage) {
                $next = $page + 1;
                echo '<a href="?page=' . $next . '&lang=' . $lang_name . '" style= "margin-left: 10px;"> » </a>';
            }
        }
    }
    include 'includes/footer.php'; ?>
            </div>
    
</body>

</html>