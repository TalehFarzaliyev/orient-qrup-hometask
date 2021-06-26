<?php include 'config/config.php' ?>
<!DOCTYPE html>
<html lang="en">

<?php include 'includes/header.php' ?>

<body>
    <div id="go-up" class="header">
        <?php include 'includes/menu.php'; ?>
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="assets/img/main1.png" alt="First slide">
                    <div class="carousel-caption d-md-block homepage-caption">
                        <p class="homepage-text">RƏSSAMLAR BİRLİYİ</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="assets/img/main2.jpg" alt="Second slide">
                    <div class="carousel-caption d-md-block slider-caption">
                        <a href="artists.php" class="painter_name">Əzizə İsmayılova</a>
                        <p class="caption-head">seçilən <span style="color: #fff;">əsərlər</span></p>
                        <div class="row">
                            <div class="col-4">
                                <div class="col-pictures">
                                    <a href=""><img src="assets/img/_DSC0487.JPG" alt=""></a>
                                </div>
                                <div class="col-pictures">
                                    <a href=""><img src="assets/img/_DSC0488.JPG" alt=""></a>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="col-pictures">
                                    <a href=""><img src="assets/img/_DSC0497.JPG" alt=""></a>
                                </div>
                                <div class="col-pictures">
                                    <a href=""><img src="assets/img/_DSC0501.JPG" alt=""></a>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="col-pictures">
                                    <a href=""><img src="assets/img/2-2.jpg" alt=""></a>
                                </div>
                                <div class="col-pictures">
                                    <a href=""><img src="assets/img/IMG_0724.JPG" alt=""></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>

            <div class="social-icon">
                <a class="gmail" href="https://www.gmail.com/"><i class="fas fa-envelope social-media"></i></a>
                <a class="instagram" href="https://www.instagram.com/"><i class="fab fa-instagram social-media"></i></a>
                <a class="facebook" href="https://www.facebook.com/"><i class="fab fa-facebook-f social-media"></i></a>
                <a class="youtube" href="https://www.youtube.com/"><i class="fab fa-youtube social-media"></i></a>
            </div>
        </div>
    </div>

    <?php include 'includes/theme.php'; ?>

    <div class="portfolio change-theme portfolio-button">
        <a href="portfolio.php" class="view_button wow swing">BİRLİYİN PROFİLİ</a>
    </div>

    <?php
    $result = mysqli_query($conn, "SELECT p.id as id_post, p.image, p.created_date, p.category_id, pt.*, mt.*, m.* FROM orient_ressamlar.posts p 
                                   INNER JOIN orient_ressamlar.posts_translation pt ON pt.post_id=p.id
                                   INNER JOIN orient_ressamlar.menu_translation mt 
                                   INNER JOIN orient_ressamlar.menu m ON mt.menu_id=m.id 
                                   WHERE pt.lang_id=1 && p.status=1 && p.category_id=m.id && mt.name='xəbərlər' && mt.lang_id=1 ORDER BY p.`id` desc LIMIT 8");
    $news  = mysqli_fetch_all($result, MYSQLI_ASSOC);
    if(!empty($news))
{
    ?>
    <div class="blog change-theme news-section">
        <div class="section-header">
            <h2>Xəbərlər</h2>
            <div class="title-line icon">
                <img class="line" src="assets/img/title-line.png" alt="">
            </div>
        </div>
        <div class="owl-carousel owl-theme container">
        <?php 
        foreach($news as $post) {
        ?>
            <div class="card wow bounceIn">
                <img class="card-img-top" src="uploads/<?=$post['image'];?>" alt="Card image cap">
                <div class="card-body">
                    <h6 class="card-title text-center"><?=$post['title'];?></h6>
                    <p class="card-text"><?=substr($post['content'],0,100);?></p>
                    <div class="date_button">
                        <span><i class="far fa-clock"></i>&nbsp;&nbsp;<?=date('d.m.Y H:i', strtotime($post['created_date']));?></span>
                        <a href="single_news.php?post=<?=$post['id_post'];?>" class="btn btn-primary change_button_color">Ətraflı</a>
                    </div>
                </div>
            </div>

            <?php 
            }
            ?>
        </div>
    </div>
<?php
}
?>
    <div class="blog change-theme">
        <div class="section-header">
            <h2>Rəssam materialları</h2>
            <div class="title-line">
                <img class="line" src="assets/img/title-line.png" alt="">
            </div>
        </div>
        <div class="blog-slider">
            <div class="vc_item row">
                <div id="carouselExampleControls-one" class="carousel slide col-xl-6 col-lg-6 col-md-12" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <span class="carousel-line"></span>
                        <div class="carousel-item active">
                            <img src="assets/img/_DSC0501.JPG" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="assets/img/_DSC0497.JPG" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="assets/img/_DSC0488.JPG" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls-one" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls-one" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-12 acrylic wow bounceIn">
                    <h2>Fırça</h2>
                    <p>1971-ci ilin iyun ayında Naxçıvan Rəssamlar Təşkilatının yaradılmasına hazırlıq işlərinin tamamlanması barədə hökumət strukturlarına və Rəssamlar İttifaqına göstəriş verən ümummilli liderimiz yeni təşkilatın sədri vəzifəsinə bu məsələnin
                        əsas təşəbbüskarı olan və hələ özünün Naxçıvanda işlədiyi illərdən istedadlı gənc teatr rəssamı kimi tanıdığı Məmməd Qasımovun namizədliyini tövsiyə etmişdir.</p>
                </div>
            </div>
            <div class="vc_item row">
                <div class="col-xl-6 col-lg-6 col-md-12 acrylic wow bounceIn">
                    <h2>Boya</h2>
                    <p>1971-ci ilin iyun ayında Naxçıvan Rəssamlar Təşkilatının yaradılmasına hazırlıq işlərinin tamamlanması barədə hökumət strukturlarına və Rəssamlar İttifaqına göstəriş verən ümummilli liderimiz yeni təşkilatın sədri vəzifəsinə bu məsələnin
                        əsas təşəbbüskarı olan və hələ özünün Naxçıvanda işlədiyi illərdən istedadlı gənc teatr rəssamı kimi tanıdığı Məmməd Qasımovun namizədliyini tövsiyə etmişdir.</p>
                </div>
                <div id="carouselExampleControls-two" class="carousel slide col-xl-6 col-lg-6 col-md-12" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <span class="carousel-line"></span>
                        <div class="carousel-item active">
                            <img src="assets/img/_DSC0487.JPG" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="assets/img/_DSC0488.JPG" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="assets/img/_DSC0501.JPG" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls-two" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls-two" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
            <div class="vc_item row">
                <div id="carouselExampleControls-three" class="carousel slide col-xl-6 col-lg-6 col-md-12" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <span class="carousel-line"></span>
                        <div class="carousel-item active">
                            <img src="assets/img/_DSC0488.JPG" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="assets/img/_DSC0497.JPG" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="assets/img/_DSC0487.JPG" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls-three" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls-three" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>

                </div>
                <div class="col-xl-6 col-lg-6 col-md-12 acrylic wow bounceIn">
                    <h2>Rəngkarlıq</h2>
                    <p>1971-ci ilin iyun ayında Naxçıvan Rəssamlar Təşkilatının yaradılmasına hazırlıq işlərinin tamamlanması barədə hökumət strukturlarına və Rəssamlar İttifaqına göstəriş verən ümummilli liderimiz yeni təşkilatın sədri vəzifəsinə bu məsələnin
                        əsas təşəbbüskarı olan və hələ özünün Naxçıvanda işlədiyi illərdən istedadlı gənc teatr rəssamı kimi tanıdığı Məmməd Qasımovun namizədliyini tövsiyə etmişdir.</p>
                </div>
            </div>
            <div class="vc_item row">
                <div class="col-xl-6 col-lg-6 col-md-12 acrylic wow bounceIn">
                    <h2>Heykəltəraşlıq</h2>
                    <p>1971-ci ilin iyun ayında Naxçıvan Rəssamlar Təşkilatının yaradılmasına hazırlıq işlərinin tamamlanması barədə hökumət strukturlarına və Rəssamlar İttifaqına göstəriş verən ümummilli liderimiz yeni təşkilatın sədri vəzifəsinə bu məsələnin
                        əsas təşəbbüskarı olan və hələ özünün Naxçıvanda işlədiyi illərdən istedadlı gənc teatr rəssamı kimi tanıdığı Məmməd Qasımovun namizədliyini tövsiyə etmişdir.</p>
                </div>
                <div id="carouselExampleControls-four" class="carousel slide col-xl-6 col-lg-6 col-md-12" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <span class="carousel-line"></span>
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="assets/img/_DSC0497.JPG" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="assets/img/_DSC0501.JPG" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="assets/img/_DSC0488.JPG" alt="Third slide">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls-four" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls-four" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <?php include 'includes/footer.php'; ?>
</body>

</html>