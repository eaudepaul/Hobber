import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="startup"
export default class extends Controller {
  connect() {

  const avatarToggle = document.getElementById("avatar-toggle");
  const dropdownMenu = document.getElementById("dropdown-menu");


  avatarToggle.addEventListener("click", function() {
    dropdownMenu.classList.toggle("open");
  });


// window.onload = function() {
//   const avatarToggle = document.getElementById("avatar-toggle");
//   const dropdownMenu = document.getElementById("dropdown-menu");

//   avatarToggle.addEventListener("mouseup", function() {
//     dropdownMenu.classList.toggle("open");
//   });
// };


  const mygameslist = document.getElementById('mygameslist');
  if (mygameslist && mygameslist.innerHTML.trim() === '') {
    mygameslist.style.display = 'none';
  }

  }
}
