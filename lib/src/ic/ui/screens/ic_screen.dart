import 'package:flutter/material.dart';
import 'package:ic_app/src/ic/provider/ic_provider.dart';

class ICScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ICScreenState();
}

class _ICScreenState extends State<ICScreen> {
  final _formKey = GlobalKey<FormState>();
  final _icProvider = ICProvider();

  int _tiempo;
  double _monto;
  double _tasaInteres;
  List<DataRow> _filas = List<DataRow>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[_form(), Divider(), _table()],
        ),
      ),
    );
  }

  Widget _form() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _txtTiempo(),
              SizedBox(height: 5.0),
              _txtCapital(),
              SizedBox(height: 5.0),
              _txtInteres(),
              SizedBox(height: 5.0),
              _btnCalcular()
            ],
          ),
        ),
      ),
    );
  }

  Widget _table() {
    return DataTable(columns: <DataColumn>[
      DataColumn(label: Text('Tiempo'), numeric: true),
      DataColumn(label: Text('Interes'), numeric: true),
      DataColumn(label: Text('Capital'), numeric: true)
    ], rows: _filas);
  }

  Widget _txtTiempo() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Tiempo',
        labelText: 'Tiempo',
      ),
      onSaved: (value) => _tiempo = value.isNotEmpty ? int.parse(value) : 0.0,
      validator: (value) =>
          value.isEmpty ? 'Ingresa la cantidad de tiempo' : null,
    );
  }

  Widget _txtCapital() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Capital',
        labelText: 'Capital',
      ),
      onSaved: (value) => _monto = value.isNotEmpty ? double.parse(value) : 0.0,
      validator: (value) =>
          value.isEmpty ? 'Ingresa el Capital de dinero' : null,
    );
  }

  Widget _txtInteres() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Tasa Interes',
        labelText: 'Tasa Interes',
      ),
      onSaved: (value) =>
          _tasaInteres = value.isNotEmpty ? double.parse(value) : 0.0,
      validator: (value) => value.isEmpty ? 'Ingresa la tasa de interes' : null,
    );
  }

  Widget _btnCalcular() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        child: Text('Calcular'),
      ),
      color: Color(0xff3b3b3d),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0.0,
      onPressed: () {
        setState(() {
          _filas = List<DataRow>();
          if (_validarCampos())
            _filas.addAll(_icProvider.calcularInteresCompuesto(
                tiempo: _tiempo, monto: _monto, tasajeInteres: _tasaInteres));
        });
      },
    );
  }

  bool _validarCampos() {
    final form = _formKey.currentState;
    form.save();
    if (form.validate()) return true;
    return false;
  }
}
