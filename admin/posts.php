<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';

    if (isset($_GET['ids']) and !empty($_GET['ids'])) {
        $post_id = intval($_GET['ids']);
        mysqli_query($conn, "DELETE FROM `posts` WHERE `id`=$post_id");
        mysqli_query($conn, "DELETE FROM `posts_translation` WHERE `post_id`=$post_id");
        mysqli_query($conn, "DELETE FROM `posts_gallery` WHERE `post_id`=$post_id");
        header('posts.php');
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

                        <h1 class="h3 mb-2 text-gray-800">Paylaşımların siyahısı</h1>
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Siyahı paylaşımlar</h6>
                            </div>
                            <div class="card-body">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                    <div class="row">
                                        <div class="create-button col-5">
                                            <a href="form-posts.php" class="btn btn-primary"><i class="fas fa-plus-square"></i></a>
                                        </div>
                                        <div class="form-group col-3">
                                            <form method="get" class="d-flex" action="posts.php">
                                                <select class="form-control" name="id" id="exampleFormControlSelect1">
                                                    <option value="" disabled selected>Kateqoriya seçin</option>
                                                    <?php
                                                    $select_sql  = "SELECT * FROM menu m
                                                                    INNER JOIN menu_translation mt ON m.id=mt.menu_id  
                                                                    WHERE m.type='post' && mt.lang_id=1 && m.parent_id>0";
                                                    $result      = mysqli_query($conn, $select_sql);
                                                    while ($row1 = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                    ?>
                                                        <option value="<?= $row1['id']; ?>"><?= $row1['name']; ?></option>;
                                                    <?php
                                                    }
                                                    ?>
                                                </select>
                                                <div class="input-group-btn">
                                                    <button class="btn btn-default" type="submit"><i class="far fa-check-circle"></i></button>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="input-group col-4">
                                            <form method="get" action="posts.php" class="d-flex">
                                                <input type="text" class="form-control" style="height: 40px;" placeholder="Axtarış" name="search">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-default" type="submit"><i class="fas fa-search"></i></button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                                <thead>
                                                    <tr role="row" style="text-align: center;">
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 180px;">Şəkil</th>
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Başlıq</th>
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Kateqoriya</th>
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 100px;">Qalereya</th>
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 100px;">Status</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 163px;">Əməliyyatlar</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    include '../config/config.php';
                                                    $page = isset($_GET['page']) ? $_GET['page'] : 1;
                                                    if (isset($_REQUEST['search'])) {
                                                        $name = $_GET['search'];;
                                                        $number_of_content = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM `posts` p INNER JOIN posts_translation pt ON p.id=pt.post_id WHERE p.lang_id=1 and pt.title like '" . $name . "%'"));
                                                    } elseif (isset($_REQUEST['id'])) {
                                                        $category = $_GET['id'];;
                                                        $number_of_content = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM `posts` WHERE category_id=$category"));
                                                    } else {
                                                        $number_of_content = mysqli_num_rows(mysqli_query($conn, 'SELECT `id` FROM `posts`'));
                                                    }
                                                    $limit = 5;
                                                    $lastpage = ceil($number_of_content / $limit);
                                                    $start = ($page - 1) * $limit;
                                                    if ($lastpage >= $page) {
                                                        if (isset($_REQUEST['search'])) {
                                                            $name = $_GET['search'];
                                                            $result = mysqli_query($conn, 'SELECT p.id as id_post, p.image, p.category_id, p.status as status_post, pt.*, mt.*, m.* FROM posts p 
                                                                                           INNER JOIN posts_translation pt ON pt.post_id=p.id
                                                                                           INNER JOIN menu_translation mt 
                                                                                           INNER JOIN menu m ON mt.menu_id=m.id 
                                                                                           WHERE pt.lang_id=1 && pt.title LIKE "' . $name . '%" && p.category_id=m.id && mt.lang_id=1 ORDER BY p.`id` desc LIMIT ' . $start . ',' . $limit);
                                                        } elseif (isset($_REQUEST['id'])) {
                                                            $category = $_GET['id'];
                                                            $result = mysqli_query($conn, "SELECT p.id as id_post, p.image, p.category_id, p.status as status_post, pt.*, mt.*, m.* FROM posts p 
                                                                                           INNER JOIN posts_translation pt ON pt.post_id=p.id
                                                                                           INNER JOIN menu_translation mt 
                                                                                           INNER JOIN menu m ON mt.menu_id=m.id 
                                                                                           WHERE pt.lang_id=1 && p.category_id=m.id && p.category_id='$category' && mt.lang_id=1 ORDER BY p.`id` desc LIMIT " . $start . ',' . $limit);
                                                        } else {
                                                            $result = mysqli_query($conn, 'SELECT p.id as id_post, p.image, p.category_id, p.status as status_post, pt.*, mt.*, m.* FROM posts p 
                                                                                           INNER JOIN posts_translation pt ON pt.post_id=p.id
                                                                                           INNER JOIN menu_translation mt 
                                                                                           INNER JOIN menu m ON mt.menu_id=m.id 
                                                                                           WHERE pt.lang_id=1 && p.category_id=m.id && mt.lang_id=1 ORDER BY p.`id` desc LIMIT ' . $start . ',' . $limit);
                                                        }
                                                        while ($row  = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                    ?>
                                                            <tr role="row" class="even">
                                                                <?php
                                                                if (empty($row['image']))
                                                                    echo "<td><img src='../uploads/noPhoto.png' class='img-thumbnail' width='200px' height='200px'></td>";
                                                                else
                                                                    echo "<td><img id='previewImage' src='../uploads/" . $row['image'] . "' class='img-thumbnail' width='200px' height='200px'></td>";
                                                                ?>
                                                                <td class="sorting_1"><?= $row['title']; ?></td>
                                                                <td class="sorting_1"><?= $row['name']; ?></td>
                                                                <td class="edit-buttons">
                                                                    <a href="gallery.php?post=<?= $row['id_post']; ?>" class="btn btn-secondary button-section d-block"><i class="far fa-images"></i></a>
                                                                </td>
                                                                <td class="edit-buttons align-middle">
                                                                    <form action="" method="get">
                                                                        <label class="switch button-section d-block">
                                                                            <input type="checkbox" data-onstyle="success" name="posts" data-offstyle="danger" id='<?php echo $row['id_post'] ?>' class="status-check" <?php echo $row['status_post'] == 1 ? 'checked' : '' ?> />
                                                                            <span class="slider round"></span>
                                                                        </label>
                                                                    </form>
                                                                </td>
                                                                <td class="edit-buttons">
                                                                    <div class="button-section">
                                                                        <a href="form-posts.php?id=<?= $row['id_post']; ?>" class="btn btn-success"><i class="fas fa-edit"></i></a>
                                                                        <a onclick="deleteItem(this);" data-id-number="<?= $row['id_post']; ?>" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        <?php
                                                        }
                                                        ?>
                                                </tbody>
                                            </table>
                                            <div class="text-center">
                                            <?php
                                                    }
                                                    if ($number_of_content > $limit) {
                                                        $x = 2;
                                                        if ($page > 1 && !isset($_REQUEST['search']) && !isset($_REQUEST['id'])) {
                                                            $previous = $page - 1;
                                                            echo '<a href="?page=' . $previous . '">« Öncəki </a>';
                                                        } elseif ($page > 1 && isset($_REQUEST['search'])) {
                                                            $previous = $page - 1;
                                                            echo '<a href="?search=' . $name . '&page=' . $previous . '">« Öncəki </a>';
                                                        } elseif ($page > 1 && isset($_REQUEST['id'])) {
                                                            $previous = $page - 1;
                                                            echo '<a href="?id=' . $category . '&page=' . $previous . '">« Öncəki </a>';
                                                        }
                                                        if ($page == 1) {
                                                            echo '<a>[1]</a>';
                                                        } elseif (isset($_REQUEST['search'])) {
                                                            echo '<a href="?search=' . $name . '&page=1" style= "margin-left: 10px;">1</a>';
                                                        } elseif (isset($_REQUEST['id'])) {
                                                            echo '<a href="?id=' . $category . '&page=1" style= "margin-left: 10px;">1</a>';
                                                        } else {
                                                            echo '<a href="?page=1" style= "margin-left: 10px;">1</a>';
                                                        }
                                                        if ($page - $x > 2) {
                                                            echo '...';
                                                            $i = $page - $x;
                                                        } else {
                                                            $i = 2;
                                                        }
                                                        for ($i; $i <= $page + $x; $i++) {
                                                            if ($i == $page) {
                                                                echo '&nbsp;<a style= "margin-left: 10px;">[' . $i . ']</a>&nbsp;';
                                                            } elseif (isset($_REQUEST['search'])) {
                                                                echo '<a href="?search=' . $name . '&page=' . $i . '" style= "margin-left: 10px;">' . $i . '</a>';
                                                            } elseif (isset($_REQUEST['id'])) {
                                                                echo '<a href="?id=' . $category . '&page=' . $i . '" style= "margin-left: 10px;">' . $i . '</a>';
                                                            } else {
                                                                echo '<a href="?page=' . $i . '" style= "margin-left: 10px;">' . $i . '</a>';
                                                            }
                                                            if ($i == $lastpage) break;
                                                        }
                                                        if ($page + $x < $lastpage - 1 && !isset($_REQUEST['search']) && !isset($_REQUEST['id'])) {
                                                            echo '...';
                                                            echo '<a href="?page=' . $lastpage . '" style= "margin-left: 10px;">' . $lastpage . '</a>';
                                                        } elseif ($page + $x == $lastpage - 1 && !isset($_REQUEST['search']) && !isset($_REQUEST['id'])) {
                                                            echo '<a href="?page=' . $lastpage . '" style= "margin-left: 10px;">' . $lastpage . '</a>';
                                                        } elseif ($page + $x == $lastpage - 1 && isset($_REQUEST['search'])) {
                                                            echo '<a href="?search=' . $name . '&page=' . $lastpage . '" style= "margin-left: 10px;">' . $lastpage . '</a>';
                                                        } elseif ($page + $x == $lastpage - 1 && isset($_REQUEST['id'])) {
                                                            echo '<a href="?id=' . $category . '&page=' . $lastpage . '" style= "margin-left: 10px;">' . $lastpage . '</a>';
                                                        }
                                                        if ($page < $lastpage && !isset($_REQUEST['search']) && !isset($_REQUEST['id'])) {
                                                            $next = $page + 1;
                                                            echo '<a href="?page=' . $next . '" style= "margin-left: 10px;"> Sonrakı » </a>';
                                                        } elseif ($page < $lastpage && isset($_REQUEST['search'])) {
                                                            $next = $page + 1;
                                                            echo '<a href="?search=' . $name . '&page=' . $next . '" style= "margin-left: 10px;"> Sonrakı » </a>';
                                                        } elseif ($page < $lastpage && isset($_REQUEST['id'])) {
                                                            $next = $page + 1;
                                                            echo '<a href="?id=' . $category . '&page=' . $next . '" style= "margin-left: 10px;"> Sonrakı » </a>';
                                                        }
                                                    }
                                            ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <?php include 'includes/content-footer.php'; ?>

            </div>
        </div>

        <?php include 'includes/footer.php'; ?>

    </body>
    <script>
        function deleteItem(id) {
            var thisId = id.getAttribute("data-id-number");
            var url = document.URL;
            if (url.includes("id=")) {
                var idCat = url.substring(url.lastIndexOf('id=') + 3);
            } else if (url.includes("search=")) {
                var search = url.substring(url.lastIndexOf('search=') + 7);
            }
            swal({
                    title: "Silmək istəyirsinizmi?",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                    buttons: ['Xeyr', 'Bəli'],
                })
                .then((result) => {
                    if (result) {
                        swal("Silindi", {
                            icon: "success",
                        });
                        if (url.includes("id=")) {
                            window.location.href = "posts.php?ids=" + thisId + "&id=" + idCat;
                        } else if (url.includes("search=")) {
                            window.location.href = "posts.php?ids=" + thisId + "&search=" + search;
                        } else {
                            window.location.href = "posts.php?ids=" + thisId;
                        }
                    } else {
                        swal("Silinmədi");
                    }
                });
        };
    </script>

    </html>

<?php
} else {
    header('Location: login.php');
}
?>