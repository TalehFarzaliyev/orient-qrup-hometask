<!DOCTYPE html>
<html>

<?php include 'includes/head.php' ?>

<body class="w3-light-grey">

  <!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
  <div class="w3-content" style="max-width:1400px">

    <!-- Header -->
    <header class="w3-container w3-center w3-padding-32">
      <h1><b>MY BLOG</b></h1>
      <p>Welcome to the blog of <span class="w3-tag">Orient students</span></p>
    </header>

    <!-- Grid -->
    <div class="w3-row">

      <!-- Blog entries -->
      <div class="w3-col l8 s12">
        <!-- Blog entry -->

        <?php
        include 'admin/database/data.php';
        $single = $data[$_GET['news'] - 1];

        ?>
        <div class="w3-card-4 w3-margin w3-white">
          <img src="<?= $single['image']; ?>" alt="Nature" style="width:100%; max-height:600px">
          <div style="text-align: center;" class="w3-container">
            <h3><b><?= $single['title']; ?></b></h3>
            <h5><?= $single['title']; ?><span class="w3-opacity"> <?= $single['date']; ?></span></h5>
          </div>

          <div class="w3-container">
            <p style="text-align:justify; font-size: 16px;"><?= $single['content']; ?></p>
            <div class="w3-row">
            <div class="w3-col m8 s12">
                <p><a href="index.php" class="w3-button w3-padding-large w3-white w3-border"><b><< GO BACK</b></a></p>
              </div>
              <div class="w3-col m4 w3-hide-small">
                <p><span class="w3-padding-large w3-right"><b>Comments  </b> <span class="w3-tag">0</span></span></p>
              </div>
            </div>
          </div>
        </div>
        <hr>
        <?php
        ?>
      </div>

      <!-- Introduction menu -->
      <div class="w3-col l4">
        <!-- About Card -->
        <div class="w3-card w3-margin w3-margin-top">
          <img src="https://www.w3schools.com/w3images/avatar_g.jpg" style="width:100%">
          <div class="w3-container w3-white">
            <h4><b>My Name</b></h4>
            <p>Just me, myself and I, exploring the universe of uknownment. I have a heart of love and a interest of lorem ipsum and mauris neque quam blog. I want to share my world with you.</p>
          </div>
        </div>
        <hr>

        <!-- Posts -->
        <div class="w3-card w3-margin">
          <div class="w3-container w3-padding">
            <h4>Popular Posts</h4>
          </div>
          <ul class="w3-ul w3-hoverable w3-white">
            <?php
            for ($i = 0; $i < 3; $i++) {
            ?>
              <li class="w3-padding-16">
                <img src="https://www.w3schools.com/w3images/workshop.jpg" alt="Image" class="w3-left w3-margin-right" style="width:50px">
                <span class="w3-large">Lorem</span><br>
                <span>Sed mattis nunc</span>
              </li>
            <?php
            }
            ?>
          </ul>
        </div>
        <hr>

        <!-- Labels / tags -->
        <div class="w3-card w3-margin">
          <div class="w3-container w3-padding">
            <h4>Tags</h4>
          </div>
          <div class="w3-container w3-white">
            <p><span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">New York</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">London</span>
              <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">IKEA</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">NORWAY</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">DIY</span>
              <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Ideas</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Baby</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Family</span>
              <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">News</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Clothing</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Shopping</span>
              <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Sports</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Games</span>
            </p>
          </div>
        </div>

        <!-- END Introduction Menu -->
      </div>

      <!-- END GRID -->
    </div><br>

    <!-- END w3-content -->
  </div>

  <!-- Footer -->
  <?php include 'includes/footer.php' ?>

</body>

</html>