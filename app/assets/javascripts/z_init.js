$(function () {
  'use strict';
  
  app.navActive($(location).attr('pathname'));

  if ($('.simple_form.new_teacher').length) {
    app.loginNoNav();
  }
  
  
  
});