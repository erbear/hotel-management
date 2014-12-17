# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Level.create([{name: "Standard"}, {name: "Deluxe"}, {name: "Standard Plus"}])

Type.create([{name: "Pokoj"}, {name: "Sala konferencyjna"}])

Location.create(
  [
    {
      name: "Sezam",
      type_id: 1,
      level_id: 1,
      places: "3",
      price: "300",
      fee: "100",
      active: true
    },
    {
      name: "Miód",
      type_id: 1,
      level_id: 2,
      places: "4",
      price: "250",
      fee: "70",
      active: true
    },
    {
      name: "Bazylia",
      type_id: 1,
      level_id: 1,
      places: "6",
      price: "100",
      fee: "20",
      active: true
    },
    {
      name: "Curry",
      type_id: 1,
      level_id: 3,
      places: "3",
      price: "320",
      fee: "150",
      active: true
    },
    {
      name: "Chilli",
      type_id: 1,
      level_id: 3,
      places: "2",
      price: "380",
      fee: "200",
      active: true
    },
    {
      name: "Czekolada",
      type_id: 1,
      level_id: 2,
      places: "3",
      price: "310",
      fee: "100",
      active: true
    },
    {
      name: "Lawenda",
      type_id: 1,
      level_id: 2,
      places: "5",
      price: "220",
      fee: "50",
      active: true
    },
    {
      name: "Szafran",
      type_id: 1,
      level_id: 1,
      places: "4",
      price: "200",
      fee: "30",
      active: true
    }
  ])

Reservation.create(
  [
    {
      startDate: "2015-06-24", 
      endDate: "2015-06-26", 
      reservationNumber: "2412", 
      deposit: true, 
      location_id: 1
    },
    {
      startDate: "2015-08-02", 
      endDate: "2015-08-04", 
      reservationNumber: "5241", 
      deposit: true, 
      location_id: 2
    },
    {
      startDate: "2015-02-03", 
      endDate: "2015-02-05", 
      reservationNumber: "5346", 
      deposit: true, 
      location_id: 3
    },
    {
      startDate: "2015-03-02", 
      endDate: "2015-03-30", 
      reservationNumber: "3456", 
      deposit: true, 
      location_id: 4
    }
  ])
Checkin.create(
  [
    {
      reservation_id: 1, 
      startDate: "2015-06-24", 
      endDate: "2015-06-26", 
      keysGiven: true, 
      keysBack:true
    }
  ])
Address.create([
  {city: "Wroclaw", street: "Reymonta", buildingNumber: "3", flatNumber: "8"},
  {city: "Kraków", street: "Kazimierza Wielkiego", buildingNumber: "2"},
  {city: "Gdańsk", street: "Bracka", buildingNumber: "3"}

  ])
Customer.create([
  {firstName: "Major", lastName: "Hubal", address_id: 1},
  {firstName: "Kamila", lastName: "Arkabuz", address_id: 2},
  {firstName: "Bartosz", lastName: "Erbert", address_id: 3}
  ])

CustomerReservation.create(customer_id: 1, reservation_id: 1)
