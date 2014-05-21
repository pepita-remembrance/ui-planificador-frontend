'use strict';

exports.planificacionesDeEstaSemana = function (req, res) {
    res.json( [
        {
            id: 1,
            diaDeSemana: "Lunes",
            fecha: 1400695167517,
            estaPlanificado: false
        },
        {
            id: 2,
            diaDeSemana: "Martes",
            fecha: 1400695167517,
            estaPlanificado: false
        },
        {
            id: 3,
            diaDeSemana: "Miercoles",
            fecha: 1400695167517,
            estaPlanificado: true
        }
    ]);
};

exports.planificacionDetail = function (req, res) {
    var detail =  [
        {
            id: 1,
            empleado: "Juan",
            entrada: 1400695167517,
            salida: 1400695167517
        },        {
            id: 2,
            empleado: "Pepe",
            entrada: 1400695167517,
            salida: 1400695167517
        },        {
            id: 3,
            empleado: "Susanita",
            entrada: 1400695167517,
            salida: 1400695167517
        }

    ];

    res.json(detail);
};