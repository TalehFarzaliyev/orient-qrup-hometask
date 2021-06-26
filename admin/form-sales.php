<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';
    include 'functions/functions.php';

    $post_type = (isset($_GET['id'])) ? 'edit' : 'create';
    $sales_id = (isset($_GET['id'])) ? intval($_GET['id']) : 0;
    if (!empty($sales_id)) {
        $sql        = "SELECT * FROM `sales` WHERE `id`=$sales_id";
        $sql_tr     = "SELECT * FROM languages lang
                       INNER JOIN sales_translation st ON lang.id=st.lang_id WHERE st.sales_id=$sales_id";
        $result     = mysqli_query($conn, $sql);
        $sales_row  = mysqli_fetch_assoc($result);
        $result_tr  = mysqli_query($conn, $sql_tr);
        $sales_tr   = mysqli_fetch_all($result_tr, MYSQLI_ASSOC);
    } else {
        $sales_row  = [];
        $sales_tr   = [];
    }

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        if (isset($_POST['post-type']) and !empty($_POST['post-type']) and $_POST['post-type'] == 'create') {
            $painter_id      = (isset($_POST['painter_id'])) ? intval($_POST['painter_id']) : 0;
            $image           = uploadImage($_FILES['image']);
            $price           = (isset($_POST['price'])) ? trim($_POST['price']) : '';
            $status          = (isset($_POST['status'])) ? intval($_POST['status']) : 0;
            $translation     = (isset($_POST['translation'])) ? $_POST['translation'] : [];

            $insert_sales    = "INSERT INTO `sales`(`painter_id`, `image`, `price`, `status`) VALUES ('$painter_id','$image','$price','$status')";
            $result_insert   = mysqli_query($conn, $insert_sales);
            if ($result_insert) {
                $sales_id    = mysqli_insert_id($conn);
                foreach ($translation as $key => $value) {
                    $insert_translation       = "INSERT INTO `sales_translation`(`sales_id`, `lang_id`, `name`, `size`, `technique`) VALUES ('$sales_id','$key','" . $value['name'] . "','" . $value['size'] . "','" . $value['technique'] . "')";
                    mysqli_query($conn, $insert_translation);
                }
            }
            header("Location: sales.php");
        } else if (isset($_POST['post-type']) and !empty($_POST['post-type']) and $_POST['post-type'] == 'edit') {
            $painter_id      = (isset($_POST['painter_id'])) ? intval($_POST['painter_id']) : 0;

            if ($_POST['hidden'] == "0")
                $image  = 'noPhoto.png';
            elseif (empty($_FILES['image']['tmp_name']) || !is_uploaded_file($_FILES['image']['tmp_name']))
                $image  = $sales_row['image'];
            else
                $image  = uploadImage($_FILES['image']);
            
            $price           = (isset($_POST['price'])) ? trim($_POST['price']) : '';
            $status          = (isset($_POST['status'])) ? intval($_POST['status']) : 0;
            $translation     = (isset($_POST['translation'])) ? $_POST['translation'] : [];

            $update_sales    = "UPDATE `sales` SET `painter_id`='$painter_id', `image`='$image', `price`='$price', `status`='$status' WHERE `id`=$sales_id";
            $result_update   = mysqli_query($conn, $update_sales);
            if ($result_update) {
                mysqli_query($conn, "DELETE FROM `sales_translation` WHERE `sales_id`=$sales_id");
                foreach ($translation as $key => $value) {
                    $insert_translation       = "INSERT INTO `sales_translation`(`sales_id`, `lang_id`, `name`, `size`, `technique`) VALUES ('$sales_id','$key','" . $value['name'] . "','" . $value['size'] . "','" . $value['technique'] . "')";
                    mysqli_query($conn, $insert_translation);
                }
            }
            header("Location: sales.php");
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
                            <h1 class="h3 mb-2 text-gray-800">Məhsul əlavə et</h1>
                            <br>
                            <form action="form-sales.php" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-4 form-section">
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Rəssam</label>
                                            <select class="form-control" name="painter_id" id="exampleFormControlSelect1">
                                                <?php
                                                $select_sql       = "SELECT * FROM orient_ressamlar.painters 
                                                                     WHERE `status`=1";
                                                $result           = mysqli_query($conn, $select_sql);
                                                while ($row1      = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                ?>
                                                    <option value="<?= $row1['id']; ?>"><?= $row1['painter_name']; ?> <?= $row1['painter_surname']; ?></option>;
                                                <?php
                                                }
                                                ?>
                                            </select>
                                        </div>
                                        <div class="form-group img-section">
                                            <label for="exampleFormControlFile1">Şəkil</label>
                                            <input id="uploadImage-create" type="file" name="image" class="form-control-file" id="exampleFormControlFile1" onchange="PreviewImageCreate();">
                                            <div class="delete-img" onclick="deleteImageCreate();"><i class="fas fa-trash"></i></div>
                                            <img class="preview-img" id='previewImage-create' src="../uploads/noPhoto.png" style="width: 100%;" class="img-thumbnail" alt="">

                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">Qiymət</label>
                                            <input type="text" name="price" class="form-control" required id="exampleFormControlInput1" placeholder="Qiymət">
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
                                                        <label for="exampleFormControlInput1">Məhsul adı</label>
                                                        <input type="text" name="translation[<?= $row['id'] ?>][name]" class="form-control" required id="exampleFormControlInput1" placeholder="Məhsulun adı">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleFormControlInput1">Ölçü</label>
                                                        <input type="text" name="translation[<?= $row['id'] ?>][size]" class="form-control" required id="exampleFormControlInput1" placeholder="Ölçü">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleFormControlInput1">Texnika</label>
                                                        <input type="text" name="translation[<?= $row['id'] ?>][technique]" class="form-control" required id="exampleFormControlInput1" placeholder="Texnika">
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

                        <?php
                        } elseif ($post_type == 'edit') {
                        ?>
                            <h1 class="h3 mb-2 text-gray-800">Məhsulu redaktə et</h1>
                            <br>
                            <form action="form-sales.php?id=<?= $sales_id; ?>" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-4 form-section">
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Rəssam</label>
                                            <select class="form-control" name="painter_id" id="exampleFormControlSelect1">
                                                <option value="0">Seç</option>
                                                <?php
                                                $select_sql  = "SELECT * FROM orient_ressamlar.painters  
                                                                WHERE `status`=1";
                                                $result      = mysqli_query($conn, $select_sql);
                                                while ($rows = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                ?>
                                                    <option value="<?= $rows['id']; ?>" <?php echo ($sales_row['painter_id'] == $rows['id']) ? 'selected' : ''; ?>><?= $rows['painter_name']; ?> <?= $rows['painter_surname']; ?></option>
                                                <?php
                                                }
                                                ?>

                                            </select>
                                        </div>
                                        <div class="form-group img-section">
                                            <label for="exampleFormControlFile1">Şəkil</label>
                                            <input id="uploadImage" value="<?= $sales_row['image']; ?>" type="file" name="image" class="form-control-file" id="exampleFormControlFile1" onchange="PreviewImage();">
                                            <div class="delete-img" onclick="deleteImage();"><i class="fas fa-trash"></i></div>
                                            <input id="hiddenInput" type="hidden" name="hidden" value="1">
                                            <?php
                                            if (empty($sales_row['image']))
                                                echo "<img id='previewImage' src='../uploads/noPhoto.png' class='img-thumbnail preview-img' alt=''>";
                                            else
                                                echo "<img id='previewImage' src='../uploads/" . $sales_row['image'] . "' class='img-thumbnail preview-img' alt=''>";
                                            ?>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">Qiymət</label>
                                            <input type="text" name="price" class="form-control" required value="<?= $sales_row['price']; ?>" id="exampleFormControlInput1" placeholder="Qiymət">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Status</label>
                                            <select class="form-control" name="status" id="exampleFormControlSelect1">
                                                <option value="0" <?php echo ($sales_row['status'] == 0) ? 'selected' : ''; ?>>Deaktiv</option>
                                                <option value="1" <?php echo ($sales_row['status'] == 1) ? 'selected' : ''; ?>>Aktiv</option>
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
                                            foreach ($sales_tr as $key => $value) {
                                            ?>
                                                <div class="tab-pane fade show <?php if ($value['code'] == 'az') echo 'active' ?>" id="nav-<?= $value['code']; ?>" role="tabpanel" aria-labelledby="nav-<?= $value['code']; ?>-tab">
                                                    <div class="form-group">
                                                        <label for="exampleFormControlInput1">Məhsul adı</label>
                                                        <input type="text" name="translation[<?= $value['lang_id'] ?>][name]" required value="<?= $value['name']; ?>" class="form-control" id="exampleFormControlInput1" placeholder="Məhsulun adı">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleFormControlInput1">Ölçü</label>
                                                        <input type="text" name="translation[<?= $value['lang_id'] ?>][size]" required value="<?= $value['size']; ?>" class="form-control" id="exampleFormControlInput1" placeholder="Ölçü">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleFormControlInput1">Texnika</label>
                                                        <input type="text" name="translation[<?= $value['lang_id'] ?>][technique]" required value="<?= $value['technique']; ?>" class="form-control" id="exampleFormControlInput1" placeholder="Texnika">
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

                        <?php
                        }
                        ?>

                    </div>

                </div>

                <?php include 'includes/content-footer.php'; ?>

            </div>

        </div>

        <?php include 'includes/footer.php'; ?>
        <script type="text/javascript">
            function PreviewImageCreate() {
                var oFReader = new FileReader();
                oFReader.readAsDataURL(document.getElementById("uploadImage-create").files[0]);

                oFReader.onload = function(oFREvent) {
                    document.getElementById("previewImage-create").src = oFREvent.target.result;
                };
            };

            function deleteImageCreate() {
                document.getElementById("previewImage-create").src = '../uploads/noPhoto.png';
                document.getElementById("uploadImage-create").value = '';
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