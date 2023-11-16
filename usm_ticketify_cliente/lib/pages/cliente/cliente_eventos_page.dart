import 'package:flutter/material.dart';
import 'package:usm_ticketify_cliente/pages/cliente/tabs/cliente_prox_eventos.page.dart';
import 'package:usm_ticketify_cliente/pages/cliente/tabs/cliente_terminados_eventos.dart';
import 'package:usm_ticketify_cliente/pages/cliente/tabs/cliente_todos_eventos.page.dart';

class ClienteEventosPage extends StatelessWidget {
  const ClienteEventosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Color(0xFF6360ff),
                borderRadius: BorderRadius.circular(15)
              ),
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                dividerColor: Colors.white,
                unselectedLabelColor: Colors.grey.shade400,
                tabs: [
                  Tab(
                    child: Container(
                      child: Text('Todos'),
                    ),
                  ),
                  Tab(
                    child: Text('Proximos eventos'),
                  ),
                  Tab(
                    child: Text('Eventos finalizados'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SizedBox(child: ClienteTodosEventosPage()),
                  ClienteProximosEventosPage(),
                  ClienteEventosTerminados()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}