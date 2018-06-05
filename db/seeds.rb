# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Band.destroy_all
Venue.destroy_all
Booking.destroy_all

trotline = Band.create({name: 'Trotline', description: 'Country cover band', rate: 2000})
weeks = Band.create({name: 'The Weeks', description: 'Southern Rock band', rate: 3000})
killers = Band.create({name: 'The Killers', description: 'Synth-pop Rock band', rate: 30000})
avett = Band.create({name: 'Avett Brothers', description: 'Folk rock band', rate: 20000})
newguys = Band.create({name: 'New Guys', description: 'Unknown local artist', rate: 750})

redrocks = Venue.create({name: 'Red Rocks Ampitheatre', description: 'Iconic outdoor ampitheatre in the Rockies'})
avondale = Venue.create({name: 'Avondale Brewery', description: 'Brewery with large outdoor space and stage'})
cahaba = Venue.create({name: 'Cahaba Brewing Company', description: 'Indoor warehouse space with terrible acoustics'})
tinroof = Venue.create({name: 'Tin Roof', description: 'Bar with country appeal'})

Booking.create([
  {showtime: DateTime.new(2018, 07, 01, 20, 00, 0), band: weeks, venue: avondale},
  {showtime: DateTime.new(2018, 07, 11, 20, 00, 0), band: killers, venue: redrocks},
  {showtime: DateTime.new(2018, 06, 21, 20, 00, 0), band: killers, venue: avondale},
  {showtime: DateTime.new(2018, 07, 25, 22, 00, 0), band: avett, venue: redrocks},
  {showtime: DateTime.new(2018, 06, 11, 20, 00, 0), band: avett, venue: avondale},
  {showtime: DateTime.new(2018, 07, 13, 20, 00, 0), band: avett, venue: redrocks},
  {showtime: DateTime.new(2018, 07, 29, 20, 00, 0), band: weeks, venue: redrocks},
  {showtime: DateTime.new(2018, 07, 02, 21, 00, 0), band: trotline, venue: tinroof},
  {showtime: DateTime.new(2018, 07, 20, 18, 30, 0), band: newguys, venue: avondale}
  ])
