// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@rails/actioncable"
console.log('Hello from application.js')

document.addEventListener("DOMContentLoaded", function() {
    const avatarToggle = document.getElementById("avatar-toggle");
    const dropdownMenu = document.getElementById("dropdown-menu");


    avatarToggle.addEventListener("click", function() {
      dropdownMenu.classList.toggle("open");
    });
  });


  // window.onload = function() {
  //   const avatarToggle = document.getElementById("avatar-toggle");
  //   const dropdownMenu = document.getElementById("dropdown-menu");

  //   avatarToggle.addEventListener("mouseup", function() {
  //     dropdownMenu.classList.toggle("open");
  //   });
  // };
