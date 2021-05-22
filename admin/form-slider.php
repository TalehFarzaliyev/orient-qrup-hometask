<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';
    include 'functions/functions.php';

    $post_type = (isset($_GET['id'])) ? 'edit' : 'create';

    if ($_SERVER['REQUEST_METHOD'] = 'POST') {
        if (isset($_POST['post-type']) and !empty($_POST['post-type']) and $_POST['post-type'] == 'create') {
            $painter_name    = (isset($_POST['painter_name'])) ? trim($_POST['painter_name']) : '';
            $painter_surname = (isset($_POST['painter_surname'])) ? trim($_POST['painter_surname']) : '';
            $image           = uploadImage($_FILES['image']);
            $status          = (isset($_POST['status'])) ? intval($_POST['status']) : 0;
            $translation     = (isset($_POST['translation'])) ? $_POST['translation'] : [];

            $insert_slider   = "INSERT INTO `slider`(`painter_name`, `painter_surname`, `image`,`status`) VALUES ('$painter_name','$painter_surname','$image','$status')";
            $result_insert   = mysqli_query($conn, $insert_slider);
            if ($result_insert) {
                $slider_id   = mysqli_insert_id($conn);
                foreach ($translation as $key => $value) {
                    $insert_translation       = "INSERT INTO `slider_translation`(`slider_id`,`lang_id`,`about_painter`,`title`) VALUES ('$slider_id','$key','" . $value['about_painter'] . "','" . $value['title'] . "')";
                    mysqli_query($conn, $insert_translation);
                }
            }
            if (mysqli_query($conn, $insert_slider)) {
                echo "<script>alert('Əlavə olundu');</script>";
                header("Location: slides.php");
            } else {
                echo "<script>alert('Əlavə olunmadı');</script>";
                header("Location: slides.php");
            }
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

                        <h1 class="h3 mb-2 text-gray-800">Menyu əlavə et</h1>
                        <br>
                        <form action="form-slider.php" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-4 form-section">
                                    <br>
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Rəssamın adı</label>
                                        <input type="text" name="painter_name" class="form-control" id="exampleFormControlInput1" placeholder="Rəssamın adı">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Rəssamın soyadı</label>
                                        <input type="text" name="painter_surname" class="form-control" id="exampleFormControlInput1" placeholder="Rəssamın soyadı">
                                    </div>
                                    <div class="form-group img-section">
                                        <label for="exampleFormControlFile1">Şəkil</label>
                                        <input id="uploadImage" type="file" name="image" class="form-control-file" id="exampleFormControlFile1" onchange="PreviewImage();">
                                        <div class="delete-img" onclick="deleteImage();"><i class="fas fa-trash"></i></div>
                                        <img class="preview-img" id='previewImage' src="../uploads/noPhoto.png" class="img-thumbnail" alt="">

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
                                                    <label for="exampleFormControlInput1">Rəssam haqqında məlumat</label>
                                                    <input type="text" name="translation[<?= $row['id'] ?>][about_painter]" class="form-control" id="exampleFormControlInput1" placeholder="Rəssam haqqında">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleFormControlInput1">Başlıq</label>
                                                    <input type="text" name="translation[<?= $row['id'] ?>][title]" class="form-control" id="exampleFormControlInput1" placeholder="Başlıq">
                                                </div>
                                            </div>
                                        <?php
                                        }
                                        ?>
                                    </div>
                                    <input type="hidden" name="post-type" value="<?= $post_type; ?>">
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
            function PreviewImage() {
                var oFReader = new FileReader();
                oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

                oFReader.onload = function(oFREvent) {
                    document.getElementById("previewImage").src = oFREvent.target.result;
                };
            };

            function deleteImage() {
                document.getElementById("previewImage").src = '../uploads/noPhoto.png';
                document.getElementById("uploadImage").value = '';
            }
        </script>
    </body>

    </html>

<?php
} else {
    header('Location: login.php');
}
?>