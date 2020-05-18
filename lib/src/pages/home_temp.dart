import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  final contenido =['Cuando cuentes', 'Cuentos cuenta', 'Cuantos cuentos','Cuentas porque','Cuando cuentas'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItemsCorto() 
      ),
    );
  }

  List<Widget> _crearItems(){
    List <Widget> lista = new List<Widget>();
    for (var opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      lista..add(tempWidget)
      ..add(Divider());
    }
    return lista;
  }

  List <Widget> _crearItemsCorto (){
    return opciones.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text('Cuando cuentes cuentos cuenta cuantos cuentos cuentas porque cuando cuentas cuentos nunca cuentas'),
            leading: Icon(Icons.add),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}