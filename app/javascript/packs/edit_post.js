$(document).on("turbo:load", function () {
  $("#cover-button").on("click", function () {
    $("#file-field").trigger("click");
  });

  var typingTimer;
  var doneTypingInterval = 10000;

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
  $("#content-field").on("keydown", function () {
    clearTimeout(typingTimer);
  });
  $("#content-field").on("keyup", function () {
    clearTimeout(typingTimer);
    typingTimer = setTimeout(doneTyping, doneTypingInterval);
  });

  // catching typing event on title editor for auto save
  $("#post-title").on("keyup", function (e) {
    clearTimeout(typingTimer);
    typingTimer = setTimeout(doneTyping, doneTypingInterval);
  });
  $("#post-title").on("keydown", function () {
    clearTimeout(typingTimer);
  });

  // catching change on cover for autosave
  $("#file-field").on("change", function () {
    readURL(this);
    clearTimeout(typingTimer);
    typingTimer = setTimeout(doneTyping, doneTypingInterval);
  });
  function doneTyping() {
    $("#autosave").trigger("click");
  }

  // Control + s to save

  $("#post-container-title").on("dragover", function (e) {
    e.preventDefault();
    e.stopPropagation();
  });
  $("#post-container-title").on("dragenter", function (e) {
    e.preventDefault();
    e.stopPropagation();
  });

  // $("#post-container-title").on("drop", function (e) {
  //   if (
  //     e.originalEvent.dataTransfer &&
  //     e.originalEvent.dataTransfer.files.length
  //   ) {
  //     e.preventDefault();
  //     e.stopPropagation();
  //     /*UPLOAD FILES HERE*/

  //     // $("#file-field").value = e.originalEvent.dataTransfer.files;
  //   }
  // });
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
