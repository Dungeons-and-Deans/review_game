// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.teacherGameplay = {

  sendQuestion: function () {
    $('#send-question').on('click', function () {
      var ids = [];
      var checkboxArr = document.querySelectorAll('#group-choices input[type="checkbox"]');

      for (var i = 0; i < checkboxArr.length; i++) {
        if (checkboxArr[i].checked === true) {
          ids.push(checkboxArr[i].value);
        }
      }

      var info = {
        ids: ids,
        gameSession: parseInt(channelNumber)
      }

      if (ids.length > 1) {
        dispatcher.trigger('movements.ask_competition_question', info);
        $('#list-competition-answers').empty();
        $('#list-competition-answers').append("<li><h4>Groups Answered:</h4></li>");
      } else {
        var groupId = ids[0];
        dispatcher.trigger('movements.ask_question', channelNumber);
        $("#answerButtonsModal").toggleClass('active');
      };
    });
  },

  addSupplies: function () {
    $('#addSupplies').on('click', function (e) {
      e.stopPropagation();


      $('#suppliesModal').addClass('active');
    })
  },

  assignSupplies: function () {
    $('#assignSupplies').on('click', function (e) {
      e.stopPropagation();

      $('#suppliesModal').removeClass('active');
    })
  },

  chooseWinner: function () {
    $('button.choose-winner').on('click', function () {
      $('#myModal').toggleClass('active');
    });
  },

  closeWinner: function () {
    $('button.choose-winner-close').on('click', function () {
      $('#myModal').toggleClass('active');
    });
  },

  sendMessage: function () {
    $("#send-message").on('click', function () {
      $("#sendMessageModal").toggleClass('active');
    })
  },

  storyModal: function () {
    $("button.story-close").on('click', function () {
      $("#storyModal").toggleClass('inactive');
    });
  },

  chooseCorrect: function () {
    $('#list-competition-answers').delegate('button.correct', 'click', function() {
      console.log("hi")
    });
  }

};
