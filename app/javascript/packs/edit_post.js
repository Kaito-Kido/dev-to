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
  $("#file-field, #select-box").on("change", function () {
    readURL(this);
    clearTimeout(typingTimer);
    typingTimer = setTimeout(doneTyping, doneTypingInterval);
  });
  function doneTyping() {
    $("#loading-status").text("loading...").fadeIn().delay(1000);
    $("#autosave").trigger("click");
  }

  $("#select-box").select2({
    theme: "classic",
    placeholder: "Add tag",
    tags: true,
    tokenSeparators: [",", " "],
    maximumSelectionLength: 4,
    width: "100%",
    closeOnSelect: false,
    templateSelection: formatState,
    templateResult: formatState,
  });

  $("#select-box").on("select2:select", function (e) {
    var data = e.params.data;
    var post_id = $("#select-box").data("post-id");
    if (isNaN(data.id)) {
      $.ajax({
        type: "POST",
        url: "/posts/" + post_id + "/categories",
        dataType: "json",
        data: { category_name: data.text },
        error: function (e) {
          console.log(e);
        },
      });
    } else {
      $.ajax({
        type: "POST",
        url: "/posts/" + post_id + "/tags",
        dataType: "json",
        data: { category_id: data.id },
      });
    }
  });

  $("#select-box").on("select2:unselect", function (e) {
    var data = e.params.data;
    // var post_id = $("#select-box").data("post-id");
    // $.ajax({
    //   type: "DELETE",
    //   url: "/posts/" + post_id + "/tags/" + data.id,
    //   dataType: "json",
    //   data: { category_id: data.id },
    // });
  });
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

function formatState(state) {
  return "#" + state.text;
}
