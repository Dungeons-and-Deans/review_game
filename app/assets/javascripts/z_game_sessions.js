// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.gameSession = {
  dragDrop: function () {
    $('.groups-students').sortable({
      tolerance:"pointer"
    });

    $('.draggables').draggable({
      connectToSortable: '.groups-students',
      revert: 'invalid',
      stop: function (e) {
        var id = e.target.id;
        var groupId = $(this).closest('ul').attr('id');
        var gameSessionId = $('.session-name')[0].id;

        if (groupId) {
          $.ajax({
            url: "/game_sessions/" + gameSessionId + "/add_player/" + groupId + "/" + id,
            type: "POST",
            success: function(data) {
              $("#new-group-form-container").html(data);
            }
          });
        }
      }
    });

  },

  addGroup: function () {
    $('#new-group-form-container').delegate('button.add-group', 'click', function() {
      var id = $('button.add-group')[0].id;

      $.ajax({
        url: "/game_sessions/" + id + "/add_group",
        type: "GET",
      });

    });
  },

}
