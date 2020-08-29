class InteresModel {
  double _monto;
  double _tasajeInteres;

  InteresModel({double monto, double tasajeInteres}) {
    this._monto = monto;
    this._tasajeInteres = tasajeInteres > 0.0 ? (tasajeInteres / 100) : 0.0;
  }

  double calcularInteres() {
    double interes = this._monto * this._tasajeInteres;
    return interes;
  }
}
