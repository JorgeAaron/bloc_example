import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocdemo/blocs/nombres_bloc.dart';




class SegundaPantalla extends StatefulWidget {

  @override
  _SegundaPantallaState createState() => _SegundaPantallaState();
}

class _SegundaPantallaState extends State<SegundaPantalla> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Bloc DEMO"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<NombresBloc, NombresState>(
              builder: (context, state) {
                if (state is NombreCargado) {
                  return Text(
                    state.nombre,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                    textAlign: TextAlign.center,
                  );
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(height: 20,),
            RaisedButton(
                onPressed: () => BlocProvider.of<NombresBloc>(context).add(CargarNombre()),
                child: Text("Cargar Frase")
            )
          ],
        ),
      ),
    );
  }
}
