angular.module('HotelApp').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('reservations');
  
  $stateProvider
  .state('reservations', {
    url: '/reservations',
    controller: 'ReservationsCtrl',
    templateUrl: 'reservations/index.html'
  })
  .state('reserve', {
    url: '/reserve/:id',
    controller: 'ReserveCtrl',
    templateUrl: 'reservations/reserve.html'
  })
