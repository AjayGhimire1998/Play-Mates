/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "@hotwired/turbo-rails";
import "controllers";
// console.log('Hello World from Webpacker')

window.handlePostFormToggler = function(){
    const toogleDiv = document.querySelector(".hidden-post-form"); 
    toogleDiv.style.display = "block";
}

window.handlePostFormClose = function(){
    const closeButton = document.querySelector(".close-post-form"); 
    closeButton.parentElement.parentElement.style.display = "none"
}

window.handleAddCategoryToggler = function(e){
  e.preventDefault();
  console.log(e);
  const toogleInputDiv = document.querySelector(".category-input");
  toogleInputDiv.style.display = "block";
}

// const clickButton = document.querySelector(".toggler");
// clickButton.addEventListener("click", (event) => {
//   event.preventDefault();
//   const toogleDiv = document.querySelector(".category-input");
//   toogleDiv.classList.add("category-input-show");
// });
