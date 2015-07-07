// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.classGameplay = {
  dragDrop: function () {
    $('.draggables').draggable({
      stop: function () {
        var id = event.target.id;
        
        var info = {
          id: id,
          top: $('#' + id).offset().top,
          left: $('#' + id).offset().left
        }
        
        console.log(info);
      }
    });
  }
}