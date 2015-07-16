var app = {
  modalClose: function () {
    $('body').on('click', 'button.close-modal', function (e) {
      e.preventDefault();
      
      $(this).closest('.modal').removeClass('active');
    });
  }
};