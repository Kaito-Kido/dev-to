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
    if (button !== e.target && !button.has(e.target).length) {
      $("#menu").hide();
    }
  });
});
