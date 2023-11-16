import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:usm_ticketify_cliente/pages/cliente/cliente_eventos_destacados.dart';
import 'package:usm_ticketify_cliente/pages/cliente/cliente_eventos_page.dart';
import 'package:usm_ticketify_cliente/pages/cliente/cliente_login_page.dart';

class ClienteHomePage extends StatefulWidget {
  const ClienteHomePage({super.key});

  @override
  State<ClienteHomePage> createState() => _ClienteHomePageState();
}

class _ClienteHomePageState extends State<ClienteHomePage> {

  final estiloTextoAppBar = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  
  //Variables BottomNavigationBar
  int paginaSeleccionada = 0;
  Widget pagina = ClienteEventosPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticketify', style: estiloTextoAppBar),
        backgroundColor: Color(0xFF6360ff),
      ),
      body: pagina,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaSeleccionada,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF8280ff),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade300,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.home),
            label: 'Inicio'
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.star),
            label: 'Destacados'
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.accountCircle),
            label: 'Usuario'
          ),
        ],
        onTap: (index) {
          setState(() {
            paginaSeleccionada = index;
            switch (paginaSeleccionada){
              case 0:
                pagina = ClienteEventosPage();
                break;
              case 1:
                pagina = ClienteEventosDestacados();
                break;
              case 2:
                pagina = ClienteLoginPage();
                break;
            }
          });
        },
      ),
    );
  }
}