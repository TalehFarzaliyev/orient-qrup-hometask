<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';

    $post_type = (isset($_GET['id'])) ? 'edit' : 'create';
    $menu_id   = (isset($_GET['id'])) ? intval($_GET['id']) : 0;

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        if (isset($_POST['post-type']) and !empty($_POST['post-type']) and $_POST['post-type'] == 'create') {
            $parent_id      = (isset($_POST['parent_id'])) ? intval($_POST['parent_id']) : 0;
            $order_number   = (isset($_POST['order_number'])) ? intval($_POST['order_number']) : 0;
            $type           = (isset($_POST['type'])) ? $_POST['type'] : '';
            $status         = (isset($_POST['status'])) ? intval($_POST['status']) : 0;
            $translation    = (isset($_POST['translation'])) ? $_POST['translation'] : [];

            $insert_menu    = "INSERT INTO `menu`(`parent_id`,`order_number`,`type`,`status`) VALUES ('$parent_id','$order_number','$type','$status')";
            $result_insert  = mysqli_query($conn, $insert_menu);
            if ($result_insert) {
                $menu_id = mysqli_insert_id($conn);
                foreach ($translation as $key => $value) {
                    $insert_translation    = "INSERT INTO `menu_translation`(`menu_id`,`lang_id`,`name`,`slug`) VALUES ('$menu_id','$key','" . $value['name'] . "','" . $value['slug'] . "')";
                    mysqli_query($conn, $insert_translation);
                }
            }
            header("Location: menu.php");
        } else if (isset($_POST['post-type']) and !empty($_POST['post-type']) and $_POST['post-type'] == 'edit') {
            $parent_id      = (isset($_POST['parent_id'])) ? intval($_POST['parent_id']) : 0;
            $order_number   = (isset($_POST['order_number'])) ? intval($_POST['order_number']) : 0;
            $type           = (isset($_POST['type'])) ? $_POST['type'] : '';
            $status         = (isset($_POST['status'])) ? intval($_POST['status']) : 0;
            $translation    = (isset($_POST['translation'])) ? $_POST['translation'] : [];

            $update_menu    = "UPDATE `menu` SET `parent_id`='$parent_id',`order_number`='$order_number',`type`='$type',`status`='$status' WHERE id=$menu_id";
            $result_update  = mysqli_query($conn, $update_menu);
            if ($result_update) {
                mysqli_query($conn, "DELETE FROM `menu_translation` WHERE `menu_id`=$menu_id");
                foreach ($translation as $key => $value) {
                    $insert_translation    = "INSERT INTO `menu_translation`(`menu_id`,`lang_id`,`name`,`slug`) VALUES ('$menu_id','$key','" . $value['name'] . "','" . $value['slug'] . "')";
                    mysqli_query($conn, $insert_translation);
                }
            }
            header("Location: menu.php");
        }
    }

?>
    <!DOCTYPE html>
    <html lang="en">

    <?php include 'includes/head.php'; ?>

    <body id="page-top">

        <div id="wrapper">

            <?php include 'includes/sidebar.php'; ?>

            <div id="content-wrapper" class="d-flex flex-column">

                <div id="content">

                    <?php include 'includes/topbar.php'; ?>

                    <div class="container-fluid">

                        <?php
                        if ($post_type == 'create') {
                        ?>
                            <h1 class="h3 mb-2 text-gray-800">Menyu əlavə et</h1>
                            <br>
                            <form action="form-menu.php" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-4 form-section">
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Ana kateqoriya</label>
                                            <select class="form-control" name="parent_id" id="exampleFormControlSelect1">
                                                <option value="0">Seç</option>
                                                <?php

                                                $select_sql    = "SELECT * FROM menu_translation mt 
                                                                  INNER JOIN menu m ON mt.menu_id=m.id 
                                                                  WHERE `lang_id`=1 && `parent_id`=0";
                                                $result        = mysqli_query($conn, $select_sql);
                                                while ($row1   = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                ?>
                                                    <option value="<?= $row1['menu_id']; ?>"><?= $row1['name']; ?></option>;
                                                <?php
                                                }
                                                ?>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlTextarea1">Sıra nömrəsi</label>
                                            <input type="number" name="order_number" required min="0" class="form-control" id="exampleFormControlInput1" placeholder="Sıra nömrəsi">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Səhifənin tipi</label>
                                            <select class="form-control" name="type" id="exampleFormControlSelect1">
                                                <option selected value="">Seç</option>
                                                <option value="post">Post</option>
                                                <option value="painter">Painter</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Status</label>
                                            <select class="form-control" name="status" id="exampleFormControlSelect1">
                                                <option value="0">Deaktiv</option>
                                                <option selected value="1">Aktiv</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="col-8 form-language">
                                        <nav>
                                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                <?php
                                                $select_sql = "SELECT * FROM `languages` WHERE `status`=1";
                                                $result     = mysqli_query($conn, $select_sql);
                                                while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                ?>
                                                    <a class="nav-item nav-link <?php if ($row['code'] == 'az') echo 'active' ?>" id="nav-<?= $row['code']; ?>-tab" data-toggle="tab" href="#nav-<?= $row['code']; ?>" role="tab" aria-controls="nav-<?= $row['code']; ?>" aria-selected="true"><?= $row['name']; ?>&nbsp;&nbsp;<i class="flag flag-<?= $row['flag']; ?>"></i></a>
                                                <?php
                                                }
                                                ?>
                                            </div>
                                        </nav>
                                        <br>
                                        <div class="tab-content" id="nav-tabContent">
                                            <?php
                                            $select_sql     = "SELECT * FROM `languages` WHERE `status`=1";
                                            $result         = mysqli_query($conn, $select_sql);
                                            while ($row     = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                            ?>
                                                <div class="tab-pane fade show <?php if ($row['code'] == 'az') echo 'active' ?>" id="nav-<?= $row['code']; ?>" role="tabpanel" aria-labelledby="nav-<?= $row['code']; ?>-tab">
                                                    <div class="form-group">
                                                        <label for="exampleFormControlInput1">Menyu elementi adı</label>
                                                        <input type="text" name="translation[<?= $row['id'] ?>][name]" required class="form-control" id="exampleFormControlInput1" placeholder="Menyu elementinin adı">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleFormControlInput1">Slug</label>
                                                        <input type="text" name="translation[<?= $row['id'] ?>][slug]" class="form-control" id="exampleFormControlInput1" placeholder="Slug">
                                                    </div>
                                                </div>
                                            <?php
                                            }
                                            ?>
                                        </div>
                                        <input type="hidden" name="post-type" value="<?= $post_type; ?>">
                                        <div class="form-group">
                                            <button type="submit" name="submit" value="submit" class="btn btn-primary">Yadda saxla</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        <?php
                        } elseif ($post_type == 'edit') {
                            if (!empty($menu_id)) {
                                $sql        = "SELECT * FROM `menu` WHERE `id`=$menu_id";
                                $sql_tr     = "SELECT * FROM languages lang
                                               INNER JOIN menu_translation mt ON lang.id=mt.lang_id WHERE mt.menu_id=$menu_id";
                                $result     = mysqli_query($conn, $sql);
                                $menu_row   = mysqli_fetch_assoc($result);
                                $result_tr  = mysqli_query($conn, $sql_tr);
                                $menu_tr    = mysqli_fetch_all($result_tr, MYSQLI_ASSOC);
                            }
                        ?>
                            <h1 class="h3 mb-2 text-gray-800">Menyu redaktə et</h1>
                            <br>
                            <form action="form-menu.php?id=<?= $menu_id; ?>" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-4 form-section">
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Ana kateqoriya</label>
                                            <select class="form-control" name="parent_id" id="exampleFormControlSelect1">
                                                <option value="0">Seç</option>
                                                <?php
                                                $select_sql  = "SELECT * FROM `menu_translation` mt INNER JOIN `menu` m ON mt.menu_id=m.id WHERE `lang_id`=1 && `parent_id`=0";
                                                $result      = mysqli_query($conn, $select_sql);
                                                while ($row1 = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                ?>
                                                    <option value="<?= $row1['menu_id']; ?>" <?php echo ($menu_row['parent_id'] == $row1['menu_id']) ? 'selected' : ''; ?>><?= $row1['name']; ?></option>
                                                <?php
                                                }
                                                ?>

                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlTextarea1">Sıra nömrəsi</label>
                                            <input type="number" name="order_number" min="0" required class="form-control" value="<?= $menu_row['order_number']; ?>" id="exampleFormControlInput1" placeholder="Sıra nömrəsi">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Səhifənin tipi</label>
                                            <select class="form-control" name="type" id="exampleFormControlSelect1">
                                                <option value="">Seç</option>
                                                <option value="post" <?php echo ($menu_row['type'] == 'post') ? 'selected' : ''; ?>>Post</option>
                                                <option value="painter" <?php echo ($menu_row['type'] == 'painter') ? 'selected' : ''; ?>>Painter</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Status</label>
                                            <select class="form-control" name="status" id="exampleFormControlSelect1">
                                                <option value="0" <?php echo ($menu_row['status'] == 0) ? 'selected' : ''; ?>>Deaktiv</option>
                                                <option value="1" <?php echo ($menu_row['status'] == 1) ? 'selected' : ''; ?>>Aktiv</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="col-8 form-language">
                                        <nav>
                                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                <?php
                                                $select_sql = "SELECT * FROM `languages` Where `status`=1";
                                                $result     = mysqli_query($conn, $select_sql);
                                                $langs      = mysqli_fetch_all($result, MYSQLI_ASSOC);
                                                foreach ($langs as $key => $value) {
                                                ?>
                                                    <a class="nav-item nav-link <?php if ($value['code'] == 'az') echo 'active' ?>" id="nav-<?= $value['code']; ?>-tab" data-toggle="tab" href="#nav-<?= $value['code']; ?>" role="tab" aria-controls="nav-<?= $value['code']; ?>" aria-selected="true"><?= $value['name']; ?>&nbsp;&nbsp;<i class="flag flag-<?= $value['flag']; ?>"></i></a>
                                                <?php
                                                }
                                                ?>
                                            </div>
                                        </nav>
                                        <br>
                                        <div class="tab-content" id="nav-tabContent">
                                            <?php
                                            foreach ($menu_tr as $key => $value) {
                                            ?>
                                                <div class="tab-pane fade show <?php if ($value['code'] == 'az') echo 'active' ?>" id="nav-<?= $value['code']; ?>" role="tabpanel" aria-labelledby="nav-<?= $value['code']; ?>-tab">
                                                    <div class="form-group">
                                                        <label for="exampleFormControlInput1">Menyu elementi adı</label>
                                                        <input type="text" name="translation[<?= $value['lang_id'] ?>][name]" required value="<?= $value['name']; ?>" class="form-control" id="exampleFormControlInput1" placeholder="Menyu elementinin adı">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleFormControlInput1">Slug</label>
                                                        <input type="text" name="translation[<?= $value['lang_id'] ?>][slug]" value="<?= $value['slug']; ?>" class="form-control" id="exampleFormControlInput1" placeholder="Slug">
                                                    </div>
                                                </div>
                                            <?php
                                            }
                                            ?>
                                        </div>
                                        <input type="hidden" name="post-type" value="<?= $post_type; ?>">
                                        <div class="form-group">
                                            <button type="submit" name="submit" value="submit" class="btn btn-primary">Yadda saxla</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        <?php
                        }
                        ?>

                    </div>

                </div>

                <?php include 'includes/content-footer.php'; ?>

            </div>

        </div>

        <?php include 'includes/footer.php'; ?>

    </body>

    </html>

<?php
} else {
    header('Location: login.php');
}
?>