# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

angular.module('HotelApp', [
  'templates', 
  'ui.router',
  'ui.bootstrap',
  'mwl.calendar'
  ])
.config ($provide, $httpProvider) ->

  # CSFR token
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    angular.element(document.querySelector('meta[name=csrf-token]')).attr('content')


.controller 'ReservationsCtrl', ($http, $scope)->
  $http.get('/reservations').success (data)->
    $scope.locations = data

.controller 'ReserveCtrl', ($http, $scope, $stateParams)->
  $scope.events = []

  $http.get('/locations/'+$stateParams.id).success (data)->
    for d in data
      $scope.events.push({
        title: 'Zarezerwowane',
        type: 'important',
        starts_at: moment(d.startDate).toDate(),
        ends_at: moment(d.endDate).toDate(),
        editable: false ,
        deletable: false 
        })
    $scope.events.unshift({
        title: 'Twoja rezerwacja',
        type: 'info',
        starts_at: moment().toDate(),
        ends_at: moment().toDate(),
        editable: false ,
        deletable: false 
        })

  $scope.calendarDay = new Date()

  $scope.startDate = new Date()
  $scope.endDate = new Date()

  $scope.addReservation = ()->
    $http.post('/reservations', {
      location: $stateParams.id,
      startDate: $scope.events[0].starts_at,
      endDate: $scope.events[0].ends_at,
      city: $scope.city,
      street: $scope.street,
      buildingNumber: $scope.buildingNumber,
      flatNumber: $scope.flatNumber,
      firstName: $scope.firstName,
      lastName: $scope.lastName,
      email: $scope.email,
      phone: $scope.phone,
      description: $scope.description
      reservationNumber: null
      })
    .success (data)->
      $scope.reservationNumber = data.reservationNumber

  $scope.addReservationWithNumber = ()->
    $http.post('/reservations', {
      location: $stateParams.id,
      startDate: $scope.events[0].starts_at,
      endDate: $scope.events[0].ends_at,
      reservationNumber: $scope.prevReservationNumber
      })
    .success (data)->
      $scope.reservationNumber = data.reservationNumber


.controller 'ReservationCtrl', ($http, $scope, $stateParams)->
  $scope.searchReservation = (number)->
    $http.get('/reservations/'+number).success (data)->
      $scope.location = data[0].location
      $scope.customer = data[0].customer
      $scope.address = data[0].address

