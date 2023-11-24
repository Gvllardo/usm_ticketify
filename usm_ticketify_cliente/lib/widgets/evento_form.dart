import 'package:flutter/material.dart';

class EventoForm extends StatelessWidget {
  const EventoForm({
    super.key,
    required this.controller,
    required this.titulo,
    this.tipoTeclado = TextInputType.text
  });

  final TextEditingController controller;
  final String titulo;
  final TextInputType tipoTeclado;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.tipoTeclado,
      controller: controller,
      decoration: InputDecoration(
        hintText: this.titulo,
      ),
    );
  }
}