// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.classGameplay = {
  dragDrop: function () {
    $('.draggables').draggable({
      stop: function () {
        var id = event.target.id;
        
        var info = {
          id: id,
          y: $('#' + id).offset().top,
          x: $('#' + id).offset().left
        }
        
        dispatcher.trigger('movements.move_icon', info);
      }
    });
  }
}