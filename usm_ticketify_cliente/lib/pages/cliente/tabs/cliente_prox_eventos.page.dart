import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:usm_ticketify_cliente/widgets/evento_widget.dart';
import 'package:usm_ticketify_cliente/services/firestore_service.dart';

class ClienteProximosEventosPage extends StatelessWidget {
  const ClienteProximosEventosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
              return EventoTile(
                nombre: evento['nombre'],
                fecha: evento['fecha'].toDate(),
                lugar: evento['lugar'],
                likes: int.parse(evento['likes'].toString()),
              );
            },
          );
        }
      },
    );
  }
}