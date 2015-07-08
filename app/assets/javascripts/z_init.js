$(function () {
  'use strict';

  if (!($('.simple_form#new_teacher').length || $('.login-group').length)) {
    $('.nav').html($('#nav-links').html());
  }

  app.navActive($(location).attr('pathname'));


  if ($('.map').length) {
    app.classGameplay.sendSession();
    app.classGameplay.dragDrop();
  }

  if ($('.groups-students').length) {
    app.gameSession.dragDrop();
  }
<<<<<<< HEAD

  $("#send-question").on('click', function () {
    console.log('hi');
    var game_session_id = 1
    dispatcher.trigger('movements.ask_question', game_session_id);
  });



});
=======
  
  if ($('#category-name').length) {

  }
  
});
>>>>>>> afd51df6af6e56f6533067d7dab94de2ba1568d0
