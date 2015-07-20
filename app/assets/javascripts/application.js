// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require websocket_rails/main
//= require material.min
//= require sketch
//
//= require z_app
//= require z_categories
//= require z_class_gameplay
//= require z_game_sessions
//= require z_games
//= require z_icon_movement
//= require z_notes
//= require z_pages
//= require z_questions
//= require z_student_gameplay
//= require z_students
//= require z_supplies
//= require z_teacher_gameplay
//
//= require zz_init

var dispatcher = new WebSocketRails(window.location.host + "/websocket");
var pathArray = window.location.pathname.split( '/' );
var channelNumber = pathArray[2];
var groupNumber = pathArray[4];

channel = dispatcher.subscribe('group_listen' + channelNumber);
channelStudentQuestion = dispatcher.subscribe('question_listen' + groupNumber);

channel.bind('initial_placement', function (icons) {
  icons.map(function (icon) {
    $('#' + icon.id).offset({ top: icon.board_y, left: icon.board_x });
    if (icon.active === false) {
      $('#' + icon.id).hide();
    }
  })
});

channel.bind('icon_display', function (icon) {
  if (icon.active === false) {
    $('#' + icon.id).hide();
  } else {
    $('#' + icon.id).show();
  }
});

channel.bind('coordinates', function (icon) {
  var id = icon.id;

  $('i#' + id).offset({ top: icon.board_y, left: icon.board_x });

  var glow = $('#' + id);
  glow.addClass('glow');
  window.setTimeout(function () {
    glow.removeClass('glow');
  }, 300);
});

channel.bind('turn_display', function (groupName) {
  $('#turn-group').text("Turn: " + groupName);
});

channel.bind('update_score', function (group) {
  $('#score-group' + group.id).text(group.name + " " + group.score);
  $('#score-line' + group.id).text(group.score + " points");
});

channelStudentQuestion.bind('ask_question', function (questionText) {
  $('#answer-competition').hide()
  $('#question-text').text(questionText);
  $('#questionModal').toggleClass('active');

  window.setTimeout(function () {
    $('#questionModal').toggleClass('active');
  }, 5000);

});

channel.bind('list_competition_group', function (group) {
  $('#list-competition-answers').append("<li><button style='background: #60B514;' class='button-margin correct mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect' id='" + group.id + "'><i class='fa fa-check'> " + group.name + " got it correct</i></button></li>");
});


channelStudentQuestion.bind('ask_competition_question', function (questionText) {
  $('#answer-competition').show()
  $('#question-text').text(questionText);
  $('#questionModal').toggleClass('active');

  window.setTimeout(function () {
    $('#questionModal').toggleClass('active');
  }, 5000);

});

channelStudentQuestion.bind('group_list', function (groupList) {
  $('#group-list').empty();
  groupList.map(function (group) {
    $('#group-list').append("<li>" + group + "</li>");
  });
});

channelStudentQuestion.bind('update_supplies', function (supplies) {
  $('#supply-list').empty();
  supplies.map(function (supply) {
    $('#supply-list').append('<li>' + supply.amount + ' ' + supply.name + '</li>');
  });
});

channelStudentQuestion.bind('send_message', function (message_text) {
  console.log("hi")
  $('#message-text-container').text(message_text);

  $('#messageModal').toggleClass('active');

});
