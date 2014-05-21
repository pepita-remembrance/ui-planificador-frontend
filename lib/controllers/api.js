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