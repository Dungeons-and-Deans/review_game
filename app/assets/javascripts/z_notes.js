// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.notes = {
  
  addNotes: function () {
    $('#addNotes').on('click', function (e) {
      e.stopPropagation();
      
      $('#notesModal').addClass('active');
    })
  },
}