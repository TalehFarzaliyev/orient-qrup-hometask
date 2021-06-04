<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';
    include 'functions/functions.php';

    $post_type = (isset($_GET['id'])) ? 'edit' : 'create';
    $post_id = (isset($_GET['id'])) ? intval($_GET['id']) : 0;
    if (!empty($post_id)) {
        $sql           = "SELECT * FROM `posts` WHERE `id`=$post_id";
        $sql_tr        = "SELECT * FROM languages lang
                          INNER JOIN post_translation pt ON lang.id=pt.lang_id WHERE pt.post_id=$post_id";
        $result        = mysqli_query($conn, $sql);
        $post_row      = mysqli_fetch_assoc($result);
        $result_tr     = mysqli_query($conn, $sql_tr);
        $post_tr       = mysqli_fetch_all($result_tr, MYSQLI_ASSOC);
    } else {
        $post_row      = [];
        $post_tr       = [];
    }

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        if (isset($_POST['post-type']) and !empty($_POST['post-type']) and $_POST['post-type'] == 'create') {
            $post_image           = uploadImage($_FILES['post_image']);
            $category             = (isset($_POST['category_id'])) ? intval($_POST['category_id']) : 0;
            $status               = (isset($_POST['status'])) ? intval($_POST['status']) : 0;
            $translation     = (isset($_POST['translation'])) ? $_POST['translation'] : [];

            $insert_posts = "INSERT INTO `posts`(`post_image`, `category_id`, `status`) VALUES ('$post_image','$category','$status')";
            $result_insert   = mysqli_query($conn, $insert_posts);
            if ($result_insert) {
                $post_id  = mysqli_insert_id($conn);
                foreach ($translation as $key => $value) {
                    $insert_translation       = "INSERT INTO `post_translation`(`post_id`,`lang_id`,`post_title`, `post_content`, `slug`) VALUES ('$post_id','$key','" . $value['post_title'] . "', '" . $value['post_content'] . "', '" . $value['slug'] . "')";
                    mysqli_query($conn, $insert_translation);
                }
            }
            header("Location: posts.php");
        } else if (isset($_POST['post-type']) and !empty($_POST['post-type']) and $_POST['post-type'] == 'edit') {

            if ($_POST['hidden'] == "0")
                $image  = uploadImage('../uploads/noPhoto.png');
            elseif (empty($_FILES['post_image']['tmp_name']) || !is_uploaded_file($_FILES['post_image']['tmp_name']))
                $image  = $post_row['post_image'];
            else
                $image  = uploadImage($_FILES['post_image']);

            $status          = (isset($_POST['status'])) ? intval($_POST['status']) : 0;
            $category        = (isset($_POST['category_id'])) ? intval($_POST['category_id']) : 0;
            $translation     = (isset($_POST['translation'])) ? $_POST['translation'] : [];

            $update_posts = "UPDATE `posts` SET `post_image`='$image', `category_id`='$category', `status`='$status', WHERE `id`=$post_id";
            $result_update   = mysqli_query($conn, $update_posts);
            if ($result_update) {
                mysqli_query($conn, "DELETE FROM `post_translation` WHERE `post_id`=$post_id");
                foreach ($translation as $key => $value) {
                    $insert_translation       = "INSERT INTO `post_translation`(`post_id`,`lang_id`,`post_title`,`post_content`,`slug`) VALUES ('$post_id','$key','" . $value['post_title'] . "', '" . $value['post_content'] . "', '" . $value['slug'] . "')";
                    mysqli_query($conn, $insert_translation);
                }
            }

            header("Location: posts.php");
        }
    }

?>

    <!DOCTYPE html>
    <html lang="en">

    <?php include 'includes/head.php'; ?>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <?php include 'includes/sidebar.php'; ?>

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <?php include 'includes/topbar.php'; ?>
                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <?php
                        if ($post_type == 'create') {
                        ?>
                            <h1 class="h3 mb-2 text-gray-800">Post əlavə et</h1>
                            <br>
                            <form action="form-posts.php" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-12 form-section">
                                        <br>
                                        <div class="create_news" style="display:flex; justify-content:space-between">
                                            <h5></h5>

                                        </div>
                                        <div class="form-groupsss">
                                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"><img src="../uploads/planet-earth.png" style="width: 15px; height:15px;">Tərcümə</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false"><img src="../uploads/photo.png" style="width: 15px; height:15px;">Ümumi Məlumat</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content" id="myTabContent">
                                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
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
                                                                    <label for="exampleFormControlInput1">Başlıq</label>
                                                                    <input type="text" name="translation[<?= $row['id'] ?>][post_title]" class="form-control" id="exampleFormControlInput1" placeholder="Postun adı">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="exampleFormControlInput1">Məzmun</label>
                                                                    <input type="text" name="translation[<?= $row['id'] ?>][post_content]" class="form-control" id="exampleFormControlInput1" placeholder="Mətni daxil edin">
                                                                </div>
                                                            </div>
                                                        <?php
                                                        }
                                                        ?>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">

                                                    <div class="form-group img-section" >
                                                        <label for="exampleFormControlFile1">Şəkil</label>
                                                        <input id="uploadImage" type="file" name="post_image" class="form-control-file" id="exampleFormControlFile1"  onchange="PreviewImage();">
                                                        <div class="delete-img" onclick="deleteImage();"><i class="fas fa-trash"></i></div>
                                                        <input id="hiddenInput" type="hidden" name="hidden" value="1">
                                                        <?php
                                                        if (empty($post_row['post_image']))
                                                            echo "<img id='previewImage' src='../uploads/noPhoto.png' class='img-thumbnail preview-img' alt='' style='width:400px; height:300px;'>";
                                                        else
                                                            echo "<img id='previewImage' src='../uploads/" . $post_row['post_image'] . "' class='img-thumbnail preview-img' alt=''>";
                                                        ?>

                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group">
                                                            <label for="exampleFormControlSelect1">Kateqoriya</label>
                                                            <select class="form-control" name="category_id" id="exampleFormControlSelect1">
                                                                <option value="0">Seç</option>
                                                                <?php
                                                                $select_sql       = "SELECT * FROM orient_ressamlar.menu_translation mt 
                                                                         INNER JOIN orient_ressamlar.menu m ON mt.menu_id=m.id 
                                                                         WHERE `lang_id`=1 && `parent_id`>0 && `type`='post'";
                                                                $result           = mysqli_query($conn, $select_sql);
                                                                while ($row1      = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                                ?>
                                                                    <option value="<?= $row1['menu_id']; ?>"><?= $row1['name']; ?></option>;
                                                                <?php
                                                                }
                                                                ?>
                                                            </select>
                                                        </div>
                                                    </div>


                                                </div>
                                                <br><br>
                                                <div class="form-group">
                                                    <label for="exampleFormControlSelect1">Status</label>
                                                    <select class="form-control" name="status" id="exampleFormControlSelect1">
                                                        <option value="0">Deaktiv</option>
                                                        <option selected value="1">Aktiv</option>
                                                    </select>
                                                </div>
                                                <div>

                                                    <input type="hidden" name="post-type" value="<?= $post_type; ?>">
                                                    <div class="form-group">
                                                        <button type="submit" name="submit" value="submit" class="btn btn-primary save-button">Yadda saxla</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                        <?php
                        } else if ($post_type == 'edit') {

                        ?>
                            <h1 class="h3 mb-2 text-gray-800">Postu redaktə et</h1>
                            <br>
                            <form action="form-posts.php?id=<?= $post_id; ?>" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-4 form-section">
                                        <br>
                                        <div class="form-group img-section">
                                            <label for="exampleFormControlFile1">Şəkil</label>
                                            <input id="uploadImage" value="<?= $post_row['post_image']; ?>" type="file" name="post_image" class="form-control-file" id="exampleFormControlFile1" onchange="PreviewImage();">
                                            <div class="delete-img" onclick="deleteImage();"><i class="fas fa-trash"></i></div>
                                            <input id="hiddenInput" type="hidden" name="hidden" value="1">
                                            <?php
                                            if (empty($post_row['post_image']))
                                                echo "<img id='previewImage' src='../uploads/noPhoto.png' class='img-thumbnail preview-img' alt=''>";
                                            else
                                                echo "<img id='previewImage' src='../uploads/" . $post_row['post_image'] . "' class='img-thumbnail preview-img' alt=''>";
                                            ?>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="exampleFormControlSelect1">Kateqoriya</label>
                                                <select class="form-control" name="category_id" id="exampleFormControlSelect1">
                                                    <option value="0">Seç</option>
                                                    <?php
                                                    $select_sql  = "SELECT * FROM orient_ressamlar.menu_translation mt 
                                                                INNER JOIN orient_ressamlar.menu m ON mt.menu_id=m.id 
                                                                WHERE `lang_id`=1 && `parent_id`>0 && `type`='post'";
                                                    $result      = mysqli_query($conn, $select_sql);
                                                    while ($rows = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                    ?>
                                                        <option value="<?= $rows['menu_id']; ?>" <?php echo ($post_row['category_id'] == $rows['menu_id']) ? 'selected' : ''; ?>><?= $rows['name']; ?></option>

                                                    <?php
                                                    }
                                                    ?>

                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Status</label>
                                            <select class="form-control" name="status" id="exampleFormControlSelect1">
                                                <option value="0" <?php echo ($post_row['status'] == 0) ? 'selected' : ''; ?>>Deaktiv</option>
                                                <option value="1" <?php echo ($post_row['status'] == 1) ? 'selected' : ''; ?>>Aktiv</option>
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
                                            foreach ($post_tr as $key => $value) {
                                            ?>
                                                <div class="tab-pane fade show <?php if ($value['code'] == 'az') echo 'active' ?>" id="nav-<?= $value['code']; ?>" role="tabpanel" aria-labelledby="nav-<?= $value['code']; ?>-tab">
                                                    <div class="form-group">
                                                        <label for="exampleFormControlInput1">Başlıq</label>
                                                        <input type="text" name="translation[<?= $value['lang_id'] ?>][post_title]" required value="<?= $value['post_title']; ?>" class="form-control" id="exampleFormControlInput1">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleFormControlInput1">Məzmun</label>
                                                        <input type="text" name="translation[<?= $value['lang_id'] ?>][post_content]" required value="<?= $value['post_content']; ?>" class="form-control" id="exampleFormControlInput1">
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