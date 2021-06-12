<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';

    if (isset($_GET['id']) and !empty($_GET['id'])) {
        $work_id = intval($_GET['id']);
        mysqli_query($conn, "DELETE FROM `works` WHERE `id`=$work_id");
        mysqli_query($conn, "DELETE FROM `works_translation` WHERE `work_id`=$work_id");
        header('works.php');
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

                        <h1 class="h3 mb-2 text-gray-800">Əsərlərin siyahısı</h1>
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"></h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                        <div class="create-button">
                                            <a href="form-works.php?painter=<?= $_GET['painter'] ?>" class="btn btn-primary"><i class="fas fa-plus-square"></i></a>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                                    <thead>
                                                        <tr role="row" style="text-align: center;">
                                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 180px;">Şəkil</th>
                                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Əsərin adı</th>
                                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 163px;">Əməliyyatlar</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr style="text-align: center;">
                                                            <th rowspan="1" colspan="1">Şəkil</th>
                                                            <th rowspan="1" colspan="1">Əsərin adı</th>
                                                            <th rowspan="1" colspan="1">Əməliyyatlar</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <?php
                                                        include '../config/config.php';
                                                        if (isset($_GET['painter']) and !empty($_GET['painter'])) {
                                                            $painter     = intval($_GET['painter']);
                                                            $select_sql  = "SELECT * FROM orient_ressamlar.painters p 
                                                                            INNER JOIN orient_ressamlar.works w 
                                                                            INNER JOIN orient_ressamlar.works_translation wt ON w.id=wt.work_id 
                                                                            Where w.painter_id=p.id && wt.lang_id=1 && w.`painter_id`='$painter' ORDER BY w.`id` desc";
                                                            $result      = mysqli_query($conn, $select_sql);
                                                            while ($row  = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                        ?>
                                                                <tr role="row" class="even">
                                                                    <?php
                                                                    if (empty($row['work_image']))
                                                                        echo "<td><img src='../uploads/noPhoto.png' class='img-thumbnail' width='200px' height='200px'></td>";
                                                                    else
                                                                        echo "<td><img id='previewImage' src='../uploads/" . $row['work_image'] . "' class='img-thumbnail' width='200px' height='200px'></td>";
                                                                    ?>
                                                                    <td class="sorting_1"><?= $row['work_name']; ?></td>
                                                                    <td class="edit-buttons">
                                                                        <div class="button-section">
                                                                            <a href="form-works.php?id=<?= $row['id']; ?>&painter=<?= $_GET['painter'] ?>" class="btn btn-success"><i class="fas fa-edit"></i></a>
                                                                            <a onclick="sil(this);" data-id-number="<?= $row['id']; ?>&painter=<?= $_GET['painter'] ?>" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                        <?php
                                                            }
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
                            window.location.href = "works.php?id=" + thisId;
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