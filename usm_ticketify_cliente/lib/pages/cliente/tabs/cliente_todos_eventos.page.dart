import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:usm_ticketify_cliente/widgets/evento_widget.dart';
import 'package:usm_ticketify_cliente/services/firestore_service.dart';

class ClienteTodosEventosPage extends StatelessWidget {
  const ClienteTodosEventosPage({super.key});

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

              //OBTENER LOS DATOS DE FIRESTORE
              String nombre = evento['nombre'];
              DateTime fecha = evento['fecha'].toDate();
              String lugar = evento['lugar'];

              return EventoTile(
                nombre: nombre,
                fecha: fecha,
                lugar: lugar,
              );
            },
          );
        }
      },
    );
  }
}