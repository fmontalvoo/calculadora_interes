import 'package:flutter/material.dart';

import 'package:ic_app/src/ic/model/interes_model.dart';

class ICProvider {
  List<DataRow> calcularInteresCompuesto(
      {int tiempo, double monto, double tasajeInteres = 1}) {
    InteresModel ic;

    List<DataRow> filas = List<DataRow>();

    for (int i = 0; i < tiempo; i++) {
      ic = InteresModel(monto: monto, tasajeInteres: tasajeInteres);

      double interes = ic.calcularInteres();
      monto = interes + monto;

      filas.add(DataRow(cells: <DataCell>[
        DataCell(Text('${i + 1}')),
        DataCell(Text('${double.parse(interes.toStringAsFixed(2))}')),
        DataCell(Text('${double.parse(monto.toStringAsFixed(2))}')),
      ]));
    }
    return filas;
  }
}
