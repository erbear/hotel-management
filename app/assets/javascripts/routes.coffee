angular.module('HotelApp').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('reservations');
  
  $stateProvider
  .state('reservations', {
    url: '/reservations',
    controller: 'ReservationsCtrl',
    templateUrl: 'reservations/index.html'
  })
