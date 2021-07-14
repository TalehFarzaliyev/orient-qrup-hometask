<?php include $_SERVER['DOCUMENT_ROOT'].'/config/config.php'; ?>
<div id="theme-side" class="theme-color">
    <div class="main-theme">
        <p class="theme-header"><?=translate('select-style', $lang_name); ?></p>
        <p><?=translate('choose-theme', $lang_name); ?></p>
        <div class="theme-buttons">
            <button onclick="darkTheme();">
                <span class="color-icon" style="background-color: black;"></span>
                <span class="color-name"><?=translate('dark', $lang_name); ?></span>
            </button>
            <button onclick="lightTheme();">
                <span class="color-icon" style="background-color: white;"></span>
                <span class="color-name"><?=translate('light', $lang_name); ?></span>
            </button>
        </div>
        <p class="scheme"><?=translate('color-scheme', $lang_name); ?></p>
        <div class="all-colors">
            <div class="first-row">
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#A91C51" style="background-color: #A91C51"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#478BCA" style="background-color: #478BCA"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#8F5A28" style="background-color: #8F5A28"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#34818B" style="background-color: #34818B"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#B31F41" style="background-color: #B31F41"></button>
            </div>
            <div class="second-row">
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#01A0B5" style="background-color: #01A0B5"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#A27B36" style="background-color: #A27B36"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#DC4210" style="background-color: #DC4210"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#522B98" style="background-color: #522B98"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#A5BE25" style="background-color: #A5BE25"></button>
            </div>
            <div class="third-row">
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#CCDB38" style="background-color: #CCDB38"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#D36C5D" style="background-color: #D36C5D"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#F67F45" style="background-color: #F67F45"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#FE879B" style="background-color: #FE879B"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#BC549F" style="background-color: #BC549F"></button>
            </div>
            <div class="fourth-row">
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#0FACCF" style="background-color: #0FACCF"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#00A988" style="background-color: #00A988"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#08BBB7" style="background-color: #08BBB7"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#AF71B0" style="background-color: #AF71B0"></button>
                <button onclick="firstTheme(this);" class="color-button" data-color-type="#E3BE00" style="background-color: #E3BE00"></button>
            </div>
        </div>
        <button onclick="toggleTheme();" class="brush-icon">
            <div class="paint-brush"><i class="fas fa-paint-brush"></i></div>
        </button>
    </div>
</div>
<a href="#go-up" class="up-button">
    <span class="up-theme"><i class="fas fa-angle-double-up"></i></span>
</a>