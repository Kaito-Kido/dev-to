const { environment } = require("@rails/webpacker");

const webpack = require("webpack");
const jquery = require("./loaders/jquery");

// Add Webpack loaders
environment.loaders.append("jquery", jquery);
environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    Popper: ["popper.js", "default"],
  })
);

module.exports = environment;
