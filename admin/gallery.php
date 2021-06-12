<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';

    if (isset($_GET['id']) and !empty($_GET['id'])) {
        $post_id = intval($_GET['id']);
        mysqli_query($conn, "DELETE FROM `posts_gallery` WHERE `id`=$post_id");
        header('gallery.php');
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

                        <h1 class="h3 mb-2 text-gray-800">Yeni şəkil əlavə et</h1>
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"></h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="container">
                                                    <div class='content'>
                                                        <form action="../config/upload.php" class="dropzone" id="myAwesomeDropzone">
                                                            <input type="hidden" name="post" value="<?= $_GET['post']; ?>">
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="container-fluid">

                                            <h1 class="h3 mb-2 text-gray-800">Qalereya</h1>
                                            <div class="card shadow mb-4">
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                                            <br>
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                                                        <thead>
                                                                            <tr role="row" style="text-align: center;">
                                                                                <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 400px;">Şəkil</th>
                                                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 10px;">Əməliyyatlar</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tfoot>
                                                                            <tr style="text-align: center;">
                                                                                <th rowspan="1" colspan="1">Şəkil</th>
                                                                                <th rowspan="1" colspan="1">Əməliyyatlar</th>
                                                                            </tr>
                                                                        </tfoot>
                                                                        <tbody>
                                                                            <?php
                                                                            include '../config/config.php';
                                                                            if (isset($_GET['post']) and !empty($_GET['post'])) {
                                                                                $post      = intval($_GET['post']);
                                                                                $select_sql = "SELECT * FROM orient_ressamlar.posts p 
                                                                                               INNER JOIN orient_ressamlar.posts_gallery pg ON pg.post_id=p.id 
                                                                                               WHERE pg.`post_id`='$post' ORDER BY pg.`post_id` desc";
                                                                                $result     = mysqli_query($conn, $select_sql);
                                                                                while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                                                            ?>
                                                                                    <tr role="row" class="even">
                                                                                        <?php
                                                                                        if (empty($row['gallery_image']))
                                                                                            echo "<td><img src='../uploads/noPhoto.png' class='img-thumbnail' width='200px' height='200px'></td>";
                                                                                        else
                                                                                            echo "<td><img id='previewImage' src='../uploads/" . $row['gallery_image'] . "' class='img-thumbnail' width='200px' height='200px'></td>";
                                                                                        ?>
                                                                                        <td class="edit-buttons">
                                                                                            <div class="button-section">
                                                                                                <a onclick="sil(this);" data-id-number="<?= $row['id']; ?>&post=<?= $_GET['post'] ?>" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
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
                                </div>
                            </div>
                        </div>
                    </div>

                    <?php include 'includes/content-footer.php'; ?>

                </div>

            </div>
            <script type='text/javascript'>
                Dropzone.autoDiscover = false;
                var post = $("input[type=hidden][name=post]").val();
                $(".dropzone").dropzone({
                    addRemoveLinks: true,
                    removedfile: function(file) {
                        var name = file.name;

                        $.ajax({
                            type: 'POST',
                            url: '../config/upload.php',
                            data: {
                                name: name,
                                request: 2,
                                id: post
                            },
                            sucess: function(data) {
                                console.log('success: ' + data);
                            }
                        });
                        var _ref;
                        return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
                    }
                });

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
                                window.location.href = "gallery.php?id=" + thisId;
                            } else {
                                swal("Silinmədi");
                            }
                        });
                };
            </script>

            <?php include 'includes/footer.php'; ?>

    </body>

    </html>

<?php
} else {
    header('Location: login.php');
}
?>