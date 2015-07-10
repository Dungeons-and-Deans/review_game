$(function () {
  'use strict';
  
  var pathName = $(location).attr('pathname');

  // if (!($('.simple_form#new_teacher').length || $('.login-group').length || /student_gameplay/.test(pathName))) {
  //   $('.nav').html($('#nav-links-teacher').html());
  //   console.log($('#nav-links-teacher').html());
  // }

  app.navActive(pathName);

  if ($('.map').length) {
    app.classGameplay.sendSession();
    app.classGameplay.dragDrop();
  }

  if ($('.groups-students').length) {
    app.gameSession.dragDrop();
  }
  
  if (/teacher_gameplay/.test(pathName)) {
    app.teacherGameplay.nextQuestion();
    
    $('button.choose-winner').on('click', function () {
      $('#myModal').toggleClass('active');
    });
    
    $('button.choose-winner-close').on('click', function () {
      $('#myModal').toggleClass('active');
    });
  }
  
  if (/student_gameplay/.test(pathName)) {
    app.studentGameplay.statMenu();
    
    $('.nav').html($('#nav-links-student').html());
  }
  

});
