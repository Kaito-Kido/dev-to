$(document).on("turbo:load", function () {
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

  $("#bell-button").on("click", function () {
    if ($("#noti-menu").is(":visible")) {
      $("#noti-menu").hide();
    } else {
      $("#noti-menu").show();
    }
  });

  $(window).on("click", function (e) {
    var bell_button = $("#bell-button");
    if (bell_button[0] !== e.target && !bell_button.has(e.target).length) {
      $("#noti-menu").hide();
    }
  });
});
