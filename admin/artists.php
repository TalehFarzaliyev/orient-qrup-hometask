<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';
    if (isset($_GET['ids']) and !empty($_GET['ids'])) {
        $painter_id = intval($_GET['ids']);
        mysqli_query($conn, "DELETE FROM `painters` WHERE `id`=$painter_id");
        mysqli_query($conn, "DELETE FROM `painter_translation` WHERE `painter_id`=$painter_id");
        mysqli_query($conn, "DELETE w, wt FROM works w INNER JOIN works_translation wt ON w.id=wt.work_id WHERE w.painter_id = $painter_id");
        header('artists.php');
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

                        <h1 class="h3 mb-2 text-gray-800">Rəssamların siyahısı</h1>
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Siyahı Rəssamlar</h6>
                            </div>
                            <div class="card-body">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                    <div class="row">
                                        <div class="create-button col-5">
                                            <a href="form-artist.php" class="btn btn-primary"><i class="fas fa-plus-square"></i></a>
                                        </div>
                                        <div class="form-group col-3">
                                            <form method="get" class="d-flex" action="artists.php">
                                                <select class="form-control" name="id" id="exampleFormControlSelect1">
                                                    <option value="" disabled selected>Kateqoriya seçin</option>
                                                    <?php
                                                    $select_sql  = "SELECT * FROM menu m
                                                                    INNER JOIN menu_translation mt ON m.id=mt.menu_id  
                                                                    WHERE m.type='painter' && mt.lang_id=1 && m.parent_id>0 && `status`=1";
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
                                            <form method="get" action="artists.php" class="d-flex">
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
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Rəssamın adı</th>
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Kateqoriya</th>
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 100px;">Əsərləri</th>
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
                                                        $number_of_content = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM `painters` WHERE painter_name like '" . $name . "%'"));
                                                    } elseif (isset($_REQUEST['id'])) {
                                                        $category = $_GET['id'];;
                                                        $number_of_content = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM `painters` WHERE categories like '%$category%'"));
                                                    } else {
                                                        $number_of_content = mysqli_num_rows(mysqli_query($conn, 'SELECT `id` FROM `painters`'));
                                                    }
                                                    $limit = 5;
                                                    $lastpage = ceil($number_of_content / $limit);
                                                    $start = ($page - 1) * $limit;
                                                    if ($lastpage >= $page) {
                                                        if (isset($_REQUEST['search'])) {
                                                            $name = $_GET['search'];
                                                            $result = mysqli_query($conn, "SELECT p.painter_name, p.id as artist_id, p.painter_surname, p.painter_image, p.categories, p.status as status_painter, pt.*, mt.* FROM painters p 
                                                                                           INNER JOIN painter_translation pt ON pt.painter_id=p.id
                                                                                           INNER JOIN menu_translation mt 
                                                                                           WHERE pt.lang_id=1 && mt.lang_id=1 && p.painter_name like '" . $name . "%' && p.categories=mt.menu_id ORDER BY p.`id` desc LIMIT " . $start . ',' . $limit);
                                                        } elseif (isset($_REQUEST['id'])) {
                                                            $category = $_GET['id'];
                                                            $result = mysqli_query($conn, "SELECT p.painter_name, p.id as artist_id, p.painter_surname, p.painter_image, p.categories, p.status as status_painter, pt.*, mt.* FROM painters p 
                                                                                           INNER JOIN painter_translation pt ON pt.painter_id=p.id
                                                                                           INNER JOIN menu_translation mt 
                                                                                           WHERE pt.lang_id=1 && mt.lang_id=1 && p.categories like '%$category%' && p.categories=mt.menu_id ORDER BY p.`id` desc LIMIT " . $start . ',' . $limit);
                                                        } else {
                                                            $result = mysqli_query($conn, 'SELECT p.painter_name, p.id as artist_id, p.painter_surname, p.painter_image, p.categories, p.status as status_painter, pt.*, mt.* FROM painters p 
                                                                                           INNER JOIN painter_translation pt ON pt.painter_id=p.id
                                                                                           INNER JOIN menu_translation mt 
                                                                                           WHERE pt.lang_id=1 && mt.lang_id=1 && p.categories=mt.menu_id ORDER BY p.`id` desc LIMIT ' . $start . ',' . $limit);
                                                        }
                                                        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                    ?>
                                                            <tr role="row" class="even">
                                                                <?php
                                                                if (empty($row['painter_image']))
                                                                    echo "<td><img src='../uploads/noPhoto.png' class='img-thumbnail' width='200px' height='200px'></td>";
                                                                else
                                                                    echo "<td><img id='previewImage' src='../uploads/" . $row['painter_image'] . "' class='img-thumbnail' width='200px' height='200px'></td>";
                                                                ?>
                                                                <td class="sorting_1"><?= $row['painter_name']; ?> <?= $row['painter_surname']; ?></td>
                                                                <td class="sorting_1">
                                                                    <?php
                                                                    $list = $row['categories'];
                                                                    $new = explode(',', $list);
                                                                    foreach ($new as $key) {
                                                                        $sql_category    = "SELECT `name` FROM menu_translation WHERE menu_id='$key'";
                                                                        $category_result = mysqli_query($conn, $sql_category);
                                                                        $row_category    = mysqli_fetch_array($category_result, MYSQLI_ASSOC);
                                                                    ?>
                                                                        <?= $row_category['name']; ?>,
                                                                    <?php
                                                                    }
                                                                    ?>
                                                                </td>
                                                                <td class="sorting_1 edit-buttons">
                                                                    <a href="works.php?painter=<?= $row['artist_id']; ?>" class="btn btn-secondary button-section d-block"><i class="far fa-images"></i></a>
                                                                </td>
                                                                <td class="edit-buttons text-center align-middle">
                                                                    <form action="" method="get">
                                                                        <label class="switch button-section d-block">
                                                                            <input type="checkbox" name="painters" data-onstyle="success" data-offstyle="danger" id='<?php echo $row['artist_id'] ?>' class="status-check" <?php echo $row['status_painter'] == 1 ? 'checked' : '' ?> />
                                                                            <span class="slider round"></span>
                                                                        </label>
                                                                    </form>
                                                                </td>
                                                                <td class="edit-buttons">
                                                                    <div class="button-section">
                                                                        <a href="form-artist.php?id=<?= $row['artist_id']; ?>" class="btn btn-success"><i class="fas fa-edit"></i></a>
                                                                        <a onclick="deleteItem(this);" data-id-number="<?= $row['artist_id']; ?>" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
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
        <script>
            function deleteItem(id) {
                var thisId = id.getAttribute("data-id-number");
                var url    = document.URL;
                if (url.includes("id=")) {
                    var idCat  = url.substring(url.lastIndexOf('id=') + 3);
                } else if(url.includes("search=")) {
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
                                window.location.href = "artists.php?ids=" + thisId + "&id=" + idCat;
                            } else if(url.includes("search=")) {
                                window.location.href = "artists.php?ids=" + thisId + "&search=" + search;
                            } else {
                                window.location.href = "artists.php?ids=" + thisId;
                            }
                        } else {
                            swal("Silinmədi");
                        }
                    });
            };
        </script>
    </body>

    </html>

<?php
} else {
    header('Location: login.php');
}
?>