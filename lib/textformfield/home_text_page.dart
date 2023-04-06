import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import 'input_text_field_widget.dart';

class HomeTextPage extends StatefulWidget {
  const HomeTextPage({Key? key}) : super(key: key);

  @override
  State<HomeTextPage> createState() => _HomeTextPageState();
}

class _HomeTextPageState extends State<HomeTextPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();
  final _controllerSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha página - EMAIL'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormInput(
                  validator: Validatorless.multiple([
                    Validatorless.required('Email obrigatório'),
                    Validatorless.email('E-mail inválido'),
                  ]),
                  labelText: 'E-mail',
                  controller: _controllerEmail,
                ),
                TextFormInput(
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha obrigatória'),
                    Validatorless.min(6, 'Senha deve ter no mínimo 6 caracteres'),
                  ]),
                  labelText: 'Senha',
                  controller: _controllerSenha,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('A mensagem enviada foi: ${_controllerEmail.text} ');
                      print('A mensagem enviada foi: ${_controllerSenha.text} ');
                    }
                  },
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
