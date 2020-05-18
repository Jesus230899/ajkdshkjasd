import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerzo'];
  String _opcionSeleccionada = 'Volar';

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 15.0, left: 15.0, top: 15.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Escribe tu nombre',
        labelText: 'Nombre',
        // helperText: 'Solo es el nombre',
        // suffixIcon: Icon(Icons.accessibility),
        // icon: Icon(Icons.account_box)
      ),
      onChanged: (valor) {
        _nombre = valor;
        setState(() {
          print(_nombre);
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      // autofocus: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
        counter: Text('Letras ${_email.length}'),
        hintText: 'Email',
        labelText: 'Email',
        // helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.alternate_email),
        // icon: Icon(Icons.account_box)
      ),
      onChanged: (valor) {
        _email = valor;
        setState(() {
          print(_email);
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
      ),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      // Para que no se pueda copiar el texto que aparece en el textField
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
              value: _opcionSeleccionada,
              items: getOpcionesDropdown(),
              onChanged: (opt) {
                setState(() {
                  _opcionSeleccionada = opt;
                });
              }),
        )
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre es $_nombre'),
      subtitle: Text('El email es $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }
}
