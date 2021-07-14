<?php include $_SERVER['DOCUMENT_ROOT'].'/config/config.php'; ?>
<!DOCTYPE html>
<html lang="en">

<?php include 'includes/header.php'; ?>

<body>
    <div id="go-up" class="header">

        <?php include 'includes/menu.php'; ?>

        <div class="menu-name"></div>
    </div>

    <?php include 'includes/theme.php';
    $page = isset($_GET['page']) ? $_GET['page'] : 1;
    $number_of_content = mysqli_num_rows(mysqli_query($conn, 'SELECT `id` FROM `sales`'));
    $limit = 4;
    $lastpage = ceil($number_of_content / $limit);
    $start = ($page - 1) * $limit;
    if ($lastpage >= $page) {
        $result = mysqli_query($conn, "SELECT s.id as id_sales, s.painter_id, s.image, s.price, s.status, st.*, p.* FROM orient_ressamlar.sales s 
                                       INNER JOIN orient_ressamlar.sales_translation st ON st.sales_id=s.id
                                       INNER JOIN orient_ressamlar.painters p ON p.id=s.painter_id
                                       Where st.lang_id=$lang_id and s.status=1 ORDER BY s.`id` desc LIMIT " . $start . ',' . $limit);
        $row  = mysqli_fetch_all($result, MYSQLI_ASSOC);
        if (!empty($row)) {
    ?>
            <div class="portfolio change-theme">
                <h2 class="head-text change-theme profile-header portfolio-header"><?=translate('shop', $lang_name); ?></h2>
                <div class="icon title-line">
                    <img src="assets/img/title-line.png">
                </div>
                <div class="portfolio-pictures gallery structur">
                    <?php
                    foreach ($row as $sales) {
                    ?>
                        <div id="first-category" class="port-picture">
                            <h3 class="header-of-img"><?= $sales['name']; ?></h3>
                            <div class="port-img">
                                <figure>
                                    <li>
                                        <img src="uploads/<?= $sales['image']; ?>" width="60" height="60" alt="This is a pretty long title" />
                                    </li>
                                    <div class="linkhover">
                                        <div class="hovericon">
                                            <a href="product.php?sales=<?= $sales['id_sales']; ?>&lang=<?=$lang_name;?>" class="circle"><i class="fas fa-link icons"></i></a>
                                            <a href="uploads/<?= $sales['image']; ?>" rel="prettyPhoto[gallery2]" id="search-button" class="circle"><i class="fas fa-search icons"></i></a>
                                        </div>
                                        <div class="hovertext">
                                            <span class="hovertext-mainitem"><?= $sales['painter_name']; ?> <?= $sales['painter_surname']; ?></span>
                                        </div>
                                    </div>
                                </figure>
                            </div>
                        </div>
                        <div class="icon">
                            <img src="assets/img/title-line.png">
                        </div>
                <?php
                    }
                }
                ?>
                </div>
            </div>
            <div class="text-center">
            <?php
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