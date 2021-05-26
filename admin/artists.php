<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';
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
                        <h1 class="h3 mb-2 text-gray-800">Rəssamların siyahısı</h1>
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Siyahı Rəssamlar</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                        <div class="create-button">
                                            <a href="form-artists.php" class="btn btn-primary"><i class="fas fa-plus-square"></i></a>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                                    <thead>
                                                        <tr role="row" style="text-align: center;">
                                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 180px;">Şəkil</th>
                                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Rəssamın adı</th>
                                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Rəssam haqqında</th>
                                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Kateqoriya</th>
                                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Əsərləri</th>
                                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 163px;">Əməliyyatlar</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr style="text-align: center;">
                                                            <th rowspan="1" colspan="1">Şəkil</th>
                                                            <th rowspan="1" colspan="1">Rəssamın adı</th>
                                                            <th rowspan="1" colspan="1">Rəssam haqqında</th>
                                                            <th rowspan="1" colspan="1">Kateqoriya</th>
                                                            <th rowspan="1" colspan="1">Əsərləri</th>
                                                            <th rowspan="1" colspan="1">Əməliyyatlar</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <?php
                                                        include '../config/config.php';
                                                        include '../config/vars.php';
                                                        $select_sql = "SELECT * FROM orient_ressamlar.painter_translation pt 
                                                               INNER JOIN orient_ressamlar.painters p ON pt.painter_id=p.id
                                                               Where pt.lang_id=1 and p.status=1 ORDER BY `id` desc";
                                                        $result     = mysqli_query($conn, $select_sql);
                                                        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                        ?>
                                                            <tr role="row" class="even">
                                                                <?php
                                                                if (empty($row['image']))
                                                                    echo "<td><img src='../uploads/noPhoto.png' class='img-thumbnail' width='200px' height='200px'></td>";
                                                                else
                                                                    echo "<td><img id='previewImage' src='../uploads/" . $row['image'] . "' class='img-thumbnail' width='200px' height='200px'></td>";
                                                                ?>
                                                                <td class="sorting_1"><?= $row['painter_name']; ?> <?= $row['painter_surname']; ?></td>
                                                                <td class="sorting_1"><?= $row['about_painter']; ?></td>

                                                                <td class="sorting_1"></td>
                                                                <td class="sorting_1 edit-buttons">
                                                                    <a href="works.php?id=<?= $row['id']; ?>" class="btn btn-secondary button-section d-block"><i class="far fa-images"></i></a>
                                                                </td>

                                                                <td class="edit-buttons">
                                                                    <div class="button-section">
                                                                        <a href="form-artists.php?id=<?= $row['id']; ?>" class="btn btn-success"><i class="fas fa-edit"></i></a>
                                                                        <a href="artists.php?id=<?= $row['id']; ?>" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
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
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <?php include 'includes/content-footer.php'; ?>

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <?php include 'includes/footer.php'; ?>


    </body>

    </html>

<?php
} else {
    header('Location: login.php');
}
?>