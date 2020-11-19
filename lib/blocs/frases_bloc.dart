import 'package:bloc/bloc.dart';
import 'package:flutterblocdemo/respositories/frases_repository.dart';


        // Esta es la clase bloc para la frase recibe objetos de tipo evento y estados.
        // 
class FrasesBloc extends Bloc<FrasesEvent, FrasesState> {

        // instancia del repositorio de nuestras frases y su constructor.
  final FrasesRepository _frasesRepository;

  FrasesBloc(this._frasesRepository);
  
        //Sobreescribe la variable intialState mediante un get este es del tipo FrasesState, es nuestro
        //estado inicial, cuando no hay ninguna frase en pantalla aun.d
  @override
  FrasesState get initialState => FraseNoCargada();

       //Este stream es el que decide que estado aparece en pantalla dependiendo del evento.
  @override
  Stream<FrasesState> mapEventToState(FrasesEvent event) async* {
    if (event is CargarFrase) {
      yield* _cargarFrase();
    }
  }

  Stream<FrasesState> _cargarFrase() async*{
    String frase = await _frasesRepository.fraseAleatoria();

    yield (FraseCargada(frase));
  }

}

abstract class FrasesEvent {}

class CargarFrase extends FrasesEvent {}

abstract class FrasesState {}

class FraseNoCargada extends FrasesState {}

class FraseCargada extends FrasesState {
  final String frase;

  FraseCargada(this.frase);
}