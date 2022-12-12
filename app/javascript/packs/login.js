document.addEventListener("turbolinks:load", () => {
  var button = document.getElementById("drop-button");
  button.addEventListener("click", function (event) {
    var menu = document.getElementById("menu");
    console.log(menu);
    if (menu.style.display == "flex") {
      menu.style.display = "none";
    } else {
      menu.style.display = "flex";
    }
  });
  window.addEventListener("click", function (event) {
    var menu = document.getElementById("menu");
    if (
      !menu.contains(event.target) &&
      !button.contains(event.target) &&
      menu.style.display == "flex"
    ) {
      menu.style.display = "none";
    }
  });
});
