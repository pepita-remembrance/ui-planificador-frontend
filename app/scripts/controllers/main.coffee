'use strict'

app = angular.module 'planificadorApp'

app.factory "Planificacion", ($resource, UrlBase) ->
  $resource "#{UrlBase}/planificacionesDeEstaSemana"

app.factory "UrlBase", -> "http://localhost:9000/api"

#app.factory "UrlBase", -> "http://10.9.1.41:9000"

app.controller 'MainCtrl', ($scope, Planificacion) ->
    $scope.planificacionesDeEstaSemana = Planificacion.query()

app.directive 'dateFormat', ()->
  {
    require: 'ngModel',
    link: (scope, element, attr, ngModelCtrl) ->

      ngModelCtrl.$formatters.unshift (valueFromModel) ->
        valueFromModel

      ngModelCtrl.$formatters.push (valueFromInput) ->
        valueFromInput

  }

app.filter 'estaPlanificado', ->
  (valor) ->  if valor then "Planificado" else "No Planificado"
