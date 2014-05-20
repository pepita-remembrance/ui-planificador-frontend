'use strict'

angular.module('planificadorApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'partials/main'
        controller: 'PlanificacionCtrl'
      
      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode true