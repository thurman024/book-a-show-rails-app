$(function () {
  $(".js-create").submit(function(e) {
    e.preventDefault()
    let values = $(this).serialize()
    let posting = $.post('/bookings', values)

    posting.done(function (data) {
      
    })
  })
})
