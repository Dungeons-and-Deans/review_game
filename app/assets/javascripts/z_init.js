$(function () {
  'use strict';
  
  if (!($('.simple_form#new_teacher').length || $('.login-group').length)) {
    $('.nav').html($('#nav-links').html());
  }
  
  app.navActive($(location).attr('pathname'));
  
  
  if ($('.map').length) {
    app.classGameplay.dragDrop();
  }
  
  if ($('.groups-students').length) {
    app.gameSession.dragDrop();
  }
  
});