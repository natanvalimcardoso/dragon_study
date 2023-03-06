import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/model/cep_model.dart';
import '../controller/cep_controller.dart';

class CepPageGetx extends StatefulWidget {
  const CepPageGetx({Key? key}) : super(key: key);

  @override
  State<CepPageGetx> createState() => _CepPageGetxState();
}

class _CepPageGetxState extends State<CepPageGetx> {
  final cepEC = TextEditingController();

  final controllerCep = Get.put(CepController(repository: Get.find()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cep Getx'),
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
                      (state) {
                        final CepModel cep = state;

                        return Column(
                          children: [
                            Text('Cep: ${cep.cep}'),
                            Text('Logradouro: ${cep.logradouro}'),
                            Text('Complemento: ${cep.complemento}'),
                            Text('Bairro: ${cep.bairro}'),
                            Text('Localidade: ${cep.localidade}'),
                            Text('Uf: ${cep.uf}'),
                            Text('Ibge: ${cep.ibge}'),
                            Text('Gia: ${cep.gia}'),
                            Text('Ddd: ${cep.ddd}'),
                            Text('Siafi: ${cep.siafi}'),
                          ],
                        );
                      },
                      onLoading: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      onError: (error) => Text(error.toString()),
                      onEmpty: const Center(
                        child: Text('Pesquise um Cep'),
                      ),
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
