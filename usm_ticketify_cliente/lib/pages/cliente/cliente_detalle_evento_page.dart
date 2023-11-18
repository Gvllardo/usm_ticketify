import 'package:flutter/material.dart';
import 'package:usm_ticketify_cliente/constants.dart';
import 'package:usm_ticketify_cliente/services/firestore_service.dart';

class ClienteDetallesEventoPage extends StatefulWidget {
  const ClienteDetallesEventoPage({super.key, required this.eventoId});

  final String eventoId;

  @override
  State<ClienteDetallesEventoPage> createState() => _ClienteDetallesEventoPageState();
}

class _ClienteDetallesEventoPageState extends State<ClienteDetallesEventoPage> {

  final estiloNombreEvento = TextStyle(fontSize: 28, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder(
        future: FirestoreService().evento(widget.eventoId),
        builder: (context, snapshot) {
          if(!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            //CARGAR DATOS DEL EVENTO
            var evento = snapshot.data?.data() as Map<String, dynamic>;

            //CAPTURAR LOS DATOS DEL EVENTO EN VARIABLES PARA MOSTRARLAS EN PANTALLA
            String nombre = evento['nombre'];
            String fotografia = evento['fotografia'];
            String descripcion = evento['descripcion'];
            DateTime fecha = evento['fecha'].toDate();
            String lugar = evento['lugar'];
  
            return Column(
              children: [
                //CONTAINER DE LA IMAGEN QUE SE MUESTRA EN EL APPBAR
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/$fotografia'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(appPrimaryColor))
                        ),
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        child: Container(child: Text(nombre, textAlign: TextAlign.center ,style: estiloNombreEvento)),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}