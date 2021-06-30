<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';
    include 'functions/functions.php';

    $settings_id = (isset($_GET['id'])) ? intval($_GET['id']) : 0;
    if (!empty($settings_id)) {
        $sql          = "SELECT * FROM `settings` WHERE `id`=$settings_id";
        $sql_tr       = "SELECT * FROM languages lang
                        INNER JOIN settings_translation st ON lang.id=st.lang_id WHERE st.settings_id=$settings_id";
        $result       = mysqli_query($conn, $sql);
        $settings_row = mysqli_fetch_assoc($result);
        $result_tr    = mysqli_query($conn, $sql_tr);
        $settings_tr  = mysqli_fetch_all($result_tr, MYSQLI_ASSOC);
    } else {
        $settings_row = [];
        $settings_tr  = [];
    }

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $facebook    = (isset($_POST['facebook'])) ? trim($_POST['facebook']) : '';
        $instagram   = (isset($_POST['instagram'])) ? trim($_POST['instagram']) : '';
        $gmail       = (isset($_POST['gmail'])) ? trim($_POST['gmail']) : '';
        $youtube     = (isset($_POST['youtube'])) ? trim($_POST['youtube']) : '';
        $phone       = (isset($_POST['phone'])) ? trim($_POST['phone']) : '';
        $translation     = (isset($_POST['translation'])) ? $_POST['translation'] : [];

        $update_settings = "UPDATE `settings` SET `facebook`='$facebook', `instagram`='$instagram', `gmail`='$gmail',`youtube`='$youtube', `phone`='$phone' WHERE `id`=$settings_id";
        $result_update   = mysqli_query($conn, $update_settings);
        if ($result_update) {
            mysqli_query($conn, "DELETE FROM `settings_translation` WHERE `settings_id`=$settings_id");
            foreach ($translation as $key => $value) {
                $insert_translation       = "INSERT INTO `settings_translation`(`settings_id`,`lang_id`,`title`,`description`,`keywords`,`address`,`privacy_policy`,`terms_of_use`,`faq`) VALUES ('$settings_id','$key','" . $value['title'] . "','" . $value['description'] . "','" . $value['keywords'] . "','" . $value['address'] . "','" . $value['privacy_policy'] . "','" . $value['terms_of_use'] . "','" . $value['faq'] . "')";
                mysqli_query($conn, $insert_translation);
            }
        }
        header("Location: form-settings.php?id=1");
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
                        <h1 class="h3 mb-2 text-gray-800">Tənzimləmələr</h1>
                        <br>
                        <form action="form-settings.php?id=<?= $settings_id; ?>" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-4 form-section">
                                    <br>
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Facebook</label>
                                        <input type="text" name="facebook" required class="form-control" value="<?= $settings_row['facebook']; ?>" id="exampleFormControlInput1">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">İnstagram</label>
                                        <input type="text" name="instagram" required class="form-control" value="<?= $settings_row['instagram']; ?>" id="exampleFormControlInput1">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Gmail</label>
                                        <input type="text" name="gmail" required class="form-control" value="<?= $settings_row['gmail']; ?>" id="exampleFormControlInput1">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Youtube</label>
                                        <input type="text" name="youtube" required class="form-control" value="<?= $settings_row['youtube']; ?>" id="exampleFormControlInput1">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Telefon</label>
                                        <input type="text" name="phone" required class="form-control" value="<?= $settings_row['phone']; ?>" id="exampleFormControlInput1">
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
                                        foreach ($settings_tr as $key => $value) {
                                        ?>
                                            <div class="tab-pane fade show <?php if ($value['code'] == 'az') echo 'active' ?>" id="nav-<?= $value['code']; ?>" role="tabpanel" aria-labelledby="nav-<?= $value['code']; ?>-tab">
                                                <div class="form-group">
                                                    <label for="exampleFormControlInput1">Title</label>
                                                    <input type="text" name="translation[<?= $value['lang_id'] ?>][title]" required value="<?= $value['title']; ?>" class="form-control" id="exampleFormControlInput1">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleFormControlInput1">Description</label>
                                                    <input type="text" name="translation[<?= $value['lang_id'] ?>][description]" required value="<?= $value['description']; ?>" class="form-control" id="exampleFormControlInput1">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleFormControlInput1">Keywords</label>
                                                    <input type="text" name="translation[<?= $value['lang_id'] ?>][keywords]" required value="<?= $value['keywords']; ?>" class="form-control" id="exampleFormControlInput1">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleFormControlInput1">Adres</label>
                                                    <input type="text" name="translation[<?= $value['lang_id'] ?>][address]" required value="<?= $value['address']; ?>" class="form-control" id="exampleFormControlInput1">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleFormControlInput1">Gizlilik siyasəti</label>
                                                    <textarea name="translation[<?= $value['lang_id'] ?>][privacy_policy]" cols="40" rows="10" required class="form-control editor" id="editor<?= $value['lang_id'] ?>" style="visibility:hidden; display: none;"><?= $value['privacy_policy']; ?></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleFormControlInput1">İstifadə şərtləri</label>
                                                    <textarea name="translation[<?= $value['lang_id'] ?>][terms_of_use]" cols="40" rows="10" required class="form-control editor" id="editor<?= $value['lang_id'] ?>" style="visibility:hidden; display: none;"><?= $value['terms_of_use']; ?></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleFormControlInput1">Tez-tez verilən suallar</label>
                                                    <textarea name="translation[<?= $value['lang_id'] ?>][faq]" cols="40" rows="10" required class="form-control editor" id="editor<?= $value['lang_id'] ?>" style="visibility:hidden; display: none;"><?= $value['faq']; ?></textarea>
                                                </div>
                                            </div>
                                        <?php
                                        }
                                        ?>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" name="submit" value="submit" class="btn btn-primary save-button">Yadda saxla</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <?php include 'includes/content-footer.php'; ?>

            </div>

        </div>

        <?php include 'includes/footer.php'; ?>

        <script type="text/javascript">
            var id = 1;
            $('textarea.editor').each(function() {
                $(this).attr("id", "editor" + id);
                CKEDITOR.replace('editor' + id, {
                    height: '300px',

                });
                id = id + 1;
            });
        </script>

    </body>

    </html>

<?php
} else {
    header('Location: login.php');
}
?>