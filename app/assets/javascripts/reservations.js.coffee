# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

angular.module('HotelApp', [
  'templates', 
  'ui.router',
  'ui.bootstrap',
  'ngInputDate',
  'mwl.calendar'
  ])

.controller 'ReservationsCtrl', ($http, $scope)->
  $http.get('/reservations').success (data)->
    $scope.locations = data

.controller 'ReserveCtrl', ($http, $scope)->
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
