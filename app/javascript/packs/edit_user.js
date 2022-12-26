$(document).on("turbo:load", function () {
  $("#avatar_input").on("change", function (e) {
    readURL(this);
  });
});

// Preview image when uploading
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $("#img_prev").attr("src", e.target.result).width(48).height(48);
    };

    reader.readAsDataURL(input.files[0]);
  }
}
