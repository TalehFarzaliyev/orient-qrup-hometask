var miniMenu = document.querySelector('.menu-items'),
    menuSide = document.querySelector('.menu-side'),
    themeSide = document.getElementById("theme-side"),
    changeTheme = document.querySelectorAll(".change-theme"),
    menuItem = document.querySelectorAll('.hover-color'),
    hovertextItem = document.querySelectorAll(".hovertext-item"),
    darkText = document.querySelectorAll(".dark-text"),
    seeMore = document.querySelectorAll(".see-more"),
    upTheme = document.querySelector(".up-theme"),
    upThemeIcon = document.querySelector(".fa-angle-double-up"),
    blogButton = document.querySelectorAll(".view_button"),
    footerColor = document.querySelector("footer"),
    changeButtonColor = document.querySelectorAll('.change_button_color'),
    footerItem = document.querySelectorAll(".footer-item"),
    contactLink = document.querySelectorAll('.contact-link'),
    formColor = document.querySelectorAll(".form-input"),
    linkHover = document.querySelectorAll(".linkhover"),
    circle = document.querySelectorAll('.circle'),
    icons = document.querySelectorAll('.icons'),
    moreButton = document.querySelectorAll('.more_button');

window.addEventListener('DOMContentLoaded', (event) => {
    jQuery(window).scroll(function() {
        if (jQuery(window).scrollTop() > 0) {
            jQuery('.menu-side').css("background-color", "rgba(0, 0, 0, 0.8)");
            jQuery('.menu-side').css("padding", "0px 0");
            jQuery('.logo-item').css("transform", "scale(.8)");
        } else {
            jQuery('.menu-side').css("background-color", "transparent");
            jQuery('.menu-side').css("padding", "15px 0");
            jQuery('.logo-item').css("transform", "scale(1)");
        }
    });
});

function showMenu() {
    if (miniMenu.style.visibility == "visible") {
        miniMenu.style.visibility = "hidden";
        miniMenu.style.height = "0px";
    } else {
        miniMenu.style.visibility = "visible";
        miniMenu.style.height = "auto";
    }
}

function toggleTheme() {
    if ($(window).width() < 560) {
        if (themeSide.style.marginLeft === "-24px") {
            themeSide.style.marginLeft = "-212px";
        } else {
            themeSide.style.marginLeft = "-24px";
        }
    } else {
        if (themeSide.style.marginLeft === "0px") {
            themeSide.style.marginLeft = "-235px";
        } else {
            themeSide.style.marginLeft = "0px";
        }
    }
}




function lightTheme() {
    for (var i = 0; i < changeTheme.length; i++) {
        changeTheme[i].style.backgroundColor = "#fff";
        changeTheme[i].style.color = "#000";
        for (var b = 0; b < hovertextItem.length; b++) {
            hovertextItem[b].style.color = "#fff"
        }
    }
    for (var i = 0; i < darkText.length; i++) {
        darkText[i].style.color = "#000";
        darkText[i].addEventListener("mouseenter", (event) => { event.target.style.color = "#fff" });
        darkText[i].addEventListener("mouseleave", (event) => { event.target.style.color = "#000" });
    }
    for (var i = 0; i < seeMore.length; i++) {
        seeMore[i].style.color = "#000";
        seeMore[i].addEventListener("mouseenter", (event) => { event.target.style.color = "#fff" });
        seeMore[i].addEventListener("mouseleave", (event) => { event.target.style.color = "#000" });
    }
    for (var c = 0; c < blogButton.length; c++) {
        blogButton[c].style.color = "#000";
        let buttonColor = blogButton[c].style.backgroundColor;
        blogButton[c].addEventListener("mouseenter", (event) => { event.target.style.backgroundColor = "#000", event.target.style.color = buttonColor });
        blogButton[c].addEventListener("mouseleave", (event) => { event.target.style.backgroundColor = buttonColor, event.target.style.color = "#000" });
    }
    for (var c = 0; c < moreButton.length; c++) {
        moreButton[c].style.color = "#000";
        let buttonColor = moreButton[c].style.backgroundColor;
        moreButton[c].addEventListener("mouseenter", (event) => { event.target.style.backgroundColor = "#000", event.target.style.color = buttonColor });
        moreButton[c].addEventListener("mouseleave", (event) => { event.target.style.backgroundColor = buttonColor, event.target.style.color = "#000" });
    }
    for (var c = 0; c < changeButtonColor.length; c++) {
        changeButtonColor[c].style.color = "#000";
        let buttonColor = changeButtonColor[c].style.backgroundColor;
        changeButtonColor[c].addEventListener("mouseenter", (event) => { event.target.style.backgroundColor = "#000", event.target.style.color = buttonColor });
        changeButtonColor[c].addEventListener("mouseleave", (event) => { event.target.style.backgroundColor = buttonColor, event.target.style.color = "#000" });
    }
    for (var i = 0; i < formColor.length; i++) {
        formColor[i].style.backgroundColor = "#d6d3d3";
        formColor[i].style.borderColor = "#bebaba";
        formColor[i].addEventListener("focus", (event) => { event.target.style.borderColor = "#4d4a4a" });
        formColor[i].addEventListener("blur", (event) => { event.target.style.borderColor = "#bebaba" });
    }
    footerColor.style.background = "#fff";
    document.body.style.background = "#fff";
}

function darkTheme() {
    for (var i = 0; i < changeTheme.length; i++) {
        changeTheme[i].style.backgroundColor = "#000";
        changeTheme[i].style.color = "#fff";
    }
    for (var i = 0; i < darkText.length; i++) {
        darkText[i].style.color = "#fff";
        darkText[i].addEventListener("mouseenter", (event) => { event.target.style.color = "#fff" });
        darkText[i].addEventListener("mouseleave", (event) => { event.target.style.color = "#fff" });
    }
    for (var i = 0; i < seeMore.length; i++) {
        seeMore[i].style.color = "#fff";
        seeMore[i].addEventListener("mouseenter", (event) => { event.target.style.color = "#fff" });
        seeMore[i].addEventListener("mouseleave", (event) => { event.target.style.color = "#fff" });
    }
    for (var c = 0; c < blogButton.length; c++) {
        blogButton[c].style.color = "#fff";
        let buttonColor = blogButton[c].style.backgroundColor;
        blogButton[c].addEventListener("mouseenter", (event) => { event.target.style.backgroundColor = "#fff", event.target.style.color = buttonColor });
        blogButton[c].addEventListener("mouseleave", (event) => { event.target.style.backgroundColor = buttonColor, event.target.style.color = "#fff" });
    }
    for (var c = 0; c < moreButton.length; c++) {
        moreButton[c].style.color = "#fff";
        let buttonColor = moreButton[c].style.backgroundColor;
        moreButton[c].addEventListener("mouseenter", (event) => { event.target.style.backgroundColor = "#fff", event.target.style.color = buttonColor });
        moreButton[c].addEventListener("mouseleave", (event) => { event.target.style.backgroundColor = buttonColor, event.target.style.color = "#fff" });
    }
    for (var c = 0; c < changeButtonColor.length; c++) {
        changeButtonColor[c].style.color = "#fff";
        let buttonColor = changeButtonColor[c].style.backgroundColor;
        changeButtonColor[c].addEventListener("mouseenter", (event) => { event.target.style.backgroundColor = "#fff", event.target.style.color = buttonColor });
        changeButtonColor[c].addEventListener("mouseleave", (event) => { event.target.style.backgroundColor = buttonColor, event.target.style.color = "#fff" });
    }
    for (var i = 0; i < formColor.length; i++) {
        formColor[i].style.backgroundColor = "#252525";
        formColor[i].style.borderColor = "rgba(255, 255, 255, 0.15)";
        formColor[i].addEventListener("click", (event) => { event.target.style.borderColor = "rgba(255, 255, 255, 0.35)" });
        formColor[i].addEventListener("blur", (event) => { event.target.style.borderColor = "rgba(255, 255, 255, 0.15)" });
    }
    footerColor.style.background = "#000";
    document.body.style.background = "#000";
}

function firstTheme(color) {
    var thisColor = color.getAttribute("data-color-type");
    for (var i = 0; i < menuItem.length; i++) {
        let origColorStyle = menuItem[i].style.color;
        menuItem[i].addEventListener("mouseenter", (event) => { event.target.style.color = thisColor });
        menuItem[i].addEventListener("mouseleave", (event) => { event.target.style.color = origColorStyle })
    }
    for (var a = 0; a < darkText.length; a++) {
        let origColorStyle = darkText[a].style.backgroundColor;
        let bordersColor = darkText[a].style.borderColor;
        darkText[a].addEventListener("mouseenter", (event) => { event.target.style.backgroundColor = thisColor, event.target.style.borderColor = thisColor });
        darkText[a].addEventListener("mouseleave", (event) => { event.target.style.backgroundColor = origColorStyle, event.target.style.borderColor = bordersColor });
    }
    for (var a = 0; a < seeMore.length; a++) {
        let origColorStyle = seeMore[a].style.backgroundColor;
        let bordersColor = seeMore[a].style.borderColor;
        seeMore[a].addEventListener("mouseenter", (event) => { event.target.style.backgroundColor = thisColor, event.target.style.borderColor = thisColor });
        seeMore[a].addEventListener("mouseleave", (event) => { event.target.style.backgroundColor = origColorStyle, event.target.style.borderColor = bordersColor });
    }
    for (var c = 0; c < blogButton.length; c++) {
        blogButton[c].style.backgroundColor = thisColor;
        let buttonColor = blogButton[c].style.backgroundColor,
            fontColor = blogButton[c].style.color;
        blogButton[c].addEventListener("mouseenter", (event) => { event.target.style.backgroundColor = fontColor, event.target.style.color = buttonColor });
        blogButton[c].addEventListener("mouseleave", (event) => { event.target.style.backgroundColor = buttonColor, event.target.style.color = fontColor });
    }
    for (var c = 0; c < moreButton.length; c++) {
        moreButton[c].style.backgroundColor = thisColor;
        let buttonColor = moreButton[c].style.backgroundColor,
            fontColor = moreButton[c].style.color;
        moreButton[c].addEventListener("mouseenter", (event) => { event.target.style.backgroundColor = fontColor, event.target.style.color = buttonColor });
        moreButton[c].addEventListener("mouseleave", (event) => { event.target.style.backgroundColor = buttonColor, event.target.style.color = fontColor });
    }
    for (var c = 0; c < changeButtonColor.length; c++) {
        changeButtonColor[c].style.backgroundColor = thisColor;
        let buttonColor = changeButtonColor[c].style.backgroundColor,
            fontColor = changeButtonColor[c].style.color;
        changeButtonColor[c].addEventListener("mouseenter", (event) => { event.target.style.backgroundColor = fontColor, event.target.style.color = buttonColor });
        changeButtonColor[c].addEventListener("mouseleave", (event) => { event.target.style.backgroundColor = buttonColor, event.target.style.color = fontColor });
    }
    for (var b = 0; b < footerItem.length; b++) {
        let origColorStyle = footerItem[b].style.color;
        footerItem[b].addEventListener("mouseenter", (event) => { event.target.style.color = thisColor });
        footerItem[b].addEventListener("mouseleave", (event) => { event.target.style.color = origColorStyle })
    }
    for (var i = 0; i < contactLink.length; i++) {
        contactLink[i].style.color = thisColor;
    }
    for (var i = 0; i < linkHover.length; i++) {
        linkHover[i].style.backgroundColor = thisColor;
        linkHover[i].style.opacity = "0.7";
    }
    for (i = 0; i < circle.length; i++) {
        circle[i].addEventListener("mouseenter", (event) => { event.target.firstChild.style.color = thisColor });
        circle[i].addEventListener("mouseleave", (event) => { event.target.firstChild.style.color = "#fff" });
    }
    upTheme.style.background = thisColor;
    upTheme.addEventListener("mouseenter", (event) => { event.target.style.backgroundColor = "#fff", upThemeIcon.style.color = thisColor });
    upTheme.addEventListener("mouseleave", (event) => { event.target.style.backgroundColor = thisColor, upThemeIcon.style.color = "#fff" });
}

$(document).ready(function() {
    $('.owl-carousel').owlCarousel({
        loop: true,
        margin: 30,
        nav: true,
        responsive: {
            0: {
                items: 1
            },
            577: {
                items: 2
            },
            1100: {
                items: 3
            },
            1200: {
                items: 4
            }
        }
    })
});