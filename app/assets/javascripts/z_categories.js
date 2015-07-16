// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.categories = {
  
  addQuestions: function () {
    $('#show-question-form').on('click', function (e) {
      e.preventDefault();
      e.stopPropagation();
      
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
  
  addQuestion: function () {
    var questionCounter = 1;
    
    $('#copy_link').on('click', function (e) {
      e.stopPropagation();
      
      var question = $("#new-question-form").clone().html();
        question = question
          .replace(/\[[0-9]+\]/g, '[' + questionCounter + ']')
          .replace(/_[0-9]+_/g, '_' + questionCounter + '_');
        $("#question-list").append(question);
      
      questionCounter++;
    })
    
  }

};
