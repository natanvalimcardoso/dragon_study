import 'package:flutter/material.dart';

class EmailFormField extends StatefulWidget {
  final String labelText;

  EmailFormField({required this.labelText});

  @override
  _EmailFormFieldState createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<EmailFormField> {
  final TextEditingController _emailController = TextEditingController();
  bool _isValid = true;
  String _errorMessage = '';

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    return emailRegex.hasMatch(email);
  }

  void _onEmailChanged(String value) {
    setState(() {
      if (value.isEmpty) {
        _isValid = false;
        _errorMessage = 'Campo obrigatório';
      } else if (!_validateEmail(value)) {
        _isValid = false;
        _errorMessage = 'E-mail inválido';
      } else {
        _isValid = true;
        _errorMessage = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(),
      ),
      onChanged: _onEmailChanged,
      validator: (value) {
        if (!_isValid) {
          return _errorMessage;
        }
        return null;
      },
    );
  }
}
