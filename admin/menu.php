<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';

    if (isset($_GET['id']) and !empty($_GET['id'])) {
        $menu_id = intval($_GET['id']);
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
                                <div class="table-responsive">
                                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                        <div class="create-button">
                                            <a href="form-menu.php" class="btn btn-primary"><i class="fas fa-plus-square"></i></a>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                                    <thead>
                                                        <tr role="row" style="text-align: center;">
                                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Menyu adı</th>
                                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Slug</th>
                                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 255px;">Tipi</th>
                                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 163px;">Əməliyyatlar</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr style="text-align: center;">
                                                            <th rowspan="1" colspan="1">Menyu adı</th>
                                                            <th rowspan="1" colspan="1">Slug</th>
                                                            <th rowspan="1" colspan="1">Tipi</th>
                                                            <th rowspan="1" colspan="1">Əməliyyatlar</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <?php
                                                        include '../config/config.php';
                                                        include '../config/vars.php';
                                                        $select_sql = "SELECT * FROM orient_ressamlar.menu_translation mt 
                                                               INNER JOIN orient_ressamlar.menu m ON mt.menu_id=m.id 
                                                               Where mt.lang_id=1 and m.status=1 order by m.`id` desc;";
                                                        $result     = mysqli_query($conn, $select_sql);
                                                        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                        ?>
                                                            <tr role="row" class="even">
                                                                <td class="sorting_1"><?= $row['name']; ?></td>
                                                                <td class="sorting_1"><?= $row['slug']; ?></td>
                                                                <td class="sorting_1"><?= $row['type']; ?></td>
                                                                <input name="id" id="delete" value="<?= $row['id']; ?>" style="display:none;"></input>

                                                                <td class="edit-buttons">
                                                                    <div class="button-section">
                                                                        <a href="form-menu.php?id=<?= $row['id']; ?>" class="btn btn-success"><i class="fas fa-edit"></i></a>
                                                                        <a onclick="sil();" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
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
            function sil() {
                var id = document.getElementById("delete").value;
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
                            window.location.href = "menu.php?id=" + id;
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