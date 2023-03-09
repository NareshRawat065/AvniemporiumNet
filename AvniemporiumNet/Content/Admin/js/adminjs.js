
//  sticky header  //
window.addEventListener("scroll", function () {
    var header = document.querySelector("header");
    header.classList.toggle("sticky", window.scrollY > 0);

})
//  sticky header  //

function headerwhite() {
    $("#whheader").toggleClass("header-bg");
}


function showntbox(e) {
    $(".ntbox").removeClass("ntboxextend");
    $(e).find(".ntbox").addClass("ntboxextend");
}

function sidebarActive(e) {
    $(".sidebarnav").removeClass("activeSide");
    $(e).find(".sidebarnav").toggleClass("activeSide");
}

function profileboxshow() {
    $(".profilelogoutbox").toggleClass("profilelogoutboxshow");
}

function showSidebarMain() {
    $(".sidebarMain").toggle();
}

function showbannerform(e) {
    $(".tabbannerform ").hide("");
    $(e).closest(".whitecard").find(".tabbannerform").show("");
    $(".arrowdown").toggleClass("arrowup")
}


$(document).ready(function () {
    $('#summernote').summernote();
    $('#summernote1').summernote();
});









