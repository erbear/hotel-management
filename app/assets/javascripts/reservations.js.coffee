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
  $scope.events = [
    title: 'My event title', 
    type: 'info',
    starts_at: new Date(2015, 0, 1),
    ends_at: new Date()
    editable: false ,
    deletable: false 
  ]
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
      })
    .success (data)->
      console.log data

