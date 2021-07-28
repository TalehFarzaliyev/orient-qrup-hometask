<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';

    if (isset($_GET['ids']) and !empty($_GET['ids'])) {
        $sales_id = intval($_GET['ids']);
        mysqli_query($conn, "DELETE FROM `sales` WHERE `id`=$sales_id");
        mysqli_query($conn, "DELETE FROM `sales_translation` WHERE `sales_id`=$sales_id");
        header('sales.php');
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

                        <h1 class="h3 mb-2 text-gray-800">Satış siyahısı</h1>
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Satış</h6>
                            </div>
                            <div class="card-body">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                    <div class="row">
                                        <div class="create-button col-5">
                                            <a href="form-sales.php" class="btn btn-primary"><i class="fas fa-plus-square"></i></a>
                                        </div>
                                        <div class="form-group col-3">
                                            <form method="get" class="d-flex" action="sales.php">
                                                <select class="form-control" name="id" id="exampleFormControlSelect1">
                                                    <option value="" disabled selected>Rəssam seçin</option>
                                                    <?php
                                                    $select_sql  = "SELECT * FROM orient_ressamlar.painters
                                                                    WHERE `status`=1";
                                                    $result      = mysqli_query($conn, $select_sql);
                                                    while ($row1 = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                    ?>
                                                        <option value="<?= $row1['id']; ?>"><?= $row1['painter_name']; ?> <?= $row1['painter_surname']; ?></option>;
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
                                            <form method="get" action="sales.php" class="d-flex">
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
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Məhsulun adı</th>
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Rəssamın adı</th>
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Qiyməti</th>
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Ölçüsü</th>
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Texnikası</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 163px;">Əməliyyatlar</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    include '../config/config.php';
                                                    $page = isset($_GET['page']) ? $_GET['page'] : 1;
                                                    if (isset($_REQUEST['search'])) {
                                                        $name = $_GET['search'];;
                                                        $number_of_content = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM `sales` s INNER JOIN sales_translation st ON s.id=st.sales_id WHERE `status`=1 and lang_id=1 and `name` like '" . $name . "%'"));
                                                    } elseif (isset($_REQUEST['id'])) {
                                                        $category = $_GET['id'];;
                                                        $number_of_content = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM `sales` WHERE `status`=1 and painter_id=$category"));
                                                    } else {
                                                        $number_of_content = mysqli_num_rows(mysqli_query($conn, 'SELECT `id` FROM `sales` WHERE `status`=1'));
                                                    }
                                                    $limit = 5;
                                                    $lastpage = ceil($number_of_content / $limit);
                                                    $start = ($page - 1) * $limit;
                                                    if ($lastpage >= $page) {
                                                        if (isset($_REQUEST['search'])) {
                                                            $name = $_GET['search'];
                                                            $result = mysqli_query($conn, "SELECT s.id as id_sales, s.painter_id, s.image, s.price, s.status, st.*, p.* FROM orient_ressamlar.sales s 
                                                                                           INNER JOIN orient_ressamlar.sales_translation st ON st.sales_id=s.id
                                                                                           INNER JOIN orient_ressamlar.painters p ON p.id=s.painter_id
                                                                                           Where st.lang_id=1 and st.name LIKE '" . $name . "%' && s.status=1 ORDER BY s.`id` desc LIMIT " . $start . ',' . $limit);
                                                        } elseif (isset($_REQUEST['id'])) {
                                                            $category = $_GET['id'];
                                                            $result = mysqli_query($conn, "SELECT s.id as id_sales, s.painter_id, s.image, s.price, s.status, st.*, p.* FROM orient_ressamlar.sales s 
                                                                                           INNER JOIN orient_ressamlar.sales_translation st ON st.sales_id=s.id
                                                                                           INNER JOIN orient_ressamlar.painters p ON p.id=s.painter_id
                                                                                           Where st.lang_id=1 and s.status=1 && s.painter_id=$category ORDER BY s.`id` desc LIMIT " . $start . ',' . $limit);
                                                        } else {
                                                            $result = mysqli_query($conn, 'SELECT s.id as id_sales, s.painter_id, s.image, s.price, s.status, st.*, p.* FROM orient_ressamlar.sales s 
                                                                                           INNER JOIN orient_ressamlar.sales_translation st ON st.sales_id=s.id
                                                                                           INNER JOIN orient_ressamlar.painters p ON p.id=s.painter_id
                                                                                           Where st.lang_id=1 and s.status=1 ORDER BY s.`id` desc LIMIT ' . $start . ',' . $limit);
                                                        }
                                                        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                    ?>
                                                            <tr role="row" class="even">
                                                                <?php
                                                                if (empty($row['image']))
                                                                    echo "<td><img src='../uploads/noPhoto.png' class='img-thumbnail' width='200px' height='200px'></td>";
                                                                else
                                                                    echo "<td><img id='previewImage' src='../uploads/" . $row['image'] . "' class='img-thumbnail' width='200px' height='200px'></td>";
                                                                ?>
                                                                <td class="sorting_1"><?= $row['name']; ?></td>
                                                                <td class="sorting_1"><?= $row['painter_name']; ?> <?= $row['painter_surname']; ?></td>
                                                                <td class="sorting_1"><?= $row['price']; ?></td>
                                                                <td class="sorting_1"><?= $row['size']; ?></td>
                                                                <td class="sorting_1"><?= $row['technique']; ?></td>
                                                                <td class="edit-buttons">
                                                                    <div class="button-section">
                                                                        <a href="form-sales.php?id=<?= $row['id_sales']; ?>" class="btn btn-success"><i class="fas fa-edit"></i></a>
                                                                        <a onclick="deleteItem(this);" data-id-number="<?= $row['id_sales']; ?>" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
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
                            window.location.href = "sales.php?ids=" + thisId + "&id=" + idCat;
                        } else if (url.includes("search=")) {
                            window.location.href = "sales.php?ids=" + thisId + "&search=" + search;
                        } else {
                            window.location.href = "sales.php?ids=" + thisId;
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