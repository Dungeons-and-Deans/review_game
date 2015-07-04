$(function () {
  'use strict';
  
  var path = $(location).attr('pathname');
  
  $('.nav').find('.active').removeClass('active');
  
  if ($('.simple_form.new_teacher').length) {
    app.loginNoNav();
  }
  
  if (path.length === 1 || (/games/.test(path))) {
    $('.nav .home').addClass('active');
  } else if (/students/.test(path)) {
    $('.nav .roster').addClass('active');
  } else if (/categories/.test(path)) {
    $('.nav .categories').addClass('active');
  }
  
});