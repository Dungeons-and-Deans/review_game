// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.studentGameplay = {
  statMenu: function () {
    $('#nav-expander').on('click', function (e) {
      e.preventDefault();
      $('body').toggleClass('nav-expanded');
    });
    
    $('#nav-close').on('click', function (e) {
      e.preventDefault();
      $('body').removeClass('nav-expanded');
    });
  }
  
};