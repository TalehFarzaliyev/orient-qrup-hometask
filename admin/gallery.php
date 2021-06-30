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

                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                    <br>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="container">
                                                <div class='content'>
                                                    <form action="../config/upload.php" class="dropzone" id="myAwesomeDropzone">
                                                        <input type="hidden" name="post" value="<?= $_GET['post']; ?>">
                                                        <div class="dz-default dz-message"><span>Şəkil əlavə etmək üçün klikləyin</span></div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-fluid">
                                        <br>
                                        <h1 class="h3 mb-2 text-gray-800">Qalereya</h1>
                                        <div class="card shadow mb-4">
                                            <div class="card-body">
                                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                                    <br>
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <table class="table table-bordered dataTable mx-auto w-auto text-center" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                                                <thead>
                                                                    <tr role="row" style="text-align: center;">
                                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 400px;">Şəkil</th>
                                                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 10px;">Əməliyyatlar</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="mx-auto w-auto">
                                                                    <?php
                                                                    include '../config/config.php';
                                                                    if (isset($_GET['post']) and !empty($_GET['post'])) {
                                                                        $post      = intval($_GET['post']);
                                                                        $page = isset($_GET['page']) ? $_GET['page'] : 1;
                                                                        $number_of_content = mysqli_num_rows(mysqli_query($conn, "SELECT `id` FROM `posts_gallery` WHERE `post_id`='$post'"));
                                                                        $limit = 5;
                                                                        $lastpage = ceil($number_of_content / $limit);
                                                                        $start = ($page - 1) * $limit;
                                                                        if ($lastpage >= $page) {
                                                                            $result = mysqli_query($conn, "SELECT * FROM orient_ressamlar.posts p 
                                                                                                           INNER JOIN orient_ressamlar.posts_gallery pg ON pg.post_id=p.id 
                                                                                                           WHERE pg.`post_id`='$post' ORDER BY pg.`id` desc LIMIT " . $start . ',' . $limit);
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
                                                                                            <a onclick="deleteItem(this);" data-id-number="<?= $row['id']; ?>&post=<?= $_GET['post'] ?>" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                        <?php
                                                                            }
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
                                                                            echo '<a href="?page=' . $previous . '&post= ' . $_GET['post'] . '">« Öncəki </a>';
                                                                        }
                                                                        if ($page == 1) {
                                                                            echo '<a>[1]</a>';
                                                                        } else {
                                                                            echo '<a href="?page=1&post= ' . $_GET['post'] . '" style= "margin-left: 10px;">1</a>';
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
                                                                                echo '<a href="?page=' . $i . '&post= ' . $_GET['post'] . '" style= "margin-left: 10px;">' . $i . '</a>';
                                                                            }
                                                                            if ($i == $lastpage) break;
                                                                        }
                                                                        if ($page + $x < $lastpage - 1) {
                                                                            echo '...';
                                                                            echo '<a href="?page=' . $lastpage . '&post= ' . $_GET['post'] . '" style= "margin-left: 10px;">' . $lastpage . '</a>';
                                                                        } elseif ($page + $x == $lastpage - 1) {
                                                                            echo '<a href="?page=' . $lastpage . '&post= ' . $_GET['post'] . '" style= "margin-left: 10px;">' . $lastpage . '</a>';
                                                                        }
                                                                        if ($page < $lastpage) {
                                                                            $next = $page + 1;
                                                                            echo '<a href="?page=' . $next . '&post= ' . $_GET['post'] . '" style= "margin-left: 10px;"> Sonrakı » </a>';
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
                            </div>
                        </div>
                    </div>

                    <?php include 'includes/content-footer.php'; ?>

                </div>

            </div>
            <script type='text/javascript'>
                Dropzone.autoDiscover = false;

                Dropzone.options.myAwesomeDropzone = {
                    maxFilesize: 10,
                    init: function() {
                        this.on('queuecomplete', function() {
                            window.location.reload();
                        });
                    }
                };

                var post = $("input[type=hidden][name=post]").val();
                $(".dropzone").dropzone({
                    // addRemoveLinks: true,
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
                            success: function(data) {
                                console.log('success: ' + data);
                            }
                        });
                        // var _ref;
                        // return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
                    }
                });

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