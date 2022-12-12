document.addEventListener("turbolinks:load", () => {
  var button = document.getElementById("drop-button");
  var menu = document.getElementById("menu");
  button.addEventListener("click", function (event) {
    if (menu.style.display == "none") {
      menu.style.display = "flex";
    } else {
      menu.style.display = "none";
    }
  });
  window.addEventListener("click", function (event) {
    if (
      !menu.contains(event.target) &&
      !button.contains(event.target) &&
      menu.style.display == "flex"
    ) {
      menu.style.display = "none";
    }
  });
});
