import 'package:flutter/material.dart';
import 'package:usm_ticketify_cliente/widgets/evento_widget.dart';

class ClienteTodosEventosPage extends StatelessWidget {
  const ClienteTodosEventosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return EventoTile();
      },
    );
  }
}