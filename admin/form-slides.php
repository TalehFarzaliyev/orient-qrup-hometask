<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';
    include 'functions/functions.php';

    $post_type = (isset($_GET['id'])) ? 'edit' : 'create';
    $slider_id = (isset($_GET['id'])) ? intval($_GET['id']) : 0;
    if (!empty($slider_id)) {
        $sql        = "SELECT * FROM `slider` WHERE `id`=$slider_id";
        $sql_tr     = "SELECT * FROM languages lang
                       INNER JOIN slider_translation st ON lang.id=st.lang_id WHERE st.slider_id=$slider_id";
        $result     = mysqli_query($conn, $sql);
        $slider_row = mysqli_fetch_assoc($result);
        $result_tr  = mysqli_query($conn, $sql_tr);
        $slider_tr  = mysqli_fetch_all($result_tr, MYSQLI_ASSOC);
    }else{
        $slider_row = [];
        $slider_tr  = [];
    }

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
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
                    $insert_translation       = "INSERT INTO `slider_translation`(`slider_id`,`lang_id`,`title`) VALUES ('$slider_id','$key','" . $value['title'] . "')";
                    mysqli_query($conn, $insert_translation);
                }
            }
            header("Location: slides.php");
        } else if (isset($_POST['post-type']) and !empty($_POST['post-type']) and $_POST['post-type'] == 'edit') {
            $painter_name    = (isset($_POST['painter_name'])) ? trim($_POST['painter_name']) : '';
            $painter_surname = (isset($_POST['painter_surname'])) ? trim($_POST['painter_surname']) : '';

            if ($_POST['hidden'] == "0")
                $image  = uploadImage('../uploads/noPhoto.png');
            elseif (empty($_FILES['image']['tmp_name']) || !is_uploaded_file($_FILES['image']['tmp_name']))
                $image  = $slider_row['image'];
            else
                $image  = uploadImage($_FILES['image']);

            $status          = (isset($_POST['status'])) ? intval($_POST['status']) : 0;
            $translation     = (isset($_POST['translation'])) ? $_POST['translation'] : [];

            $update_slider   = "UPDATE `slider` SET `painter_name`='$painter_name', `painter_surname`='$painter_surname', `image`='$image',`status`='$status' WHERE `id`=$slider_id";
            $result_update   = mysqli_query($conn, $update_slider);
            if ($result_update) {
                mysqli_query($conn, "DELETE FROM `slider_translation` WHERE `slider_id`=$slider_id");
                foreach ($translation as $key => $value) {
                    $insert_translation       = "INSERT INTO `slider_translation`(`slider_id`,`lang_id`,`title`) VALUES ('$slider_id','$key','" . $value['title'] . "')";
                    mysqli_query($conn, $insert_translation);
                }
            }
            header("Location: slides.php");
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
                        <h1 class="h3 mb-2 text-gray-800">Slider redaktə et</h1>
                        <br>
                        <form action="form-slides.php?id=<?= $slider_id; ?>" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-4 form-section" style="margin: 30px 0;">
                                    <br>
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1" class="form-label">Rəssamın adı</label>
                                        <input type="text" class="form-control" name="painter_name"   id="exampleFormControlInput1">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1" class="form-label">Rəssamın Soyadı</label>
                                        <input type="text" name="painter_surname" class="form-control" id="exampleFormControlInput1">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlFile1">Şəkil</label>
                                        <input id="uploadImageC" name="image" style="align-items: center; margin: 10px;" onchange="PreviewImageC();" type="file" name="image" class="form-control-file" id="exampleFormControlFile1">
                                        <img onclick="clearImg();" src="../uploads/dlt.png" style="width:40px; height:40px; margin:10px; text-align:center;" alt="">
                                        <?php
                                        if (empty($row['image']))
                                            echo "<img id='previewImageC' src='../uploads/noPhoto.png' class='img-thumbnail' width='250px'; height='250px'>";
                                        else
                                            echo "<img id='previewImageC' src='../uploads/" . $row['image'] . "' class='img-thumbnail' width='250px'; height='250px'>";
                                        ?>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">Status</label>
                                        <select class="form-control" name="status" id="exampleFormControlSelect1">
                                            <option value="0">Deaktiv</option>
                                            <option value="1" selected>Aktiv</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-8">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <?php
                                            $select_sql  = "SELECT * FROM `languages` WHERE `status`=1";
                                            $result      = mysqli_query($conn, $select_sql);
                                            while ($row  = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                            ?>
                                                <a class="nav-item nav-link <?php if ($row['code'] == 'az') echo 'active' ?>" id="nav-<?= $row['code']; ?>-tab" data-toggle="tab" href="#nav-<?= $row['code']; ?>" role="tab" aria-controls="nav-<?= $row['code']; ?>" aria-selected="true"><?= $row['name']; ?>&nbsp;&nbsp;<i class="flag flag-<?= $row['flag']; ?>"></i></a>                                            
                                            <?php
                                            }
                                            ?>
                                        </div>
                                    </nav>
                                    <div class="tab-content" id="nav-tabContent">
                                        <?php
                                        $select_sql  = "SELECT * FROM `languages` WHERE `status`=1";
                                        $result      = mysqli_query($conn, $select_sql);
                                        while ($row  = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                        ?>
                                            <div class="tab-pane fade show <?php if ($row['code'] == 'az') echo 'active' ?>" id="nav-<?= $row['code']; ?>" role="tabpanel" aria-labelledby="nav-<?= $row['code']; ?>-tab">
                                                <div class="form-group">
                                                    <label for="exampleFormControlInput1" class="form-label" style="margin: 10px 0;">Rəssam haqqında məlumat</label>
                                                    <input type="text" name="translation[<?= $row['id'] ?>][text]" class="form-control" id="exampleFormControlInput1">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleFormControlInput1" class="form-label">Başlıq</label>
                                                    <input type="text" name="translation[<?= $row['id'] ?>][about]" class="form-control" id="exampleFormControlInput1">
                                                </div>
                                            </div>
                                        <?php
                                        }
                                        ?>
                                    </div>
                                    <input type="hidden" name="post-type" value="<?= $post_type; ?>">
                                    <div class="form-group" style="margin-top: 105px;">
                                        <button type="submit" class="btn btn-primary" style="margin-top:20px" value="Submit">Yadda saxla</button>
                                    </div>
                                </div>

                            </div>
                        </form>

                        <?php
                        } else if ($post_type == 'edit') {
                        ?>
                        <h1 class="h3 mb-2 text-gray-800">Slider redaktə et</h1>
                        <br>
                         <form action="form-slides.php?id=<?= $slider_id; ?>" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-4 form-section" style="margin: 30px 0;">
                                    <br>
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1" class="form-label">Rəssamın adı</label>
                                        <input type="text" class="form-control" style="margin: 6px 0"; name="painter_name"  value="<?= $slider_row['painter_name'];?>"   id="exampleFormControlInput1">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1" class="form-label">Rəssamın Soyadı</label>
                                        <input type="text" name="painter_surname" value="<?= $slider_row['painter_surname']; ?>" class="form-control" id="exampleFormControlInput1">
                                    </div>
                                    <div class="form-group img-section">
                                            <label for="exampleFormControlFile1">Şəkil</label>
                                            <input id="uploadImage" value="<?= $slider_row['image']; ?>" type="file" name="image" class="form-control-file" id="exampleFormControlFile1" onchange="PreviewImage();">
                                            <div class="delete-img" onclick="deleteImage();"><i class="fas fa-trash"></i></div>
                                            <input id="hiddenInput" type="hidden" name="hidden" value="1">
                                            <?php
                                            if (empty($slider_row['image']))
                                                echo "<img id='previewImage' src='../uploads/noPhoto.png' class='img-thumbnail preview-img' alt=''>";
                                            else
                                                echo "<img id='previewImage' src='../uploads/" . $slider_row['image'] . "' class='img-thumbnail preview-img' alt=''>";
                                            ?>
                                        </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">Status</label>
                                        <select class="form-control" name="status" value="<?= $slider_row['status']; ?>" id="exampleFormControlSelect1">
                                            <option value="0" <?php echo ($slider_row['status'] == 0) ? 'selected' : ''; ?>>Deaktiv</option>
                                            <option value="1" <?php echo ($slider_row['status'] == 1) ? 'selected' : ''; ?>>Aktiv</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-8">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <?php
                                            $select_sql  = "SELECT * FROM `languages` WHERE `status`=1";
                                            $result      = mysqli_query($conn, $select_sql);
                                            $langs       = mysqli_fetch_all($result, MYSQLI_ASSOC);
                                            foreach ($langs as $key => $value) {
                                            ?>
                                            <a class="nav-item nav-link <?php if ($value['code'] == 'az') echo 'active' ?>" id="nav-<?= $value['code']; ?>-tab" data-toggle="tab" href="#nav-<?= $value['code']; ?>" role="tab" aria-controls="nav-<?= $value['code']; ?>" aria-selected="true"><?= $value['name']; ?>&nbsp;&nbsp;<i class="flag flag-<?= $value['flag']; ?>"></i></a>
                                            <?php
                                                }
                                            ?>
                                        </div>
                                    </nav>
                                    <div class="tab-content" id="nav-tabContent">
                                    <?php
                                        foreach ($slider_tr as $key => $value) {
                                    ?>
                                            <div class="tab-pane fade show <?php if ($value['code'] == 'az') echo 'active' ?>" id="nav-<?= $value['code']; ?>" role="tabpanel" aria-labelledby="nav-<?= $value['code']; ?>-tab">
                                                <!-- <div class="form-group">
                                                    <label for="exampleFormControlInput1" class="form-label" style="margin: 10px 0;">Rəssam haqqında məlumat</label>
                                                    <input type="text" name="translation[<?= $value['lang_id'] ?>][about]" value="<?= $value['about']; ?>" class="form-control" id="exampleFormControlInput1">
                                                </div> -->
                                                <div class="form-group">
                                                    <label for="exampleFormControlInput1" style="margin: 10px 0" class="form-label">Başlıq</label>
                                                    <input type="text" placeholder="Başlığı daxil edin..." name="translation[<?= $value['lang_id'] ?>][text]" value="<?= $value['text']; ?>" class="form-control" id="exampleFormControlInput1">
                                                </div>
                                            </div>
                                        <?php
                                        }
                                        ?>
                                    </div>
                                    <input type="hidden" name="post-type" value="<?= $post_type; ?>">                                   
                                    <div class="form-group" style="margin-top: 28px;">
                                        <button type="submit" class="btn btn-primary" style="margin-top:20px" value="Submit">Yadda saxla</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <?php
                        }
                        ?>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <?php include 'includes/content-footer.php'; ?>

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <?php include 'includes/footer.php'; ?>
        <script type="text/javascript">
            function PreviewImageC() {
                var oFReader = new FileReader();
                oFReader.readAsDataURL(document.getElementById("uploadImageC").files[0]);

                oFReader.onload = function(oFREvent) {
                    document.getElementById("previewImageC").src = oFREvent.target.result;
                };
            };

            function clearImg() {
                document.getElementById("previewImageC").src = '../uploads/noPhoto.png';
            }


            function PreviewImage() {
                document.getElementById('hiddenInput').value = '1';
                var oFReader = new FileReader();
                oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);
                oFReader.onload = function(oFREvent) {
                document.getElementById("previewImage").src = oFREvent.target.result;
                };
            };

            function deleteImage() {
                document.getElementById("previewImage").src = '../uploads/noPhoto.png';
                document.getElementById("uploadImage").value = '';
                document.getElementById('hiddenInput').value = '0';
            }
        </script>

    </body>

    </html>

<?php

} else {
    header('Location: login.php');
}
?>