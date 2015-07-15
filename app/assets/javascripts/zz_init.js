$(function () {
  'use strict';

  var pathName = $(location).attr('pathname');

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

  if (/student_gameplay/.test(pathName) || /class_gameplay/.test(pathName)) {
    app.teacherGameplay.storyModal();
  }

  if (/teacher_gameplay/.test(pathName)) {
    app.teacherGameplay.sendQuestion();
    app.teacherGameplay.addSupplies();
    app.teacherGameplay.assignSupplies();
    app.teacherGameplay.chooseWinner();
    app.teacherGameplay.closeWinner();
    app.teacherGameplay.sendMessage();
    app.notes.addNotes();

  }

  if (/student_gameplay/.test(pathName)) {
    app.studentGameplay.statMenu();
    app.studentGameplay.answerCompetition();
    app.studentGameplay.closeMessage();

  }

  app.gameSession.modalClose();
});
