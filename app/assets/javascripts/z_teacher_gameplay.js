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
        $('#list-competition-answers').append("<li><h4>Groups Answered:</h4></li>");
        $('#list-competition-answers').append("<li><button class='end mdl-button mdl-js-button mdl-button--primary'><i class='fa fa-times'> no team was correct</i></button> or select the group that answered correctly below to award points.</li> <li>Groups will appear below in the order that they buzz in.</li>");
      } else {
        var groupId = ids[0];
        dispatcher.trigger('movements.ask_question', channelNumber);
        $("#answerButtonsModal").toggleClass('active');
      };
    });
  },

  addSupplies: function () {
    $('.column-2').on('click', '#addSupplies', function (e) {
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

  sendMessage: function () {
    $(".column-2").on('click', '#send-message', function () {
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
      var url = $('#competition-question-form').attr('action');
      var group = $(this).attr('id');
      var new_url = url.split('/').slice(0, 5).join('/') + '/' + group;

      $('#competition-question-form').attr('action', new_url);
      $('#competition-question-form').submit();
    });
  },

  chooseNoGroup: function () {
    $('#list-competition-answers').delegate('button.end', 'click', function() {
      var url = $('#competition-question-form').attr('action');

      $.ajax({
        url: url,
        type: "PATCH",
      });

    });
  },

  highlightGroup: function () {
    var currentGroupId = $('div.current-group').attr('id');
    var links = $('.group-link a');
    var nextGroup;

    for (var i = 0; i < links.length; i++) {
      if (links[i].href.split('/').pop() === currentGroupId) {
        $(links[i].closest('li')).addClass('active-group');
      }
    }

    $('#group-links').on('click', '.group-link', function () {
      $('.group-link').removeClass('active-group');
      $(this).addClass('active-group');
    });

    $('#next-turn').on('click', '.next-turn', function () {
      nextGroup = $('#next-turn #game_session_turn_group_id').attr('value');
    });

    $(document).ready(function () {
        $('#group-links').on('groups', function () {

          for (var i = 0; i < links.length; i++) {
            if (links[i].href.split('/').pop() === nextGroup) {
              $(links[i].closest('li')).addClass('blah');
            }
          }

        })
      })

  }

};
