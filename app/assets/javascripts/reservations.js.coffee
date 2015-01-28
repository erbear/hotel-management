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
        ends_at: moment(d.endDate).add(23, 'h').add(59, 'm').toDate(),
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
    console.log $scope.events
  $scope.calendarDay = new Date()

  $scope.startDate = new Date()
  $scope.endDate = new Date()
  $scope.goodDate = false
  $scope.$watch 'events', (newVal)->
    days = moment(newVal[0].ends_at).diff(newVal[0].starts_at, 'days')
    $scope.goodDate = false
    if days >= 0
      $scope.goodDate = true
      for number in [0..days]
        toCheck = moment(newVal[0].starts_at).add(number, 'days')
        for day in [1..(newVal.length - 1)]
          start = moment(newVal[day].starts_at)
          end = moment(newVal[day].ends_at)
          # console.log start.toDate()+ ' < ' + toCheck.toDate() + ' && ' + end.toDate() + ' > ' + toCheck.toDate()
          # console.log toCheck.isAfter(start) && end.isAfter(toCheck)
          if toCheck.isAfter(start) && end.isAfter(toCheck)
            $scope.goodDate = false
  , true

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
    $http.post('/numberreservations', {
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
        $scope.price = moment(data.endDate).diff(moment(data.startDate), 'days') * data.location.price
        $scope.fee = moment(data.endDate).diff(moment(data.startDate), 'days') * data.location.fee
      else
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


