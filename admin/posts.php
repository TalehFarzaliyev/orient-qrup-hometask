<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';

    if (isset($_GET['id']) and !empty($_GET['id'])) {
        $post_id = intval($_GET['id']);
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
                                    <div class="create-button">
                                        <a href="form-posts.php" class="btn btn-primary"><i class="fas fa-plus-square"></i></a>
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
                                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 163px;">Əməliyyatlar</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    include '../config/config.php';
                                                    $page = isset($_GET['page']) ? $_GET['page'] : 1;
                                                    $number_of_content = mysqli_num_rows(mysqli_query($conn, 'SELECT `id` FROM `posts`'));
                                                    $limit = 5;
                                                    $lastpage = ceil($number_of_content / $limit);
                                                    $start = ($page - 1) * $limit;
                                                    if ($lastpage >= $page) {
                                                        $result = mysqli_query($conn, 'SELECT p.id as id_post, p.image, p.category_id, pt.*, mt.*, m.* FROM orient_ressamlar.posts p 
                                                                                       INNER JOIN orient_ressamlar.posts_translation pt ON pt.post_id=p.id
                                                                                       INNER JOIN orient_ressamlar.menu_translation mt 
                                                                                       INNER JOIN orient_ressamlar.menu m ON mt.menu_id=m.id 
                                                                                       WHERE pt.lang_id=1 && p.status=1 && p.category_id=m.id && mt.lang_id=1 ORDER BY p.`id` desc LIMIT ' . $start . ',' . $limit);
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
                                                                <td class="sorting_1 edit-buttons">
                                                                    <a href="gallery.php?post=<?= $row['id_post']; ?>" class="btn btn-secondary button-section d-block"><i class="far fa-images"></i></a>
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
                                                        if ($page > 1) {
                                                            $previous = $page - 1;
                                                            echo '<a href="?page=' . $previous . '">« Öncəki </a>';
                                                        }
                                                        if ($page == 1) {
                                                            echo '<a>[1]</a>';
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
                                                            } else {
                                                                echo '<a href="?page=' . $i . '" style= "margin-left: 10px;">' . $i . '</a>';
                                                            }
                                                            if ($i == $lastpage) break;
                                                        }
                                                        if ($page + $x < $lastpage - 1) {
                                                            echo '...';
                                                            echo '<a href="?page=' . $lastpage . '" style= "margin-left: 10px;">' . $lastpage . '</a>';
                                                        } elseif ($page + $x == $lastpage - 1) {
                                                            echo '<a href="?page=' . $lastpage . '" style= "margin-left: 10px;">' . $lastpage . '</a>';
                                                        }
                                                        if ($page < $lastpage) {
                                                            $next = $page + 1;
                                                            echo '<a href="?page=' . $next . '" style= "margin-left: 10px;"> Sonrakı » </a>';
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
                        window.location.href = "posts.php?id=" + thisId;
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