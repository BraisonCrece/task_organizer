// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import jquery from 'jquery'
import "vanilla-nested";


window.jQuery = jquery
window.$ = jquery

$(function () {
  console.log("hello");
})