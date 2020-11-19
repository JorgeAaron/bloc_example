import 'package:bloc/bloc.dart';
import 'package:flutterblocdemo/respositories/nombres_repository.dart';


class NombresBloc extends Bloc<NombresEvent, NombresState>{

  final NombresRepository _NombresRepository;

  NombresBloc(this._NombresRepository);
  
  @override
  NombresState get initialState => NombreNoCargado();

  @override
  Stream<NombresState> mapEventToState(NombresEvent event) async* {
     if (event is CargarNombre) {
      yield* _cargarNombre();
    }
  }

    Stream<NombresState> _cargarNombre() async*{
    String nombre = await _NombresRepository.fraseAleatoria();

    yield (NombreCargado(nombre));
  }




}


abstract class NombresEvent {

}

class CargarNombre extends NombresEvent {
  
}

abstract class NombresState {

}

class NombreNoCargado extends NombresState {

}

class NombreCargado extends NombresState {
  final String nombre;

  NombreCargado(this.nombre);
}