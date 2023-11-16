import 'package:flutter/material.dart';
import 'package:usm_ticketify_cliente/pages/cliente/tabs/cliente_prox_eventos.page.dart';
import 'package:usm_ticketify_cliente/pages/cliente/tabs/cliente_terminados_eventos.dart';
import 'package:usm_ticketify_cliente/pages/cliente/tabs/cliente_todos_eventos.page%20copy.dart';

class ClienteEventosPage extends StatelessWidget {
  const ClienteEventosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text('Todos'),
                ),
                Tab(
                  child: Text('Proximos eventos'),
                ),
                Tab(
                  child: Text('Eventos finalizados'),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ClienteTodosEventosPage(),
                  ClienteProximosEventosPage(),
                  ClienteEventosTerminados()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}