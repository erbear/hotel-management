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


.controller 'ReservationCtrl', ($http, $scope, $stateParams, $timeout, $state)->
  reservationNumber = ''
  $scope.actionDone = false
  $scope.searchReservation = (number)->
    reservationNumber = number
    $scope.location = ''
    $scope.customer = ''
    $scope.address = ''
    $scope.startDate = ''
    $scope.endDate = ''
    $http.get('/reservations/'+number).success (data)->
      if data?
        $scope.location = data.location
        $scope.customer = data.customer
        $scope.address = data.address
        $scope.startDate = moment(data.startDate).format('dddd, D MMMM YYYY')
        $scope.endDate = moment(data.endDate).format('dddd, D MMMM YYYY')
      else
        console.log 'lol'
        $scope.showMessage("Nie znaleziono takiej rezerwacji")

  $scope.updateReservation = ()->
    $http.put('/reservations/'+reservationNumber, {
      city: $scope.address.city,
      street: $scope.address.street,
      buildingNumber: $scope.address.buildingNumber,
      flatNumber: $scope.address.flatNumber,
      firstName: $scope.customer.firstName,
      lastName: $scope.customer.lastName,
      email: $scope.customer.email,
      phone: $scope.customer.phone,
      description: $scope.customer.description

      }).success (data)->
      $scope.showMessage("Dane zostały zaktualizowane")

  $scope.showMessage = (message)->
    $scope.actionMessage = message
    $scope.actionDone = true
    $timeout ->
      $scope.actionDone = false
    , 5000

  $scope.deleteReservation = ->
    $http.delete('/reservations/'+reservationNumber).success (data)->
      $state.go('reservations')


