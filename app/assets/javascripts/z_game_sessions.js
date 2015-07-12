// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.gameSession = {
  dragDrop: function () {
    $('.groups-students').sortable({
      tolerance:"pointer",
      revert: true
    });

    $('.draggables').draggable({
      connectToSortable: '.groups-students',
      revert: 'invalid',
      stop: function (e) {
        var id = e.target.id;
        var groupId = $(this).closest('ul').attr('id');

        if (groupId) {
          $.ajax({
            url: "/game_sessions/add_player/" + groupId + "/" + id,
            type: "POST",
            success: function(data) {
              $("#new-group-form-container").html(data)
            }
          });
        }
      }
    });

  }
}
