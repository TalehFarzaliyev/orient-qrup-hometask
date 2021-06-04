<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';

    if(isset($_GET['id_artist']) and !empty($_GET['id_artist']))
    {
        $painter_id = intval($_GET['id_artist']);
        mysqli_query($conn,"DELETE FROM `painters` WHERE `id_artist`=$painter_id");
        mysqli_query($conn,"DELETE FROM `painters_to_category` WHERE `painter_id`=$painter_id");
        mysqli_query($conn,"DELETE FROM `painter_translation` WHERE `painter_id`=$painter_id");
        mysqli_query($conn,"DELETE FROM `works` w INNER JOIN works_translation wt ON w.id=wt.work_id WHERE w.`id_painter`=$painter_id");
        header('artists.php');
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
                        <h1 class="h3 mb-2 text-gray-800"> Rəssamlar siyahı </h1>
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Siyahı Rəssamlar</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                        <div class="row" style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                                            <div class="col-12 col-sm-6 col-md-8">
                                                <a href="form-artists.php"><img src="../uploads/create.png" style="width: 40px; float:left; "></a>
                                            </div>
                                            <div class="col-6 col-md-4">

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                                    <thead>
                                                        <tr role="row">
                                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Şəkil</th>
                                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 163px;">Rəssamın adı</th>
                                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 163px; text-align:center;">Rəssam haqqında</th>
                                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Kateqoriya</th>
                                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 163px;">Əsərləri</th>
                                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 163px; text-align:center;">Əməliyyatlar</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <?php
                                                        include '../config/config.php';
                                                        $select_sql = "SELECT p.painter_name, p.id_artist, p.painter_surname, p.painter_image, p.status, pt.*, mt.*, m.*, ptc.* FROM orient_ressamlar.painters p 
                                                                       INNER JOIN orient_ressamlar.painter_translation pt ON pt.painter_id=p.id_artist 
                                                                       INNER JOIN orient_ressamlar.menu_translation mt 
                                                                       INNER JOIN orient_ressamlar.menu m ON mt.menu_id=m.id 
                                                                       INNER JOIN orient_ressamlar.painters_to_category ptc ON ptc.painter_id=p.id_artist 
                                                                       WHERE pt.lang_id=1 && p.status=1 && m.type = 'painter' && m.parent_id>0 && ptc.category_id=m.id && mt.lang_id=1 ORDER BY p.`id_artist` desc";
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
                                                                <td class="sorting_1"><?= $row['about_painter']; ?></td>

                                                                <td class="sorting_1"><?= $row['name']; ?></td>
                                                                <td class="sorting_1 edit-buttons">
                                                                    <a href="works.php?painters=<?= $row['id_artist']; ?>" class=""><img src="../uploads/photos.png" style="width:70px; height:70px;"></i></a>
                                                                </td>
                                                            <td style="position: relative;">
                                                                <div style="position:absolute; top:30%; left:30%; transform: translate(-30%, -30%);">
                                                                    <a href="form-artists.php?id_artist=<?= $row['id_artist']; ?>"><img src="../uploads/edit5.jpg" style="width=25px; height:25px;"></a>
                                                                    <a href="artists.php?id_artist=<?= $row['id_artist']; ?>"><img src="../uploads/deleteb.png" style="width=25px; height:25px;"></a>
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