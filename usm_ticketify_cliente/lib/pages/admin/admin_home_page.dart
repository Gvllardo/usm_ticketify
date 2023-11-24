import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:usm_ticketify_cliente/pages/admin/admin_agrega_evento_page.dart';
import 'package:usm_ticketify_cliente/pages/admin/admin_editar_evento_page.dart';
import 'package:usm_ticketify_cliente/services/firestore_service.dart';
import 'package:usm_ticketify_cliente/widgets/evento_admin_widget.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffc456),
        title: Text('Ticketify (Admin)'),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.plus),
            onPressed: () {
              MaterialPageRoute route = MaterialPageRoute(builder: (context) => AdminAgregarEventoPage());
              setState(() {
                Navigator.push(context, route);
              });
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 200,
              color: Colors.blue,
            ),
            ListTile(
              leading: Icon(MdiIcons.logout),
              title: Text('Cerrar sesión'),
              onTap: () async {
                await FirestoreService().cerrarSesionGoogle().then((value){
                  Navigator.pop(context); //CIERRA EL DRAWER
                  Navigator.pop(context); //CIERRA LA PAGINA DE ADMIN
                });
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
            child: StreamBuilder(
              stream: FirestoreService().eventos(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var evento = snapshot.data!.docs[index];
                      return Slidable(
                        child: EventoAdminTile(
                          eventoId: evento.id,
                          nombre: evento['nombre'],
                          fecha: evento['fecha'].toDate(),
                          lugar: evento['lugar'],
                          likes: int.parse(evento['likes'].toString()),
                        ),
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              icon: MdiIcons.pencilOutline,
                              backgroundColor: Colors.blueAccent,
                              onPressed: (context) {
                                MaterialPageRoute route = MaterialPageRoute(builder: (context) => AdminEditarEventoPage(eventoId: evento.id));
                                setState(() {
                                  print(evento.id);
                                  Navigator.push(context, route);
                                });
                              },
                            ),
                            SlidableAction(
                              icon: MdiIcons.deleteOutline,
                              backgroundColor: Colors.red,
                              onPressed: (context) {
                                
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          ],
        ),
      )
    );
  }
}