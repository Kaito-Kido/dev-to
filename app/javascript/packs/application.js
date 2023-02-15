// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require rails-social-share-button

import Rails from "@rails/ujs";
import * as ActiveStorage from "@rails/activestorage";
Rails.start();
ActiveStorage.start();

import "channels";
import "./login";
import "./dropdown";
import "./edit_user";
import "./edit_post";
import "./comment";
import "trix";
import "@rails/actiontext";
import "select2/dist/css/select2.css";
import "bootstrap";
import "../stylesheets/application";
import "@hotwired/turbo-rails";
require("trix");
require("@rails/actiontext");
import "select2";
import ApexCharts from "apexcharts";
window.ApexCharts = ApexCharts;
