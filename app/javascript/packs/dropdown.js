$(document).on("turbo:load", function () {
  $('img[id^="drop-comment-"]').on("click", function (e) {
    const id = e.currentTarget.id.match(/\d+/)[0];
    if ($("#edit-comment-" + id).is(":visible")) {
      $("#edit-comment-" + id).hide();
    } else {
      $('div[id^="edit-comment-"]').hide();
      $("#edit-comment-" + id).show();
      $("#edit-comment-" + id).css("display", "flex");
    }
  });

  $('img[id^="drop-post-"]').on("click", function (e) {
    const id = e.currentTarget.id.match(/\d+/)[0];
    if ($("#edit-post-" + id).is(":visible")) {
      $("#edit-post-" + id).hide();
    } else {
      $('div[id^="edit-post-"]').hide();
      $("#edit-post-" + id).show();
      $("#edit-post-" + id).css("display", "flex");
    }
  });

  $(window).on("click", function (e) {
    var buttons = $('img[id^="drop-comment-"]');
    if (buttons !== e.target && !check(buttons, e.target)) {
      $('div[id^="edit-comment-"]').hide();
    }

    var drop_buttons = $('img[id^="drop-post-"]');
    if (drop_buttons !== e.target && !check(drop_buttons, e.target)) {
      $('div[id^="edit-post-"]').hide();
    }
  });
});

function check(arr, target) {
  for (i = 0; i < arr.length; i++) {
    if (arr[i] == target) {
      return true;
    }
  }
  return false;
}
