// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.categories = {
  
  addQuestions: function () {
    $('#show-question-form').on('click', function (e) {
      e.preventDefault();
      e.stopPropagation();
      
      console.log('hi');
      $('#form-container').toggleClass('active');
    });
  },
  
  cancelQuestions: function () {
    $('#exitAddQuestions').on('click', function (e) {
      e.preventDefault();
      e.stopPropagation();
      
      $('#form-container textarea.text').val('');
      $('#form-container input.numeric.integer').val('');
      
      $('#form-container').toggleClass('active');
    })
  },

};
