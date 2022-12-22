$(document).on("turbo:load", function () {
  // Catch event of all the dropdown of comment button
  $('img[id^="drop-comment-"]').on("click", function (e) {
    const id = e.currentTarget.id.match(/\d+/)[0];
    // If the menu is showing, hide it
    if ($("#edit-comment-" + id).is(":visible")) {
      $("#edit-comment-" + id).hide();
    }
    // Else hide all the other menu and show the menu that we click
    else {
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
    // Get the list of dropdown button element
    var buttons = $('img[id^="drop-comment-"]');
    // If the target element not in list of elements, hide all of them.
    if (!check(buttons, e.target)) {
      $('div[id^="edit-comment-"]').hide();
    }

    var drop_buttons = $('img[id^="drop-post-"]');
    if (drop_buttons !== e.target && !check(drop_buttons, e.target)) {
      $('div[id^="edit-post-"]').hide();
    }
  });
});

// Check whether the target element belongs to list of element.
function check(arr, target) {
  for (i = 0; i < arr.length; i++) {
    if (arr[i] == target) {
      return true;
    }
  }
  return false;
}
