<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';

    // if (isset($_GET['id']) and !empty($_GET['id'])) {
    //     $work_id = intval($_GET['id']);
    //     mysqli_query($conn, "DELETE FROM `works` WHERE `id`=$work_id");
    //     mysqli_query($conn, "DELETE FROM `works_translation` WHERE `work_id`=$work_id");
    //     header('works.php');
    // }
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
                        <h1 class="h3 mb-2 text-gray-800">Qalereya</h1>
                        <!-- DataTales Example -->
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
                                                        <form action="upload.php" class="dropzone" id="myAwesomeDropzone">
                                                        </form>
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
        $(".dropzone").dropzone({
            addRemoveLinks: true,
            removedfile: function(file) {
                var name = file.name;    
                
                $.ajax({
                    type: 'POST',
                    url: 'upload.php',
                    data: {name: name,request: 2},
                    sucess: function(data){
                        console.log('success: ' + data);
                    }
                });
                var _ref;
                return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
            }
        });
        </script>

        <?php include 'includes/footer.php'; ?>

    </body>

    </html>

<?php
} else {
    header('Location: login.php');
}
?>