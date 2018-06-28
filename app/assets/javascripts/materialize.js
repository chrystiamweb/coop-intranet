$(document).on('turbolinks:load', function() {
  $('.sidenav').sidenav();
  $('.slider').slider({
    height: $('.slider').height(),
    closeOnClick: true
  });  
  $('.collapsible').collapsible();
  $('select').formSelect();
  
 
});

document.addEventListener("turbolinks:before-cache", function() {
  $('.sidenav').sidenav('destroy');
  $('.slider').slider('destroy');
  $('.collapsible').collapsible('destroy');
 
});

$(window).resize(function(){
  $('.slider').slider({
    height: $('.slider').height(),    
  });  
});