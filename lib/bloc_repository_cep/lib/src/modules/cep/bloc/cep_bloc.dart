import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getx/src/modules/cep/bloc/cep_event.dart';
import 'package:flutter_getx/src/modules/cep/bloc/cep_state.dart';

import '../repositories/cep_repository.dart';

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
