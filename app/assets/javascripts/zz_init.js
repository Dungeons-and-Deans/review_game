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
  
  if (/categories/.test(pathName)) {
    app.categories.addQuestions();
    app.categories.cancelQuestions();
    app.categories.addQuestion();
  }

  if (/teacher_gameplay/.test(pathName)) {
    app.teacherGameplay.sendQuestion();
    app.teacherGameplay.sendCompQuestion();
    app.teacherGameplay.addSupplies();
    app.teacherGameplay.assignSupplies();
    app.teacherGameplay.chooseWinner();
    app.teacherGameplay.closeWinner();
    app.teacherGameplay.answerButtons();
    
  }

  if (/student_gameplay/.test(pathName)) {
    app.studentGameplay.statMenu();

    $('.nav').html($('#nav-links-student').html());
  }




});
