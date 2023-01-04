$(document).on("turbo:load", function () {
  $('a[id^="reply-button"]').on("click", function (e) {
    const id = e.currentTarget.id.match(/\d+/)[0];
    $("#reply-button-" + id).hide();
    $("#reply-area-" + id).removeClass("hide");
  });

  $('div[id^="dismiss-btn"]').on("click", function (e) {
    const id = e.currentTarget.id.match(/\d+/)[0];
    $("#reply-button-" + id).show();
    $("#reply-area-" + id).addClass("hide");
  });
});
