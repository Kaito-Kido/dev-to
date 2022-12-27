$(document).on("turbo:load", function () {
  $("#cover-button").on("click", function () {
    console.log(1);
    $("#file-field").trigger("click");
  });

  var typingTimer;
  var doneTypingInterval = 4000;
  $("#content-field, #post_title").on("keyup", function () {
    clearTimeout(typingTimer);
    typingTimer = setTimeout(doneTyping, doneTypingInterval);
  });

  $("#content-field, #post_title").on("keydown", function () {
    clearTimeout(typingTimer);
  });

  $("#file-field").on("change", function () {
    clearTimeout(typingTimer);
    typingTimer = setTimeout(doneTyping, doneTypingInterval);
  });

  function doneTyping() {
    $("#autosave").trigger("click");
    console.log(1);
  }
});
