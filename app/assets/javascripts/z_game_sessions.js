// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.gameSession = {
  dragDrop: function () {
    $('.groups-students').sortable({
      revert: true
    });

    $('.draggables').draggable({
      connectToSortable: '.groups-students',
      revert: 'invalid'
    });
    // $('ul, li').disableSelection();
  }
}
