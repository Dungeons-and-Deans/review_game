// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.notes = {
  
  addNotes: function () {
    $('.column-2').on('click', '#addNotes', function (e) {
      e.stopPropagation();
      
      $('#notesModal').addClass('active');
    })
  },
}