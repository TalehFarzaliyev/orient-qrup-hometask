<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';
    include 'functions/functions.php';

    $post_type = (isset($_GET['id'])) ? 'edit' : 'create';
    $painter_id = (isset($_GET['id'])) ? intval($_GET['id']) : 0;
    $selected_category = [];
    if (!empty($painter_id)) {
        $sql              = "SELECT * FROM `painters` WHERE `id`=$painter_id";
        $sql_category     = "SELECT * FROM `painters_to_category` WHERE `painter_id`=$painter_id";
        $sql_tr           = "SELECT * FROM languages lang
                             INNER JOIN painter_translation pt ON lang.id=pt.lang_id WHERE pt.painter_id=$painter_id";
        $result           = mysqli_query($conn, $sql);
        $painter_row      = mysqli_fetch_assoc($result);
        $result_category  = mysqli_query($conn, $sql_category);
        $painter_category = mysqli_fetch_all($result_category, MYSQLI_ASSOC);
        foreach($painter_category as $key=>$value)
        {
            $selected_category[$key] = $value['category_id'];
        }
        $result_tr        = mysqli_query($conn, $sql_tr);
        $painter_tr       = mysqli_fetch_all($result_tr, MYSQLI_ASSOC);
    } else {
        $painter_row      = [];
        $painter_category = [];
        $painter_tr       = [];
    }
    //  print_r($painter_category);
    //  print_r($selected_category); exit();
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        if (isset($_POST['post-type']) and !empty($_POST['post-type']) and $_POST['post-type'] == 'create') {
            $painter_name    = (isset($_POST['painter_name'])) ? trim($_POST['painter_name']) : '';
            $painter_surname = (isset($_POST['painter_surname'])) ? trim($_POST['painter_surname']) : '';
            $image           = uploadImage($_FILES['painter_image']);
            $status          = (isset($_POST['status'])) ? intval($_POST['status']) : 0;
            // $category        = (isset($_POST['category_id'])) ? intval($_POST['category_id']) : 0;
            $category_list   = (isset($_POST['category_list'])) ? $_POST['category_list'] : [];
            $translation     = (isset($_POST['translation'])) ? $_POST['translation'] : [];

            $insert_painter  = "INSERT INTO `painters`(`painter_name`, `painter_surname`, `painter_image`,`status`) VALUES ('$painter_name','$painter_surname','$image','$status')";
            $result_insert   = mysqli_query($conn, $insert_painter);
            if ($result_insert) {
                $painter_id  = mysqli_insert_id($conn);
                foreach ($category_list as $key => $value) {
                    $insert_category   = "INSERT INTO `painters_to_category`(`painter_id`, `id`, `category_id`) VALUES ('$painter_id','$key','" . $value['category_id'] . "')";
                    mysqli_query($conn, $insert_category);
                }
                foreach ($translation as $key => $value) {
                    $insert_translation       = "INSERT INTO `painter_translation`(`painter_id`,`lang_id`,`about_painter`) VALUES ('$painter_id','$key','" . $value['about_painter'] . "')";
                    mysqli_query($conn, $insert_translation);
                }
            }
            header("Location: artists.php");
        } else if (isset($_POST['post-type']) and !empty($_POST['post-type']) and $_POST['post-type'] == 'edit') {
            $painter_name    = (isset($_POST['painter_name'])) ? trim($_POST['painter_name']) : '';
            $painter_surname = (isset($_POST['painter_surname'])) ? trim($_POST['painter_surname']) : '';

            if ($_POST['hidden'] == "0")
                $image  = uploadImage('../uploads/noPhoto.png');
            elseif (empty($_FILES['painter_image']['tmp_name']) || !is_uploaded_file($_FILES['painter_image']['tmp_name']))
                $image  = $painter_row['painter_image'];
            else
                $image  = uploadImage($_FILES['painter_image']);

            $status          = (isset($_POST['status'])) ? intval($_POST['status']) : 0;
            $category        = (isset($_POST['category_id'])) ? intval($_POST['category_id']) : 0;
            $translation     = (isset($_POST['translation'])) ? $_POST['translation'] : [];

            $update_painter  = "UPDATE `painters` SET `painter_name`='$painter_name', `painter_surname`='$painter_surname', `painter_image`='$image',`status`='$status' WHERE `id`=$painter_id";
            $result_update   = mysqli_query($conn, $update_painter);
            if ($result_update) {
                mysqli_query($conn, "DELETE FROM `painters_to_category` WHERE `painter_id`=$painter_id");
                $insert_category   = "INSERT INTO `painters_to_category`(`painter_id`, `category_id`) VALUES ('$painter_id','$category')";
                mysqli_query($conn, $insert_category);
                mysqli_query($conn, "DELETE FROM `painter_translation` WHERE `painter_id`=$painter_id");
                foreach ($translation as $key => $value) {
                    $insert_translation       = "INSERT INTO `painter_translation`(`painter_id`,`lang_id`,`about_painter`) VALUES ('$painter_id','$key','" . $value['about_painter'] . "')";
                    mysqli_query($conn, $insert_translation);
                }
            }
            header("Location: artists.php");
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
                            <h1 class="h3 mb-2 text-gray-800">Rəssam əlavə et</h1>
                            <br>
                            <form action="form-artist.php" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-4 form-section">
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">Rəssamın adı</label>
                                            <input type="text" name="painter_name" class="form-control" required id="exampleFormControlInput1" placeholder="Rəssamın adı">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">Rəssamın soyadı</label>
                                            <input type="text" name="painter_surname" class="form-control" required id="exampleFormControlInput1" placeholder="Rəssamın soyadı">
                                        </div>
                                        <div class="form-group img-section">
                                            <label for="exampleFormControlFile1">Şəkil</label>
                                            <input id="uploadImage-create" type="file" name="painter_image" class="form-control-file" id="exampleFormControlFile1" onchange="PreviewImageCreate();">
                                            <div class="delete-img" onclick="deleteImageCreate();"><i class="fas fa-trash"></i></div>
                                            <img class="preview-img img-thumbnail" id='previewImage-create' src="../uploads/noPhoto.png" alt="">

                                        </div>

                                        <div class="row">
                                            <div class="customer_records">
                                                <div class="form-group">
                                                    <label for="exampleFormControlSelect1">Kateqoriya</label>
                                                    <select class="form-control" name="category_list[<?= $row['id'] ?>][category_id]" id="exampleFormControlSelect1">
                                                        <option value="0">Seç</option>
                                                        <?php

                                                        $select_sql       = "SELECT * FROM orient_ressamlar.menu_translation mt 
                                                                          INNER JOIN orient_ressamlar.menu m ON mt.menu_id=m.id 
                                                                          WHERE `lang_id`=1 && `parent_id`>0 && `type`='painter'";
                                                        $result           = mysqli_query($conn, $select_sql);
                                                        while ($row1      = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                        ?>
                                                            <option value ="<?= $row1['menu_id']; ?>"><?= $row1['name']; ?></option>;
                                                        <?php
                                                        }
                                                        ?>
                                                    </select>
                                                </div>

                                                <a class="extra-fields-customer" href="#">Digər kateqoriya əlavə et</a>
                                            </div>

                                            <div class="customer_records_dynamic"></div>

                                        </div>

                                        <br><br>
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
                                                        <label for="exampleFormControlInput1">Haqqında məlumat</label>
                                                        <input type="text" name="translation[<?= $row['id'] ?>][about_painter]" required class="form-control" id="exampleFormControlInput1" placeholder="Haqqında">
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
                            <h1 class="h3 mb-2 text-gray-800">Rəssam məlumatlarını redaktə et</h1>
                            <br>
                            <form action="form-artist.php?id=<?= $painter_id; ?>" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-4 form-section">
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">Rəssamın adı</label>
                                            <input type="text" name="painter_name" class="form-control" required value="<?= $painter_row['painter_name']; ?>" id="exampleFormControlInput1" placeholder="Rəssamın adı">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">Rəssamın soyadı</label>
                                            <input type="text" name="painter_surname" class="form-control" required value="<?= $painter_row['painter_surname']; ?>" id="exampleFormControlInput1" placeholder="Rəssamın soyadı">
                                        </div>

                                        <div class="form-group img-section">
                                            <label for="exampleFormControlFile1">Şəkil</label>
                                            <input id="uploadImage" value="<?= $painter_row['painter_image']; ?>" type="file" name="painter_image" class="form-control-file" id="exampleFormControlFile1" onchange="PreviewImage();">
                                            <div class="delete-img" onclick="deleteImage();"><i class="fas fa-trash"></i></div>
                                            <input id="hiddenInput" type="hidden" name="hidden" value="1">
                                            <?php
                                            if (empty($painter_row['painter_image']))
                                                echo "<img id='previewImage' src='../uploads/noPhoto.png' class='img-thumbnail preview-img' alt=''>";
                                            else
                                                echo "<img id='previewImage' src='../uploads/" . $painter_row['painter_image'] . "' class='img-thumbnail preview-img' alt=''>";
                                            ?>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Kateqoriya</label>
                                            <select class="form-control" name="category_id" multiple id="exampleFormControlSelect1">
                                                <option value="0">Seç</option>
                                                <?php
                                                $select_sql  = "SELECT * FROM orient_ressamlar.menu_translation mt 
                                                                INNER JOIN orient_ressamlar.menu m ON mt.menu_id=m.id 
                                                                WHERE `lang_id`=1 && `parent_id`>0 && `type`='painter'";
                                                $result      = mysqli_query($conn, $select_sql);
                                                while ($rows = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                ?>
                                                    <option value="<?= $rows['menu_id']; ?>" <?php echo (in_array($rows['menu_id'], $selected_category)) ? 'selected' : ''; ?>><?= $rows['name']; ?></option>

                                                <?php
                                                }
                                                ?>

                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Status</label>
                                            <select class="form-control" name="status" id="exampleFormControlSelect1">
                                                <option value="0" <?php echo ($painter_row['status'] == 0) ? 'selected' : ''; ?>>Deaktiv</option>
                                                <option value="1" <?php echo ($painter_row['status'] == 1) ? 'selected' : ''; ?>>Aktiv</option>
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
                                            foreach ($painter_tr as $key => $value) {
                                            ?>
                                                <div class="tab-pane fade show <?php if ($value['code'] == 'az') echo 'active' ?>" id="nav-<?= $value['code']; ?>" role="tabpanel" aria-labelledby="nav-<?= $value['code']; ?>-tab">
                                                    <div class="form-group">
                                                        <label for="exampleFormControlInput1">Haqqında</label>
                                                        <input type="text" name="translation[<?= $value['lang_id'] ?>][about_painter]" required value="<?= $value['about_painter']; ?>" class="form-control" id="exampleFormControlInput1" placeholder="Haqqında">
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

                $('.extra-fields-customer').click(function() {
                $('.customer_records').clone().appendTo('.customer_records_dynamic');
                $('.customer_records_dynamic .customer_records').addClass('single remove');
                // $( ".customer_records_dynamic .customer_records:nth-child(2)" ).attr("name", "category_list[<?= $row['id'+1] ?>][category_id]");
                $('.single .extra-fields-customer').remove();
                $('.single').append('<a href="#" class="remove-field btn-remove-customer">Ləğv et</a>');
                $('.customer_records_dynamic > .single').attr("class", "remove");

                $('.customer_records_dynamic input').each(function() {
                    var count = 0;
                    var fieldname = $(this).attr("name");
                    $(this).attr('name', fieldname + count);
                    count++;
                });

            });

            $(document).on('click', '.remove-field', function(e) {
                $(this).parent('.remove').remove();
                e.preventDefault();
            });
        </script>


    </body>

    </html>

<?php
} else {
    header('Location: login.php');
}
?>