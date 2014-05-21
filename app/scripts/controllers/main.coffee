'use strict'

app = angular.module 'planificadorApp'

app.factory "Planificacion", ($resource, UrlBase) ->
  $resource "#{UrlBase}/planificacionesDeEstaSemana", {},
    get:
      method: 'GET',
      transformResponse: (data) ->
        fecha: new Date(data.fecha*1000)

app.factory "Detail", ($resource, UrlBase) ->
  $resource "#{UrlBase}/planificacionesDeEstaSemana/:id", {id: '@id'}

app.factory "UrlBase", -> "http://localhost:9000/api"

#app.factory "UrlBase", -> "http://10.9.1.41:9000"

app.controller 'PlanificacionCtrl', ($scope, Planificacion) ->
    $scope.planificacionesDeEstaSemana = Planificacion.query()
    $scope.seleccionada = false
    $scope.seleccionar = (unaPlanificacion) ->
      $scope.seleccionada = unaPlanificacion

app.controller 'DateController', ($scope) ->

app.filter 'estaPlanificado', ->
  (valor) ->  if valor then "Planificado" else "No Planificado"

app.filter 'dateSearch', ->
  (items, campo, comparacion, unaFecha)->
    filtered = []

    angular.forEach(items, (item) ->
      itemDate = new Date(item[campo])
      compDate = new Date(unaFecha)

      if unaFecha and comparacion == "menorIgualQue" and itemDate <= compDate
        filtered.push(item)

      if unaFecha and comparacion == "mayorIgualQue" and itemDate >= compDate
        filtered.push(item)

      if !unaFecha then filtered.push(item)
    )

    filtered

app.directive 'planificacionDetail', ->
    restrict: 'E',
    scope:
      planificacionId: "="
    templateUrl: 'partials/planificacionDetail'
    controller: ($scope, Detail) ->
      $scope.$watch 'planificacionId', (nuevo, viejo) ->
        $scope.planificacion = Detail.query id:nuevo

