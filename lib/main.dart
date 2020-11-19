import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocdemo/blocs/frases_bloc.dart';
import 'package:flutterblocdemo/blocs/nombres_bloc.dart';
import 'package:flutterblocdemo/respositories/frases_repository.dart';
import 'package:flutterblocdemo/respositories/nombres_repository.dart';

import 'blocs/frases_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<FrasesBloc>(
            create: (context) => FrasesBloc(FrasesRepository()),
          ),
          BlocProvider<NombresBloc>(
            create: (context) => NombresBloc(NombresRepository()),
          )
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
            BlocBuilder<FrasesBloc, FrasesState>(
              builder: (context, state) {
                if (state is FraseCargada) {
                  return Text(
                    state.frase,
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
                onPressed: () => BlocProvider.of<FrasesBloc>(context).add(CargarFrase()),
                child: Text("Cargar Frase")
            ),
             SizedBox(height: 20,),
            RaisedButton(
                onPressed:  () {
                Navigator.of(context).pushNamed(
                  '/second',
                );},
             child: Text("Ir a nombres")
            ),
          ],
        ),
      ),
    );
  }
}
