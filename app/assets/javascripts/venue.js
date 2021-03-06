$(function () {
  $(".js-create").submit(function(e) {
    e.preventDefault()
    let values = $(this).serialize()
    createNewShow(values)
  })
})

function createNewShow(values) {
  let posting = $.post('/bookings/json', values)

  posting.done(function (data) {
    let addedShow = new Show(data)
    let showHtml = addedShow.formatNewShow()
    $('div.added-booking').html(showHtml)
  })
}

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
  let monthNames = [
    "January", "February", "March",
    "April", "May", "June", "July",
    "August", "September", "October",
    "November", "December"
  ];

  let day = t.getDate();
  let monthIndex = t.getMonth();
  let year = t.getFullYear();
  let hour = t.getHours()
  let pm = ''

  if (hour > 12) {
    hour -= 12;
    let pm = ' PM'
  }
  let minute = t.getMinutes()
  if (minute < 0) {
    minute = '0' + minute
  }

  return  monthNames[monthIndex] + ' ' + day + ', ' + year + ' at ' + hour + ':' + minute + pm;
}
