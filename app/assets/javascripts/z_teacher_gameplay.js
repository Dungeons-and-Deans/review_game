// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.teacherGameplay = {
  nextQuestion: function () {
    var groupId = $('.current-group').attr('id');

    $('#send-question').on('click', function () {
      dispatcher.trigger('movements.ask_question', channelNumber);
    });

    $('#send-competition-question').on('click', function () {
      var ids = [];
      var childs = $("#group-choices").children();

      for (var i = 0; i < childs.length; i++) {
        if (childs[i].classList.contains('active')) {
          ids.push(childs[i].id);
        }
      }

      dispatcher.trigger('movements.ask_competition_question', ids);
    });
  }
};
