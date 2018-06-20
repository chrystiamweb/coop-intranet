$(document).on('turbolinks:load', function() {
  $('.sidenav').sidenav();
  $('.slider').slider({
    height: 600
  });
  closeOnClick: true
});

document.addEventListener("turbolinks:before-cache", function() {
  $('.sidenav').sidenav('destroy');
  $('.slider').slider('destroy');
});