// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

app.classGameplay = {
  dragDrop: function () {
    $('.draggables').draggable({

      containment: ('#map-container'),
      stop: function () {
        var id = event.target.id;
        if ($('#' + id).length) {

          var info = {
            id: id,
            y: $('#' + id).offset().top,
            x: $('#' + id).offset().left
          }

          var glow = $('#' + id);
          glow.addClass('glow');
          window.setTimeout(function () {
            glow.removeClass('glow');
          }, 1000);

          dispatcher.trigger('movements.move_icon', info);
        } else {
        revert: true;
      }}

    });
  },
  chooseWinner: function () {
    $('button.choose-winner').on('click', function () {
      $('#winnerModal').toggleClass('active');
    });
  },

  closeWinner: function () {
    $('button.choose-winner-close').on('click', function () {
      $('#winnerModal').toggleClass('active');
    });
  },

  sendSession: function () {
    dispatcher.trigger('movements.initial_placements', parseInt(channelNumber));
  }
}
