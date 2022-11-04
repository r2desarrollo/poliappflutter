import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration inputDecoration(
      {required String hintext,
      required String labeltext,
      required Icon icono}) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
      hintText: hintext,
      labelText: labeltext,
      prefixIcon: icono,
    );
  }
}
