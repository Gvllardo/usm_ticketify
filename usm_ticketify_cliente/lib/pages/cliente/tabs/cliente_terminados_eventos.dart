import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:usm_ticketify_cliente/widgets/evento_terminado_widget.dart';
import 'package:usm_ticketify_cliente/services/firestore_service.dart';

class ClienteEventosTerminadosPage extends StatelessWidget {
  const ClienteEventosTerminadosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.topLeft,
              child: Text('Eventos finalizados', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
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
                      return EventoTerminadoTile(
                        nombre: evento['nombre'],
                        fecha: evento['fecha'].toDate(),
                        lugar: evento['lugar'],
                        likes: int.parse(evento['likes'].toString()),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}