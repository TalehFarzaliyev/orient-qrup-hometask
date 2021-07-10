<?php
include 'config/config.php';
$parent_sql   = "SELECT * FROM orient_ressamlar.menu_translation mt 
                 INNER JOIN orient_ressamlar.menu m ON mt.menu_id=m.id 
                 WHERE mt.lang_id=$lang_id and m.parent_id=0 and m.status=1 order by m.`order_number` ASC;";
$parent_menus = mysqli_fetch_all(mysqli_query($conn, $parent_sql), MYSQLI_ASSOC);
?>
<div class="menu-side">
    <a href="index.php?lang=<?=$lang_name;?>" class="logo-item">
        <img class="menu-logo1" src="assets/img/logo_img.png" alt="">
        <img class="menu-logo2" src="<?php if ($lang_id == 1) {echo 'assets/img/logo_word.png';} else echo 'assets/img/logo_eng.png'; ?>" alt="">
    </a>
    <a class="bars-icon" onclick="showMenu();"><i class="fas fa-bars"></i></a>
    <div class="menu-items">
        <?php
        if (!empty($parent_menus)) {
            foreach ($parent_menus as $parent) {
                $sub_sql   = "SELECT * FROM orient_ressamlar.menu_translation mt 
                              INNER JOIN orient_ressamlar.menu m ON mt.menu_id=m.id 
                              WHERE mt.lang_id=$lang_id and m.parent_id=" . $parent['menu_id'] . " and m.status=1 order by m.`order_number` ASC;";
                $sub_menus = mysqli_fetch_all(mysqli_query($conn, $sub_sql), MYSQLI_ASSOC);
                if (!empty($sub_menus)) {
                    echo '<div class="dropdown menu-item">';
                    echo '<a href="" class="btn btn-secondary dropdown-toggle hover-color menu-color" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' . $parent['name'] . '</a>';
                    echo '<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">';
                    foreach ($sub_menus as $submenu) {
                        if ($parent['menu_id'] == $submenu['parent_id']) {
                            echo '<a class="dropdown-item hover-color" href="' . $submenu['slug'] . '&lang=' . $lang_name . '">' . $submenu['name'] . '</a>';
                        }
                    }
                    echo '</div>';
                    echo '</div>';
                } else {
                    echo '<div class="dropdown-item menu-item single-item">';
                    echo ' <a href="' . $parent['slug'] . '?lang=' . $lang_name . '" class="menu-color hover-color btn-secondary">' . $parent['name'] . '</a>';
                    echo '</div>';
                }
            }
        }
        ?>
        <div class="dropdown menu-item">
            <a href="" class="btn btn-secondary dropdown-toggle hover-color menu-color" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-language"></i></a>
            <div class="dropdown-menu lang-icon" aria-labelledby="dropdownMenuButton">
                <?php
                foreach ($langs as $lang) {
                ?>
                    <a class="dropdown-item hover-color" href="<?= $site_url; ?>?lang=<?= strtolower($lang); ?>"><i class="flag flag-<?= strtolower($lang); if($lang=='EN'){echo('gb uk');} ?>"></i><?= $lang; ?></a>
                <?php } ?>
            </div>
        </div>
    </div>
</div>