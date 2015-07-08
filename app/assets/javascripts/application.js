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
//= require bootstrap-sprockets
//= require websocket_rails/main
//
//= require z_app
//= require z_categories
//= require z_games
//= require z_students
//= require z_teacher_gameplay
//= require z_class_gameplay
//= require z_game_sessions
//
//= require z_init
var questionCounter = 1;
var dispatcher = new WebSocketRails(window.location.host + "/websocket");
var pathArray = window.location.pathname.split( '/' );
var channelNumber = pathArray[2];
channel = dispatcher.subscribe('group_listen' + channelNumber);

channel.bind('initial_placement', function (icons) {
  icons.map(function (icon) {
    $('#' + icon.id).offset({ top: icon.board_y, left: icon.board_x })
  })
});

channel.bind('coordinates', function (icon) {
  var id = icon.id;

  $('i#' + id).offset({ top: icon.board_y, left: icon.board_x });
});

channel.bind('ask_question', function () {
  $('#questionModal').modal('show');
});

function copySection() {
  var question = $("#new-question-form").parent().clone().html();
  question = question.replace(/\[[0-9]+\]/g, '[' + questionCounter + ']')
    .replace(/_[0-9]+_/g, '_' + questionCounter + '_');
  $("#question-list").append(question);
  questionCounter++;
}
