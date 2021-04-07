<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

  if (!empty($_POST['button'])) {
    $title=$_POST['title'];
    $category=$_POST['category'];
    $text=$_POST['mezmun'];
            if(isset($_FILES['image']) and !empty($_FILES['image'])){



              $errors= array();
              $file_name = $_FILES['image']['name'];
              $file_size =$_FILES['image']['size'];
              $file_tmp =$_FILES['image']['tmp_name'];
              $file_type=$_FILES['image']['type'];
              $file_ext=strtolower(end(explode('.',$_FILES['image']['name'])));
              
             
                move_uploaded_file($file_tmp,"upload/".$file_name);
                echo "Success";
             
          }


    }
}

?>



<!DOCTYPE html>
<html lang="en">
            <?php include 'includes/header.php'; ?>
            <body id="page-top">
                <!-- Page Wrapper -->
                <div id="wrapper">
                  <!-- Sidebar -->
                  <?php include 'includes/sidebar.php'; ?>
                  <!-- End of Sidebar -->
                  <!-- Content Wrapper -->
                  <div id="content-wrapper" class="d-flex flex-column">
                      <div id="content">
                        <!--topbar-->
                        <?php include 'includes/topbar.php'; ?>
                        <!--end.topbar-->
                        <!-- Begin Page Content -->
                        <div class="container-fluid">
                            <!-- Page Heading -->
                            <form action="create-news.php" method="POST">
                              <div class="form-group">
                                  <label for="exampleFormControlInput1"></label>
                                  <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                              </div>
                              <div class="form-group">
                                  <label for="exampleFormControlSelect1">Kateqoriya</label>
                                  <select class="form-control" name="title" id="exampleFormControlSelect1">
                                    <option>Dunya</option>
                                    <option>Gundem</option>
                                    <option>Idman</option>
                                    <option>hava</option>
                                  </select>
                              </div>
                            <form>
                              <div class="form-group">
                                  <label for="exampleFormControlFile1">Sekil</label>
                                  <input type="file" name="image" class="form-control-file" id="exampleFormControlFile1">
                              </div>
                            </form>
                            <div class="form-group">
                              <label for="exampleFormControlTextarea1">Mezmun</label>
                              <textarea class="form-control" name="mezmun" id="exampleFormControlTextarea1" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                              <button type="submit"  name="button"  class="btn btn-primary">Save</button>
                            </div>
                            </form>
                        </div>
                      </div>
                  </div>
                  <!-- /.container-fluid -->
                </div>
                <!-- End of Main Content -->
                <!-- Footer -->
                <?php include 'includes/content-footer.php'; ?>
                <!-- End of Footer -->
                </div>
                <!-- End of Content Wrapper -->
                </div>
                <!-- End of Page Wrapper -->
                <?php include 'includes/footer.php'; ?>
            </body>
</html>