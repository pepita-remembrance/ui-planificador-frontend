'use strict';

exports.planificaciones = function (req, res) {
    res.json([
        {
            dia: '11/05/2014',
            isPlanificado: true
        },
        {
            dia: '12/05/2014',
            isPlanificado: false
        },
        {
            dia: '13/05/2014',
            isPlanificado: false
        },
        {
            dia: '14/05/2014',
            isPlanificado: false
        },
        {
            dia: '15/05/2014',
            isPlanificado: false
        },
        {
            dia: '16/05/2014',
            isPlanificado: false
        },
        {
            dia: '17/05/2014',
            isPlanificado: false
        }
    ]);
};