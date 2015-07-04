var app = {
  
  loginNoNav: function () {
    $('.nav').remove();
  },
  
  navActive: function (pathname) {
    $('.nav').find('.active').removeClass('active');
    
    if (pathname.length === 1 || (/games/.test(pathname))) {
      $('.nav .home').addClass('active');
    } else if (/students/.test(pathname)) {
      $('.nav .roster').addClass('active');
    } else if (/categories/.test(pathname)) {
      $('.nav .categories').addClass('active');
    }
  }
  
};