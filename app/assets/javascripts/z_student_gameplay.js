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
    
    $('.main-menu').navgoco({
      caret: 'span class="caret"></span>',
      accordion: false,
      openClass: 'open',
      save: true,
      cookie: {
        name: 'navgoco',
        expires: false,
        path: '/'
      },
      slide: {
        duration: 300,
        easing: 'swing'
      }
    });
  }
}