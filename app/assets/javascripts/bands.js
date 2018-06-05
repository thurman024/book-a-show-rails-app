$(function() {
  $(".js-all").on('click', function(event) {
    //alert("you clicked the link")
    event.preventDefault()
    $("div.shows-list").html('')
    $.get(this.href, shows => {
      // console.log(shows)
      shows.forEach( show => {
        let newShow = new Show(show)
        let showHtml = newShow.formatShows()
        $("div.shows-list").append(showHtml)
      })
    })
  })
})

function Show(attributes) {
  this.id = attributes.id
  this.bandName = attributes.band.name
  this.bandDescription = attributes.band.description
  this.venueName = attributes.venue.name
  this.venueDescription = attributes.venue.description
  this.showtime = attributes.showtime
}


Show.prototype.formatShows = function () {
  let showHtml = `
    <h4>${this.venueName}</h4>
    <p><%=format_showtime(${this.showtime})%></p>
    <p><strong>About the Venue:</strong> ${this.venueDescription}</p>
    `
  return showHtml
};
