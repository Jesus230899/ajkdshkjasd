import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AlertPage')),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar alerta.'),
          color: Colors.blue,
          textColor: Colors.white,

          // La propiedad shape es para redondear los botones.
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.grade),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Este es el contenido de la caja de alerta'),
                // FlutterLogo(size: 100.0),
                // Aqui puse una imagen dentro del AlertDialog, en el tutorial de Fernando se puso una imagen de  Flutter

                FadeInImage(
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(
                      'https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
                  fadeInDuration: Duration(milliseconds: 200),
                  height: 300,
                  fit: BoxFit.cover,
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar')),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Aceptar')),
            ],
          );
        });
  }
}
