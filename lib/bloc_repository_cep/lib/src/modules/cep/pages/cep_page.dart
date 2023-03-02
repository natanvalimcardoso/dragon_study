import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cep_bloc.dart';
import '../bloc/cep_event.dart';
import '../bloc/cep_state.dart';

class CepPage extends StatefulWidget {
  CepPage({Key? key}) : super(key: key);

  @override
  State<CepPage> createState() => _CepPageState();
}


class _CepPageState extends State<CepPage> {
  final cepEC = TextEditingController();

  final bloc = CepBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cep'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: cepEC,
                decoration: const InputDecoration(hintText: 'Cep'),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  bloc. add(PegarCep(cepEC.text));
                },
                child: const Text('Buscar'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<CepBloc, CepState>(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is CepLoadedState) {
                          return Column(
                            children: [
                              Text(state.cepModel.cep),
                              Text(state.cepModel.bairro),
                              Text(state.cepModel.complemento),
                              Text(state.cepModel.ddd),
                              Text(state.cepModel.gia),
                              Text(state.cepModel.ibge),
                              Text(state.cepModel.localidade),
                              Text(state.cepModel.logradouro),
                              Text(state.cepModel.siafi),
                              Text(state.cepModel.uf),
                            ],
                          );
                        }

                        if (state is CepLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is CepErrorState) {
                          return const Center(
                            child: Text('Erro ao carregar dados'),
                          );
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
