// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("bootstrap")
require("select2")
// require ("packs/custome")
// require ("packs/post.js")
import 'bootstrap';
//import swal from 'sweetalert';
require ("data-confirm-modal")

// require jquery
// require jquery_ujs

console.log("Hello from app/javascript/packs/application.js!");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


import { select2 } from '../channels/select2.js';
import { progressBar } from '../channels/progress-bar.js';

document.addEventListener("turbolinks:load", function() {
  progressBar();
});

// import  { initSweetalert } from '../channels/init_sweetalert.js';


// initSweetalert('.btn-flat-green', {
//   title: "Are you sure?",
//   text: "This action cannot be reversed",
//   icon: "warning"
// }, (value) => {
//   if (value) { console.log("hello")
//     const link = document.querySelector('#sweet-alert-demo');
//     link.click();
//   }
// });




