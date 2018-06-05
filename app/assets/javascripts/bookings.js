$(function() {
  $(".js-all").on('click', function(event) {
    //alert("you clicked the link")
    event.preventDefault()
    //console.log(this.href)
    $.get(this.href, shows => {
      console.log(shows)
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
  //this.bandName = attributes.band.name
  //this.venueName = attributes.venue.name
  this.showtime = attributes.showtime
}


Show.prototype.formatShows = function () {
  let showHtml = `<p>${this.showtime}</p>
    `
  return showHtml
};
