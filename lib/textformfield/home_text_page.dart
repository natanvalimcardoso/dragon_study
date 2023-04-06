import 'package:flutter/material.dart';

import 'input_text_field_widget.dart';

class HomeTextPage extends StatefulWidget {
  const HomeTextPage({Key? key}) : super(key: key);

  @override
  State<HomeTextPage> createState() => _HomeTextPageState();
}

class _HomeTextPageState extends State<HomeTextPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha página'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailFormField(
                  labelText: 'E-mail',
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Enviando...'),
                        ),
                      );
                    }
                  },
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
