$(function () {
  'use strict';

  var pathName = $(location).attr('pathname');

  if ($('.map').length) {
    app.classGameplay.sendSession();
    app.classGameplay.dragDrop();
  }

  if ($('.groups-students').length) {
    app.gameSession.dragDrop();
    app.gameSession.addGroup();
  }

  if (/categories/.test(pathName)) {
    app.categories.addQuestions();
    app.categories.cancelQuestions();
    app.categories.addQuestion();
  }

  if (/student_gameplay/.test(pathName) || /class_gameplay/.test(pathName)) {
    app.teacherGameplay.storyModal();
  }

  if (/teacher_gameplay/.test(pathName)) {
    app.teacherGameplay.sendQuestion();
    app.teacherGameplay.addSupplies();
    app.teacherGameplay.assignSupplies();

    app.teacherGameplay.sendMessage();
    app.teacherGameplay.chooseCorrect();
    app.teacherGameplay.chooseNoGroup();
    app.notes.addNotes();
    app.teacherGameplay.highlightGroup();

  }

  if (/student_gameplay/.test(pathName)) {
    app.studentGameplay.statMenu();
    app.studentGameplay.answerCompetition();
    app.studentGameplay.closeMessage();

  }

  app.classGameplay.chooseWinner();
  app.classGameplay.closeWinner();

  app.gameSession.removePlaceholder();
  app.modalClose();


  var map = $('img.map');
  var canvas = $('canvas');

  canvas.attr({
    width: map.width(),
    height: map.height()
  });

});
