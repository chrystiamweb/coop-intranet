$(document).on('turbolinks:load', function() {
  $('.sidenav').sidenav();
  closeOnClick: true
});

document.addEventListener("turbolinks:before-cache", function() {
  $('.sidenav').sidenav('destroy');
});