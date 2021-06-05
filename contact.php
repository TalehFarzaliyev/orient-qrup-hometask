<!DOCTYPE html>
<html lang="en">

<?php include 'includes/header.php'; ?>

<body>
    <div id="go-up" class="header">

        <?php include 'includes/menu.php'; ?>

        <div class="menu-name"></div>
    </div>

    <?php include 'includes/theme.php'; ?>

    <div class="blog contact change-theme">
        <div class="section-header">
            <h2>ƏLAQƏ</h2>
            <div class="title-line">
                <img class="line" src="assets/img/title-line.png" alt="">
            </div>
        </div>
        <div class="row contact-section">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 map-section"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3092.284373037151!2d45.40836291472001!3d39.19098663719114!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40142e11821ed39b%3A0x5289940cb49c2ed6!2s38%20Heydar%20Aliyev%20street%2C%20Nakhchivan%2C%20Azerbaijan!5e0!3m2!1sen!2s!4v1618574974023!5m2!1sen!2s" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe></div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 contact-us">
                <h3 class="contact-header">Əlaqə məlumatları</h3>
                <div class="adress contact-item"><i class="fas fa-map-marker-alt contact-icon"></i><span>Ünvan: Naxçıvan
                        şəhəri, Heydər Əliyev küçəsi 38</span></div>
                <div class="phone contact-item"><i class="fas fa-mobile-alt contact-icon"></i><span>Telefon: </span>
                    <a href="tel:+994365455899" class="contact-link">(+994 36) 545-58-99</a>
                </div>
                <div class="email contact-item"><i class="far fa-envelope contact-icon"></i><span>E-poçt: </span>
                    <a href="mailto:" class="contact-link">ressamlarbirliyi@mail.ru</a>
                </div>
                <div class="social contact-item">
                    <a href=""><i class="fab fa-facebook-square"></i></a>
                    <a href=""><i class="fas fa-envelope-square"></i></a>
                    <a href=""><i class="fab fa-instagram-square"></i></a>
                    <a href=""><i class="fab fa-youtube-square"></i></a>
                </div>
            </div>
        </div>
        <div class="form-section container">
            <h3 class="form-header">Məktub göndər</h3>
            <form>
                <div class="form-log row">
                    <input class="form-input col-xl-6 col-lg-6 col-md-6 col-sm-12" type="name" name="name" placeholder="Ad">
                    <input class="form-input col-xl-6 col-lg-6 col-md-6 col-sm-12" type="email" name="email" placeholder="E-mail">
                </div>
                <input class="form-input form-item" type="text" name="movzu" placeholder="Mövzu">
                <textarea class="form-input form-item" name="textarea" cols="30" rows="10" placeholder="Məktub"></textarea>
                <button class="dark-text" type="submit" name="submit" value="submit">Göndər</button>
            </form>
        </div>
    </div>

    <?php include 'includes/footer.php'; ?>


</body>

</html>