import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:push_notification_firebase/getx_cep/lib/modules/cep/controller/cep_controller.dart';

class CepPageGetx extends StatefulWidget {
  CepPageGetx({Key? key}) : super(key: key);

  @override
  State<CepPageGetx> createState() => _CepPageGetxState();
}

class _CepPageGetxState extends State<CepPageGetx> {
  final cepEC = TextEditingController();

  final controllerCep = Get.put(CepController());

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
                  controllerCep.getCep(cepEC.text);
                },
                child: const Text('Buscar'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controllerCep.obx(
                      (state) => Column(
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
                          ),
                      onLoading: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      onError: (error) => Text(error.toString()),
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
