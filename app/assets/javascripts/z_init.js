$(function () {
  'use strict';
  
  if ($('.simple_form.new_teacher').length) {
    app.loginNoNav();
  }
  
  
  
  $(".nav a").on("click", function(){
    $(".nav").find(".active").removeClass("active");
    $(this).parent().addClass("active");
  });

  
});