'use strict'

app = angular.module 'planificadorApp'

app.factory "Planificacion", ($resource, UrlBase) ->
  $resource "#{UrlBase}/planificacionesDeEstaSemana"

app.factory "UrlBase", -> "http://localhost:9000/api"

#app.factory "UrlBase", -> "http://10.9.1.41:9000"

app.controller 'PlanificacionCtrl', ($scope, Planificacion) ->
    $scope.planificacionesDeEstaSemana = Planificacion.query()
    $scope.seleccionada = $scope.planificacionesDeEstaSemana[0]
    $scope.seleccionar = (unaPlanificacion) ->
      $scope.seleccionada = unaPlanificacion
      console.log(unaPlanificacion)

app.filter 'estaPlanificado', ->
  (valor) ->  if valor then "Planificado" else "No Planificado"
