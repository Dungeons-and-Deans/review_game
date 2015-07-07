// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.gameSession = {
  dragDrop: function () {
    $('.groups-students').sortable({
      revert: true
    });

    $('.draggables').draggable({
      connectToSortable: '.groups-students',
      revert: 'invalid',
      stop: function (e) {
        var id = e.target.id;
        var groupId = $(this).closest('ul').attr('id');

        if (groupId) {
          window.location.pathname = "game_sessions/add_player/" + groupId + "/" + id;
        }
      }
    });
  }
}
