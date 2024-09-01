$(document).ready(function () {
    $(".fav").on("click", function () {
        const imgFollow = $(this);
        $.post("changeFav.php", { idKonsultanta: imgFollow.data("konsult") }, function (data) {
            if (data === "sukces") {
                imgFollow.attr("src", imgFollow.attr("src") === "./Obrazki/follow.png" ? "./Obrazki/followed.png" : "./Obrazki/follow.png");
            }
        });
    });
});
