// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.teacherGameplay = {
  nextQuestion: function () {
    var groupId = $('.current-group').attr('id');

    $('#send-question').on('click', function () {
      dispatcher.trigger('movements.ask_question', channelNumber);
    });
  }
};
