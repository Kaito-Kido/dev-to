$(document).on("turbo:load", function () {
  $("#cover-button").on("click", function () {
    $("#file-field").trigger("click");
  });

  var typingTimer;
  var doneTypingInterval = 1000;

  // Catch attach and remove attach event
  $("body").on("trix-attachment-add", function () {
    clearTimeout(typingTimer);
    typingTimer = setTimeout(doneTyping, doneTypingInterval);
  });
  $("body").on("trix-attachment-remove", function () {
    clearTimeout(typingTimer);
    typingTimer = setTimeout(doneTyping, doneTypingInterval);
  });

  // catching typing event on editor for auto save
  $("#content-field, #post-title").on("keydown", function () {
    clearTimeout(typingTimer);
  });
  $("#content-field, #post-title").on("keyup", function () {
    clearTimeout(typingTimer);
    typingTimer = setTimeout(doneTyping, doneTypingInterval);
  });

  // catching change on cover for autosave
  $("#file-field").on("change", function () {
    readURL(this);
    clearTimeout(typingTimer);
    typingTimer = setTimeout(doneTyping, doneTypingInterval);
  });
  function doneTyping() {
    $("#loading-status").text("loading...").fadeIn().delay(1000);
    $("#autosave").trigger("click");
  }
});

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $("#cover-prev").attr("src", e.target.result);
    };

    reader.readAsDataURL(input.files[0]);
  }
}
