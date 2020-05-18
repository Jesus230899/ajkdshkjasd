import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10), 
        children: <Widget>[
             _cardTipo1(),
             SizedBox(height: 30.0,),
             _cardTipo2(),
             SizedBox(height: 30.0,),
             _cardTipo1(),
             SizedBox(height: 30.0,),
             _cardTipo2(),
             SizedBox(height: 30.0,),
             _cardTipo1(),
             SizedBox(height: 30.0,),
             _cardTipo2(),
             SizedBox(height: 30.0,),
             _cardTipo1(),
             SizedBox(height: 30.0,),
             _cardTipo2(),
             SizedBox(height: 30.0,),
             _cardTipo1(),
             SizedBox(height: 30.0,),
             _cardTipo2(),
             SizedBox(height: 30.0,),
      ]),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Titulo de la card'),
            subtitle: Text(
                'Aqui hay que poner una descripcion larga para que se entienda mejor el concepto de lo que es el subtitle en una card'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(child: Text('Cancelar'), onPressed: () {}),
              FlatButton(child: Text('Aceptar'), onPressed: () {})
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {

    
    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          // Para poner un loading mientras carga la imagen
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
                fadeInDuration: Duration(milliseconds: 200),
                height: 300,
                fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('No tengo idea de que poner'))
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
     ),
      
      // Para recortar todo lo que este fuera del contenedor (esquinas) se usa ClipRRect
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
