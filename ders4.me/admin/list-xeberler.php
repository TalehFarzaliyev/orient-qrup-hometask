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
                    <h1 class="h3 mb-2 text-gray-800">Siyahi Xeberler</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Siyahi Xeberler </h6>
                        </div>
                        <div class="card-body">
   <div class="table-responsive">
      <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
         <div class="row">
            <div class="col-sm-12 col-md-6">
               <div class="dataTables_length" id="dataTable_length">
                  <label>
                     Show 
                     <select name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
                        <option value="10">10</option>
                        <option value="25">25</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                     </select>
                     entries
                  </label>
               </div>
            </div>
            <div class="col-sm-12 col-md-6">
               <div id="dataTable_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable"></label></div>
            </div>
         </div>
         <div class="row">
            <div class="col-sm-12">
               <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                  <thead>
                     <tr role="row">
                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 159px;">Xeberin adi</th>
                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 246px;">Kateqoriya</th>
                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 114px;">Sekil</th>
                        
                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 108px;">Yaradilma Tarixi</th>
                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 97px;">Emeliyyatlar</th>
                     </tr>
                  </thead>
                  <tfoot>
                     <tr>
                        <th rowspan="1" colspan="1">Xeberin adi</th>
                        <th rowspan="1" colspan="1">Kateqoriya</th>
                        <th rowspan="1" colspan="1">sekil</th>
                        <th rowspan="1" colspan="1">yaradilma tarixi</th>
                        <th rowspan="1" colspan="1">Emeliyyatlar</th>
                     </tr>
                  </tfoot>
                  <tbody>
           
                     <tr role="row" class="even">
                        <td class="sorting_1">Cedric Kelly</td>
                        <td>Senior Javascript Developer</td>
                        <td>Edinburgh</td>
                       
                        <td>2012/03/29</td>
                        <td>$433,060</td>
                     </tr>
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