'use strict'

app = angular.module 'planificadorApp'

app.factory "Planificacion", ($resource, UrlBase) ->
  transform = (planificacion) ->
    fecha = new Date (planificacion.fecha)

    fecha: fecha
    id: fecha.getDay()
    diaDeSemana: ['Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo'][fecha.getDay()]
    estaPlanificado: planificacion.estaPlanificado

  $resource "#{UrlBase}/planificaciones/:id", {id:"@id"},
    query:
      method: 'GET'
      isArray: true
      transformResponse: (data) -> (JSON.parse data).map transform

#app.factory "UrlBase", -> "http://localhost:9000/api"

app.factory "UrlBase", -> "http://10.9.1.41:9000"

app.controller 'PlanificacionCtrl', ($scope, Planificacion) ->
    $scope.planificacionesDeEstaSemana = Planificacion.query()
    $scope.seleccionada = false
    $scope.seleccionar = (unaPlanificacion) ->
      $scope.seleccionada = unaPlanificacion

app.filter 'estaPlanificado', ->
  (valor) -> if valor then "Planificado" else "No Planificado"

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
    controller: ($scope, Planificacion) ->
      $scope.$watch 'planificacionId', (nuevo, viejo) ->
        $scope.planificacion = Planificacion.get id:nuevo

