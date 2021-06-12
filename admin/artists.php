<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';

    if (isset($_GET['id']) and !empty($_GET['id'])) {
        $painter_id = intval($_GET['id']);
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
                                <div class="table-responsive">
                                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                        <div class="create-button">
                                            <a href="form-artist.php" class="btn btn-primary"><i class="fas fa-plus-square"></i></a>
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
                                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 163px;">Əməliyyatlar</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr style="text-align: center;">
                                                            <th rowspan="1" colspan="1">Şəkil</th>
                                                            <th rowspan="1" colspan="1">Rəssamın adı</th>
                                                            <th rowspan="1" colspan="1">Kateqoriya</th>
                                                            <th rowspan="1" colspan="1">Əsərləri</th>
                                                            <th rowspan="1" colspan="1">Əməliyyatlar</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <?php
                                                        include '../config/config.php';
                                                        $select_sql = "SELECT p.painter_name, p.id as artist_id, p.painter_surname, p.painter_image, p.categories, p.status, pt.*, mt.* FROM orient_ressamlar.painters p 
                                                                       INNER JOIN orient_ressamlar.painter_translation pt ON pt.painter_id=p.id
                                                                       INNER JOIN orient_ressamlar.menu_translation mt 
                                                                       WHERE pt.lang_id=1 && mt.lang_id=1 && p.categories=mt.menu_id && p.status=1 ORDER BY p.`id` desc";
                                                        $result     = mysqli_query($conn, $select_sql);
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
                                                                <td class="edit-buttons">
                                                                    <div class="button-section">
                                                                        <a href="form-artist.php?id=<?= $row['artist_id']; ?>" class="btn btn-success"><i class="fas fa-edit"></i></a>
                                                                        <a onclick="sil(this);" data-id-number="<?= $row['artist_id']; ?>" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        <?php
                                                        }
                                                        ?>
                                                    </tbody>
                                                </table>
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
            function sil(id) {
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
                            window.location.href = "artists.php?id=" + thisId;
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