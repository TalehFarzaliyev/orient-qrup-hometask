<?php
session_start();
if ($_SESSION['logged_in'] == 1) {
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
                        <h1 class="h3 mb-2 text-gray-800">Menyu əlavə et</h1>
                        <br>
                        <!-- DataTales Example -->
                        <form action="form-menu.php" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-4 form-section">
                                    <br>
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">Ana kateqoriya</label>
                                        <select class="form-control" name="name" id="exampleFormControlSelect1">
                                            <?php
                                            include '../config/config.php';
                                            $select_sql = "SELECT * FROM `menu_translation` WHERE `lang_id`=1";
                                            $result = mysqli_query($conn, $select_sql);
                                            while ($row1 = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                            ?>
                                                <option><?= $row1['name']; ?></option>;
                                            <?php
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1">Sıra nömrəsi</label>
                                        <input type="number" name="order_number" min="0" class="form-control" id="exampleFormControlInput1" placeholder="Sıra nömrəsi">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">Status</label>
                                        <select class="form-control" name="status" id="exampleFormControlSelect1">
                                            <option value="0">Deaktiv</option>
                                            <option selected value="1">Aktiv</option>
                                        </select>
                                    </div>

                                </div>
                                <div class="col-8 form-language">
                                    <div class="lang-buttons row">
                                        <div class="button-az btn-language col-6" onclick="changeLangAz();" style="position: relative;"><span>Azərbaycan dili</span> <img src="templates/img/Azerbaijan-Flag-icon.png" style="position: absolute; top: 50%; right: 15px; transform:translateY(-50%);" width="15px" alt=""></div>
                                        <div class="button-en btn-language col-6" onclick="changeLangEn();" style="position: relative;"><span>English</span> <img src="templates/img/United-Kingdom-flag-icon.png" style="position: absolute; top: 50%; right: 15px; transform:translateY(-50%);" width="15px" alt=""></div>
                                    </div>

                                    <br>
                                    <div class="az-section">
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">Kateqoriya adı</label>
                                            <input type="text" name="submenu" class="form-control" id="exampleFormControlInput1" placeholder="Kateqoriya adı">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">Slug</label>
                                            <input type="text" name="slug" class="form-control" id="exampleFormControlInput1" placeholder="Slug">
                                        </div>
                                    </div>
                                    <div class="en-section">
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">Kateqoriya adı</label>
                                            <input type="text" name="submenu" class="form-control" id="exampleFormControlInput1" placeholder="Kateqoriya adı">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">Slug</label>
                                            <input type="text" name="slug" class="form-control" id="exampleFormControlInput1" placeholder="Slug">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" name="submit" value="submit" class="btn btn-primary">Yadda saxla</button>
                                    </div>
                                </div>
                            </div>
                        </form>

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