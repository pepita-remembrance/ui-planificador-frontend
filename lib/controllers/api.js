'use strict';

exports.planificacionesDeEstaSemana = function (req, res) {
    res.json([
        {
            diaDeSemana: '11/05/2014',
            fecha: '12/05/2014',
            estaPlanificado: true
        },
        {
            diaDeSemana: '12/05/2014',
            fecha: '12/05/2014',
            estaPlanificado: false
        },
        {
            diaDeSemana: '13/05/2014',
            fecha: '12/05/2014',
            estaPlanificado: false
        },
        {
            diaDeSemana: '14/05/2014',
            fecha: '12/05/2014',
            estaPlanificado: false
        },
        {
            diaDeSemana: '15/05/2014',
            fecha: '12/05/2014',
            estaPlanificado: false
        },
        {
            diaDeSemana: '16/05/2014',
            fecha: '12/05/2014',
            estaPlanificado: false
        },
        {
            diaDeSemana: '17/05/2014',
            fecha: '12/05/2014',
            estaPlanificado: false
        }
    ]);
};