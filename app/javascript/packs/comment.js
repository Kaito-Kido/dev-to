$(document).on("turbo:load", function () {
  $(document).on("click", 'a[id^="reply-button"]', function (e) {
    const id = e.currentTarget.id.match(/\d+/)[0];
    $("#reply-button-" + id).hide();
    $("#reply-area-" + id).removeClass("hide");
  });

  $(document).on("click", 'div[id^="dismiss-btn"]', function (e) {
    const id = e.currentTarget.id.match(/\d+/)[0];
    $("#reply-button-" + id).show();
    $("#reply-area-" + id).addClass("hide");
  });
});
