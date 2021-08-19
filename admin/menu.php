<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';

    if (isset($_GET['ids']) and !empty($_GET['ids'])) {
        $menu_id = intval($_GET['ids']);
        mysqli_query($conn, "DELETE FROM `menu` WHERE `id`=$menu_id");
        mysqli_query($conn, "DELETE FROM `menu_translation` WHERE `menu_id`=$menu_id");
        header('menu.php');
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

                        <h1 class="h3 mb-2 text-gray-800">Siyahı Menyu</h1>

                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Siyahı Menyu</h6>
                            </div>
                            <div class="card-body">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                    <div class="row">
                                        <div class="create-button col-8">
                                            <a href="form-menu.php" class="btn btn-primary"><i class="fas fa-plus-square"></i></a>
                                        </div>

                                        <div class="input-group col-4">
                                            <form method="get" action="menu.php" class="d-flex">
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
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Menyu adı</th>
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 355px;">Slug</th>
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 155px;">Tipi</th>
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 155px;">Status</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 163px;">Əməliyyatlar</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $page = isset($_GET['page']) ? $_GET['page'] : 1;
                                                    if (isset($_REQUEST['search'])) {
                                                        $name = $_GET['search'];
                                                        $number_of_content = mysqli_num_rows(mysqli_query($conn, "SELECT id FROM `menu` m
                                                                                                                  INNER JOIN `menu_translation` mt ON m.id=mt.menu_id
                                                                                                                  WHERE mt.lang_id=1 and mt.`name` like '" . $name . "%'"));
                                                    } else {
                                                        $number_of_content = mysqli_num_rows(mysqli_query($conn, 'SELECT `id` FROM `menu`'));
                                                    }
                                                    $limit = 7;
                                                    $lastpage = ceil($number_of_content / $limit);
                                                    $start = ($page - 1) * $limit;
                                                    if ($lastpage >= $page) {
                                                        if (isset($_REQUEST['search'])) {
                                                            $name = $_GET['search'];
                                                            $result = mysqli_query($conn, "SELECT * FROM menu_translation mt 
                                                                                           INNER JOIN menu m ON mt.menu_id=m.id 
                                                                                           Where mt.lang_id=1 and mt.name like '" . $name . "%' ORDER BY m.`id` desc LIMIT " . $start . ',' . $limit);
                                                        } else {
                                                            $result = mysqli_query($conn, 'SELECT * FROM menu_translation mt 
                                                                                           INNER JOIN menu m ON mt.menu_id=m.id 
                                                                                           Where mt.lang_id=1 order by m.`id` desc LIMIT ' . $start . ',' . $limit);
                                                        }
                                                        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                    ?>
                                                            <tr role="row" class="even">
                                                                <td class="sorting_1"><?= $row['name']; ?></td>
                                                                <td class="sorting_1"><?= $row['slug']; ?></td>
                                                                <td class="sorting_1"><?= $row['type']; ?></td>
                                                                <td class="edit-buttons text-center align-middle">
                                                                    <form action="" method="get">
                                                                        <label class="switch button-section d-block">
                                                                            <input type="checkbox" data-onstyle="success" name="menu" data-offstyle="danger" id='<?php echo $row['id'] ?>' class="status-check" <?php echo $row['status'] == 1 ? 'checked' : '' ?> />
                                                                            <span class="slider round"></span>
                                                                        </label>
                                                                    </form>
                                                                </td>
                                                                <td class="edit-buttons">
                                                                    <div class="button-section">
                                                                        <a href="form-menu.php?id=<?= $row['id']; ?>" class="btn btn-success"><i class="fas fa-edit"></i></a>
                                                                        <a onclick="deleteItem(this);" data-id-number="<?= $row['id']; ?>" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
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
                                                        if ($page > 1 && !isset($_REQUEST['search'])) {
                                                            $previous = $page - 1;
                                                            echo '<a href="?page=' . $previous . '">« Öncəki </a>';
                                                        } elseif ($page > 1 && isset($_REQUEST['search'])) {
                                                            $previous = $page - 1;
                                                            echo '<a href="?search=' . $name . '&page=' . $previous . '">« Öncəki </a>';
                                                        }
                                                        if ($page == 1) {
                                                            echo '<a>[1]</a>';
                                                        } elseif (isset($_REQUEST['search'])) {
                                                            echo '<a href="?search=' . $name . '&page=1" style= "margin-left: 10px;">1</a>';
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
                                                            } else {
                                                                echo '<a href="?page=' . $i . '" style= "margin-left: 10px;">' . $i . '</a>';
                                                            }
                                                            if ($i == $lastpage) break;
                                                        }
                                                        if ($page + $x < $lastpage - 1 && !isset($_REQUEST['search'])) {
                                                            echo '...';
                                                            echo '<a href="?page=' . $lastpage . '" style= "margin-left: 10px;">' . $lastpage . '</a>';
                                                        } elseif ($page + $x == $lastpage - 1 && !isset($_REQUEST['search'])) {
                                                            echo '<a href="?page=' . $lastpage . '" style= "margin-left: 10px;">' . $lastpage . '</a>';
                                                        } elseif ($page + $x == $lastpage - 1 && isset($_REQUEST['search'])) {
                                                            echo '<a href="?search=' . $name . '&page=' . $lastpage . '" style= "margin-left: 10px;">' . $lastpage . '</a>';
                                                        }
                                                        if ($page < $lastpage && !isset($_REQUEST['search'])) {
                                                            $next = $page + 1;
                                                            echo '<a href="?page=' . $next . '" style= "margin-left: 10px;"> Sonrakı » </a>';
                                                        } elseif ($page < $lastpage && isset($_REQUEST['search'])) {
                                                            $next = $page + 1;
                                                            echo '<a href="?search=' . $name . '&page=' . $next . '" style= "margin-left: 10px;"> Sonrakı » </a>';
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
                var url = document.URL;
                if (url.includes("search=")) {
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
                            if (url.includes("search=")) {
                                window.location.href = "menu.php?ids=" + thisId + "&search=" + search;
                            } else {
                                window.location.href = "menu.php?ids=" + thisId;
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