<!DOCTYPE html>
<html lang="en">

<?php include 'includes/header.php'; ?>

<body>
    <div id="go-up" class="header">

        <?php include 'includes/menu.php'; ?>

        <div class="menu-name"></div>
    </div>

    <?php include 'includes/theme.php';
    include $_SERVER['DOCUMENT_ROOT'] . '/config/config.php';
    if (isset($_GET['sales']) and !empty($_GET['sales'])) {
        $sales          = intval($_GET['sales']);
        $select_sales   = "SELECT s.id as id_sales, s.painter_id, s.image, s.price, s.status, st.*, p.* FROM orient_ressamlar.sales s 
                           INNER JOIN orient_ressamlar.sales_translation st ON st.sales_id=s.id
                           INNER JOIN orient_ressamlar.painters p ON p.id=s.painter_id
                           Where st.lang_id=$lang_id and s.status=1 and s.`id`='$sales'";
        $result         = mysqli_query($conn, $select_sales);
        $sales_row      = mysqli_fetch_array($result, MYSQLI_ASSOC);
    }
    ?>
    <div class="portfolio change-theme">
        <h2 class="head-text post-head change-theme portfolio-header profile-header"><?= $sales_row['name']; ?></h2>
        <div class="icon title-line">
            <img src="assets/img/title-line.png">
        </div>
        <div class="portfolio-pictures">
            <div id="first-category" class="port-picture container img-section">
                <div class="single-img">
                    <img src="uploads/<?= $sales_row['image']; ?>">
                </div>
                <div class="text-division">
                    <div>
                        <span class="text-head"><?= translate('painter-name', $lang_name); ?></h2></span><span class="texts-body"><?= $sales_row['painter_name']; ?> <?= $sales_row['painter_surname']; ?></span>
                    </div>
                    <div>
                        <span class="text-head"><?= translate('price', $lang_name); ?></span><span class="texts-body"><?= $sales_row['price']; ?> ₼</span>
                    </div>
                    <div>
                        <span class="text-head"><?= translate('size', $lang_name); ?></span><span class="texts-body"><?= $sales_row['size']; ?></span>
                    </div>
                    <div>
                        <span class="text-head"><?= translate('technique', $lang_name); ?></span><span class="texts-body"><?= $sales_row['technique']; ?></span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php include 'includes/footer.php'; ?>

</body>

</html>