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
  ]
  )

