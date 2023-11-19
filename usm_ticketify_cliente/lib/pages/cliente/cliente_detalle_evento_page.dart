import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:usm_ticketify_cliente/constants.dart';
import 'package:usm_ticketify_cliente/services/firestore_service.dart';

class ClienteDetallesEventoPage extends StatefulWidget {
  const ClienteDetallesEventoPage({super.key, required this.eventoId});

  final String eventoId;

  @override
  State<ClienteDetallesEventoPage> createState() => _ClienteDetallesEventoPageState();
}

class _ClienteDetallesEventoPageState extends State<ClienteDetallesEventoPage> {

  //VARIABLES ESTILOS DE TEXTO
  final estiloNombreEvento = TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white);
  final estiloSubtitulo = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  final estiloTextoEvento = TextStyle(fontSize: 16, color: Colors.white);

  //VARIABLES FORMATO DE FECHA / HORA
  final formatoFecha = DateFormat('dd-MM-yyyy');
  final formatoHora = DateFormat('H:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8280ff),
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
            String estado = evento['estado'];
            String fotografia = evento['fotografia'];
            String descripcion = evento['descripcion'];
            DateTime fecha = evento['fecha'].toDate();
            String lugar = evento['lugar'];
            int likes = evento['likes'];
  
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
                        margin: EdgeInsets.only(top: 15),
                        child: Container(child: Text(nombre, textAlign: TextAlign.center ,style: estiloNombreEvento)),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(MdiIcons.heart, color: Colors.white),
                            Text(likes.toString(), style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Fecha: ${formatoFecha.format(fecha)} a las ', style: estiloSubtitulo),
                                Text('${formatoHora.format(fecha)} horas', style: estiloSubtitulo),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Ubicación: ', style: estiloSubtitulo),
                                Text(lugar, style: estiloTextoEvento),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Estado: ', style: estiloSubtitulo),
                                Text(estado, style: estiloTextoEvento)
                              ],
                            ),
                          ],
                        ),
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