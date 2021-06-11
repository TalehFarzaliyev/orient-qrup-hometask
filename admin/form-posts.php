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
                          INNER JOIN posts_translation pt ON lang.id=pt.lang_id WHERE pt.post_id=$post_id";
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
            $image         = uploadImage($_FILES['image']);
            $category      = (isset($_POST['category_id'])) ? intval($_POST['category_id']) : 0;
            $status        = (isset($_POST['status'])) ? intval($_POST['status']) : 0;
            $translation   = (isset($_POST['translation'])) ? $_POST['translation'] : [];

            $insert_post   = "INSERT INTO `posts`(`image`, `category_id`, `status`) VALUES ('$image', '$category', '$status')";
            $result_insert = mysqli_query($conn, $insert_post);
            if ($result_insert) {
                $post_id   = mysqli_insert_id($conn);
                foreach ($translation as $key => $value) {
                    $insert_translation       = "INSERT INTO `posts_translation`(`post_id`,`lang_id`,`title`, `content`) VALUES ('$post_id','$key','" . $value['title'] . "', '" . $value['content'] . "')";
                    mysqli_query($conn, $insert_translation);
                }
            }
            header("Location: posts.php");
        } else if (isset($_POST['post-type']) and !empty($_POST['post-type']) and $_POST['post-type'] == 'edit') {

            if ($_POST['hidden'] == "0")
                $image     = 'noPhoto.png';
            elseif (empty($_FILES['image']['tmp_name']) || !is_uploaded_file($_FILES['image']['tmp_name']))
                $image     = $post_row['image'];
            else
                $image     = uploadImage($_FILES['image']);

            $status        = (isset($_POST['status'])) ? intval($_POST['status']) : 0;
            $category      = (isset($_POST['category_id'])) ? intval($_POST['category_id']) : 0;
            $translation   = (isset($_POST['translation'])) ? $_POST['translation'] : [];

            $update_post   = "UPDATE `posts` SET `image`='$image', `category_id`='$category', `status`='$status' WHERE `id`=$post_id";
            $result_update = mysqli_query($conn, $update_post);
            if ($result_update) {
                mysqli_query($conn, "DELETE FROM `posts_translation` WHERE `post_id`=$post_id");
                foreach ($translation as $key => $value) {
                    $insert_translation       = "INSERT INTO `posts_translation`(`post_id`,`lang_id`, `title`, `content`) VALUES ('$post_id','$key','" . $value['title'] . "','" . $value['content'] . "')";
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

        <div id="wrapper">

            <?php include 'includes/sidebar.php'; ?>

            <div id="content-wrapper" class="d-flex flex-column">

                <div id="content">

                    <?php include 'includes/topbar.php'; ?>

                    <div class="container-fluid">
                        <?php
                        if ($post_type == 'create') {
                        ?>
                            <h1 class="h3 mb-2 text-gray-800">Post əlavə et</h1>
                            <br>
                            <form action="form-posts.php" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-4 form-section">
                                        <br>
                                        <div class="form-group img-section">
                                            <label for="exampleFormControlFile1">Şəkil</label>
                                            <input id="uploadImage-create" type="file" name="image" class="form-control-file" id="exampleFormControlFile1" onchange="PreviewImageCreate();">
                                            <div class="delete-img" onclick="deleteImageCreate();"><i class="fas fa-trash"></i></div>
                                            <img class="preview-img img-thumbnail" id='previewImage-create' src="../uploads/noPhoto.png" alt="">

                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="exampleFormControlSelect1">Kateqoriya</label>
                                                <select class="form-control" name="category_id" id="exampleFormControlSelect1">
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
                                                        <label for="exampleFormControlInput1">Başlıq</label>
                                                        <input type="text" name="translation[<?= $row['id'] ?>][title]" required class="form-control" id="exampleFormControlInput1" placeholder="Başlıq">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleFormControlInput1">Məzmun</label>
                                                        <textarea name="translation[<?= $row['id'] ?>][content]" cols="40" rows="10" required class="form-control editor" id="editor<?= $row['id'] ?>" placeholder="Məzmun" style="visibility:hidden; display: none;"></textarea>
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
                            <h1 class="h3 mb-2 text-gray-800">Postu redaktə et</h1>
                            <br>
                            <form action="form-posts.php?id=<?= $post_id; ?>" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-4 form-section">
                                        <br>
                                        <div class="form-group img-section">
                                            <label for="exampleFormControlFile1">Şəkil</label>
                                            <input id="uploadImage" value="<?= $post_row['image']; ?>" type="file" name="image" class="form-control-file" id="exampleFormControlFile1" onchange="PreviewImage();">
                                            <div class="delete-img" onclick="deleteImage();"><i class="fas fa-trash"></i></div>
                                            <input id="hiddenInput" type="hidden" name="hidden" value="1">
                                            <?php
                                            if (empty($post_row['image']))
                                                echo "<img id='previewImage' src='../uploads/noPhoto.png' class='img-thumbnail preview-img' alt=''>";
                                            else
                                                echo "<img id='previewImage' src='../uploads/" . $post_row['image'] . "' class='img-thumbnail preview-img' alt=''>";
                                            ?>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Kateqoriya</label>
                                            <select class="form-control" name="category_id" id="exampleFormControlSelect1">
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
                                                        <input type="text" name="translation[<?= $value['lang_id'] ?>][title]" required value="<?= $value['title']; ?>" class="form-control" id="exampleFormControlInput1" placeholder="Başlıq">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleFormControlInput1">Məzmun</label>
                                                        <textarea name="translation[<?= $value['lang_id'] ?>][content]" cols="40" rows="10" required class="form-control editor" id="editor<?= $value['lang_id'] ?>" placeholder="Məzmun" style="visibility:hidden; display: none;"><?= $value['content']; ?></textarea>
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
            var id=1;
            $('textarea.editor').each(function() {
                $(this).attr("id", "editor"+id);
                CKEDITOR.replace('editor'+id, {
                    height: '300px',

                });
                id=id+1;
            });

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