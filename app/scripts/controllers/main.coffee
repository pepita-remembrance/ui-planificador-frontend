'use strict'

app = angular.module 'planificadorApp'

app.factory "Planificacion", ($resource, UrlBase) ->
  $resource "#{UrlBase}/planificacionesDeEstaSemana", {},
    get:
      method: 'GET',
      transformResponse: (data) ->
        console.log(data);
        fecha = new Date(0)
        fecha.setUTCSeconds(data.fecha);
        data = {}
        data.fecha = fecha

app.factory "UrlBase", -> "http://localhost:9000/api"

#app.factory "UrlBase", -> "http://10.9.1.41:9000"

app.controller 'PlanificacionCtrl', ($scope, Planificacion) ->
    $scope.planificacionesDeEstaSemana = Planificacion.query()
    $scope.seleccionada = $scope.planificacionesDeEstaSemana[0]
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
      console.log(campo, compDate, itemDate, itemDate >= compDate)

      if unaFecha and comparacion == "menorIgualQue" and itemDate <= compDate
        filtered.push(item)

      if unaFecha and comparacion == "mayorIgualQue" and itemDate >= compDate
        filtered.push(item)

      if !unaFecha then filtered.push(item)
    )

    filtered

app.directive 'planificacionDetail', ->
    restrict: 'E',
    templateUrl: 'partials/planificacionDetail',
    controller: ($scope) ->
      this.detalle = $scope.$parent.seleccionada
    ,
    controllerAs: 'planificacion'
