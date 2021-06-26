<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
    include '../config/config.php';
    include '../config/vars.php';

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
                        <div class="row">

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <a href="menu.php" class="text-xs font-weight-normal text-primary  mb-1" style="text-align:center; font-size:25px;">
                                                    Menyu</a>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-ellipsis-v fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Annual) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <a href="posts.php" class="text-xs font-weight-normal text-success  mb-1" style="text-align:center; font-size:25px;">
                                                    Paylaşımlar</a>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-newspaper fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Tasks Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <a href="artists.php" class="text-xs font-weight-normal text-info  mb-1" style="text-align:center; font-size:25px;">
                                                    Rəssamlar
                                                </a>
                                                <div class="row no-gutters align-items-center">
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-palette fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pending Requests Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <a href="sales.php" class="text-xs font-weight-normal text-warning  mb-1" style="text-align:center; font-size:25px;">
                                                    Satış</a>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-shopping-cart fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-secondary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <a href="slides.php" class="text-xs font-weight-normal text-secondary  mb-1" style="text-align:center; font-size:25px;">
                                                    Slayder</a>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-sliders-h fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-danger shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <a href="form-settings.php?id=1" class="text-xs font-weight-normal text-warning text mb-1" style="text-align:center; font-size:25px;">
                                                    Tənzimləmə</a>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-cogs fa-2x text-gray-300"></i>
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