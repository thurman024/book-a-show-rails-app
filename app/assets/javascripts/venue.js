$(function () {
  $(".js-create").submit(function(e) {
    e.preventDefault()
    let values = $(this).serialize()
    let posting = $.post('/bookings', values)

    posting.done(function (data) {
      let addedShow = new Show(data)
      let showHtml = addedShow.formatNewShow()
      $('div.added-booking').html(showHtml)
    })
  })
})

Show.prototype.formatNewShow = function () {
  let showtime = formatTime(this.showtime)
  let showHtml = `
    <h4>${this.bandName}</h4>
    <p>${showtime}</p>
    <p><strong>About the Band:</strong> ${this.bandDescription}</p>
    `
  return showHtml
};

function formatTime(time) {
  let t = new Date(time)
  //return t.toLocaleString("%B %-d, %Y at %-I:%M%p");
  var monthNames = [
    "January", "February", "March",
    "April", "May", "June", "July",
    "August", "September", "October",
    "November", "December"
  ];

  var day = t.getDate();
  var monthIndex = t.getMonth();
  var year = t.getFullYear();
  var hour = t.getHours()
  var pm = null
  
  if (hour > 12) {
    hour -= 12;
    var pm = ' PM'
  }
  var minute = t.getMinutes()
  if (minute === 0) {
    minute = '00'
  }

  return  monthNames[monthIndex] + ' ' + day + ', ' + year + ' at ' + hour + ':' + minute + pm;
}
