$(document).on("turbo:load", function () {
  $("#cover-button").on("click", function () {
    console.log(1);
    $("#file-field").trigger("click");
  });

  var typingTimer;
  var doneTypingInterval = 3000;

  $("#content-field").on("blur", function () {
    doneTyping();
  });
  $("#file-field").on("blur", function () {
    doneTyping();
  });
  $("#post-title").on("blur", function () {
    doneTyping();
  });

  function doneTyping() {
    $("#autosave").trigger("click");
    console.log(1);
  }
});
