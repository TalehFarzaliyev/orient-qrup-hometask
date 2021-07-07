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
    $page = isset($_GET['page']) ? $_GET['page'] : 1;
    $number_of_content = mysqli_num_rows(mysqli_query($conn, "SELECT `id` FROM `posts` p INNER JOIN menu_translation mt ON mt.menu_id=p.category_id WHERE mt.name='elanlar'"));
    $limit = 8;
    $lastpage = ceil($number_of_content / $limit);
    $start = ($page - 1) * $limit;
    if ($lastpage >= $page) {
        $result = mysqli_query($conn, "SELECT p.id as id_post, p.image, p.created_date, p.category_id, pt.*, mt.*, m.* FROM orient_ressamlar.posts p 
                                   INNER JOIN orient_ressamlar.posts_translation pt ON pt.post_id=p.id
                                   INNER JOIN orient_ressamlar.menu_translation mt 
                                   INNER JOIN orient_ressamlar.menu m ON mt.menu_id=m.id
                                   WHERE pt.lang_id=$lang_id && p.status=1 && p.category_id=m.id && mt.name='elanlar' ORDER BY p.`id` desc LIMIT " . $start . ',' . $limit);
        $post  = mysqli_fetch_all($result, MYSQLI_ASSOC);
        if (!empty($post)) {
    ?>

    <div class="portfolio change-theme">
        <h2 class="head-text change-theme profile-header portfolio-header"><?php if ($lang_id == 1) {echo 'Elanlar';} else echo 'Announcements'; ?></h2>
        <div class="icon title-line">
            <img src="assets/img/title-line.png">
        </div>
        <div class="portfolio-pictures gallery structur">
        <?php
                    foreach ($post as $value) {
                    ?>
            <div id="first-category" class="port-picture">
                <h3 class="header-of-img"><?=$value['title'];?></h3>
                <div class="port-img">
                    <figure>
                        <li>
                            <img src="uploads/<?=$value['image'];?>" width="60" height="60" alt="This is a pretty long title" />
                        </li>
                        <div class="linkhover">
                            <div class="hovericon">
                                <a href="singleimg.php?post=<?= $value['id_post']; ?>&lang=<?=$lang_name;?>" class="circle"><i class="fas fa-link icons"></i></a>
                                <a href="uploads/<?=$value['image'];?>" rel="prettyPhoto[gallery2]" id="search-button" class="circle"><i class="fas fa-search icons"></i></a>
                            </div>
                            <div class="hovertext">
                                <span class="hovertext-mainitem"><?= substr($value['content'], 0, 70); ?></span>
                            </div>
                        </div>
                    </figure>
                </div>
            </div>
            <?php } ?>
        </div>
    </div><div class="text-center">
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