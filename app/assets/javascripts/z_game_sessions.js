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
      stop: function () {
        var id = event.target.id;
        
        var groupId = $(this).closest('ul').attr('id');
        
        if (groupId) {
          console.log(id);
          console.log(groupId);
          document.location.path = "game_sessions/add_player/" + groupId + "/" + id;
        }
        
        // window.location = "http://localhost:3000/game_sessions/add_player/" + groupId + "/" + id
        
        // game_sessions/add_player/:group_id/:student_id
      }
    });
    
  }
}