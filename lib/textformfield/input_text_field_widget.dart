import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormInput extends StatefulWidget {
  final String? Function(String?)? validator;
  final String labelText;
  final double? bottom;
  final List<TextInputFormatter>? formatters;
  final TextEditingController controller;
  final bool? isLastInput;
  final bool? isPassword;
  const TextFormInput({
    super.key,
    required this.labelText,
    required this.controller,
    this.validator,
    this.bottom,
    this.formatters,
    this.isLastInput,
    this.isPassword,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TextFormInputState createState() => _TextFormInputState();
}

class _TextFormInputState extends State<TextFormInput> {
  bool _showError = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.bottom ?? 12,
      ),
      child: TextFormField(
        obscureText: widget.isPassword ?? false,
        controller: widget.controller,
        textInputAction: widget.isLastInput ?? false ? TextInputAction.done : TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15.5,
            horizontal: 12,
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: _showError ? Colors.red : Colors.black),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          setState(() {
            _showError = widget.validator?.call(value) != null;
          });
          return widget.validator?.call(value);
        },
      ),
    );
  }
}
