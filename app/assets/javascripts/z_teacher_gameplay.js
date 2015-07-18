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
      $('#winnerModal').toggleClass('active');
    });
  },

  closeWinner: function () {
    $('button.choose-winner-close').on('click', function () {
      $('#winnerModal').toggleClass('active');
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
      var url = $('#competition-question-form').attr('action');
      var group = $(this).closest('button').attr('id');
      var new_url = url.slice(0, -1) + group;

      $('#competition-question-form').attr('action', new_url);
      $('#competition-question-form').submit();
    });
  },
  
  highlightGroup: function () {
    // var currentGroupId = $('div.current-group').attr('id');
    // console.log(currentGroupId);
    
    // var links = $('.group-link');
    // console.log(links);
    
    // for (var key in links) {
    //   var a = links.find('a')[key];
    //   console.log(a);
      
    //   console.log(a.href.split('/').pop());
      
      
    //   if (a.href.split('/').pop() === currentGroupId) {
    //     console.log(links.addClass('blah'));
    //     a.closest('li').addClass('testing');
    //   }
    // }
    
    // for (var i = 0; i < links.length; i++) {
    //   console.log(links.find('a')[i].href.split('/').pop());
      
    //   links[i].addClass('blah');
    // }
    
    // console.log(links.find('a'));
    
    // for (var i = 0; i < links.length; i++) {
    //   if (links[i].href.split('/').pop() === currentGroupId) {
    //     console.log(links[i].closest('li'));
        
    //     console.log($(this));
        
    //     // $(this).closest('li').addClass('blah');
        
    //     console.log(links[i].closest('li'));
        
    //   }
    // }
    
    // for (var i = 0; i < links.length; i++) {
    //   if (links[i].href.split('/').pop() === currentGroupId) {
        
    //   }
      
    //   console.log();
    // }
    
    $('#group-links').on('click', '.group-link', function () {
      $('.group-link').removeClass('active-group');
      $(this).addClass('active-group');
    })
  }

};
