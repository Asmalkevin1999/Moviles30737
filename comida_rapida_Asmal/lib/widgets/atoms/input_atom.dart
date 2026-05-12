import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputAtom extends StatelessWidget {

  final TextEditingController controller;
  final String label;

  final TextInputType keyboardType;

  final List<TextInputFormatter>? inputFormatters;

  const InputAtom({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {

    return TextField(
      controller: controller,

      keyboardType: keyboardType,

      inputFormatters: inputFormatters,

      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),

      decoration: InputDecoration(
        labelText: label,

        labelStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w600,
        ),

        prefixIcon: Icon(
          label == "Cantidad"
              ? Icons.numbers
              : Icons.person,
          color: Colors.red,
        ),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
      ),
    );
  }
}