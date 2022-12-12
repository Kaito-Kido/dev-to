// document.addEventListener("turbolinks:load", () => {
//   var button = document.getElementById("drop-button");
//   button.addEventListener("click", function (event) {
//     var menu = document.getElementById("menu");
//     console.log(menu);
//     if (menu.style.display == "flex") {
//       menu.style.display = "none";
//     } else {
//       menu.style.display = "flex";
//     }
//   });
//   window.addEventListener("click", function (event) {
//     var menu = document.getElementById("menu");
//     if (
//       !menu.contains(event.target) &&
//       !button.contains(event.target) &&
//       menu.style.display == "flex"
//     ) {
//       menu.style.display = "none";
//     }
//   });
// });
$(document).on("turbolinks:load", function () {
  $("#drop-button").on("click", function () {
    if ($("#menu").is(":visible")) {
      $("#menu").hide();
    } else {
      $("#menu").show();
    }
  });

  $(window).on("click", function (e) {
    var button = $("#drop-button");
    // console.log(button.has(e.target));
    if (button !== e.target && !button.has(e.target).length) {
      $("#menu").hide();
    }
  });
});
