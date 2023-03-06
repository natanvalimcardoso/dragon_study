import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/cep_repository.dart';
import 'cep_event.dart';
import 'cep_state.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  CepBloc() :super(const CepInitialState()){
    on<PegarCep>(_mostrarCep);
  } 

  Future _mostrarCep(PegarCep event, emit) async {
    final repository = CepRepository();

    emit(CepLoadingState());

    try {
      final cep = await repository.receberCep(event.cep);
      emit(CepLoadedState(cepModel: cep));
    } catch (e) {
      emit(CepErrorState(e.toString()));
    }
  }
  
}
