$(function() {
  $(".js-all").on('click', function(event) {
    //alert("you clicked the link")
    event.preventDefault()
    $("div.shows-list").html('')
    renderShowsIndex(this.href)
  })

  $(".js-next").on('click', function(event) {
    let bandId = $(this).attr('data-band-id')
    let showId = $(this).attr('data-show-id')
    renderNextShow(showId)
  })
})

function renderShowsIndex(route) {
  $.get(route, shows => {
    // console.log(shows)
    shows.sort( (a, b) => {
      // debugger
      return a.showtime < b.showtime ? -1 : 1;
    })
    console.log(sortedShows)
    shows.forEach( show => {
      let newShow = new Show(show)


      let showHtml = newShow.formatShows()
      $("div.shows-list").append(showHtml)
    })
  })
}

function renderNextShow(showId) {
  $.get(`/bands/${showId}/next`, show => {
    let nextShow = new Show(show)
    let showHtml = nextShow.formatShows()
    $(".display-show").html(showHtml)
    $(".js-next").attr('data-show-id', nextShow.id)
  })
}

function Show(attributes) {
  this.id = attributes.id
  this.bandName = attributes.band.name
  this.bandDescription = attributes.band.description
  this.venueName = attributes.venue.name
  this.venueDescription = attributes.venue.description
  this.showtime = attributes.showtime
}


Show.prototype.formatShows = function () {
  let showtime = formatTime(this.showtime)
  let showHtml = `<div class="show-index">
    <h4>${this.venueName}</h4>
    <p>${showtime}</p>
    <p><strong>About the Venue:</strong> ${this.venueDescription}</p>
    </div>
    <div class="divider"></div>`
  return showHtml
};
