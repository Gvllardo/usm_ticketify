import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:usm_ticketify_cliente/pages/cliente/cliente_detalle_evento_page.dart';

class EventoTerminadoTile extends StatefulWidget {
  // const EventoTile({super.key,});

  final String eventoId;
  final String nombre;
  final DateTime? fecha;
  final String lugar;
  final int likes;
  
  //CONSTRUCTOR
  EventoTerminadoTile({
    required this.eventoId,
    this.nombre = 'Sin nombre',
    this.fecha,
    this.lugar = 'Sin ubicacion',
    this.likes = 999,
  });

  @override
  State<EventoTerminadoTile> createState() => _EventoTerminadoTileState();
}

class _EventoTerminadoTileState extends State<EventoTerminadoTile> {
  final formatoDiaSemana = DateFormat('EEEE'); 
 //FORMATO DIA DE LA SEMANA
  final formatoDia = DateFormat('d');  
  //FORMATO DIA (NUMERO)
  final formatoMesYear = DateFormat('MMMM y'); 
 //FORMATO MES Y YEAR
  final formatoHora = DateFormat('H:mm', 'es_CL'); 
 //FORMATO HORA
  @override
  Widget build(BuildContext context) {
    
    //VARIABLE EVENTO FINALIZADO
    bool eventoFinalizado = widget.fecha != null ? DateTime.now().isAfter(widget.fecha!) : false;
    
    return Column(
      children: [
        //SI EL EVENTO ESTA FINALIZADO NO SE MUESTRA
        if (eventoFinalizado)
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 125,
          decoration: BoxDecoration(
            //CONDICION DE COLOR DEL CONTAINER DE EVENTO
            border: Border.all(color:Colors.grey.shade300, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              //Container de la izquierda
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.grey.shade300, width: 3)
                  )
                ),
                width: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //TEXTO DE FECHA
                    Text('${widget.fecha != null ? formatoDiaSemana.format(widget.fecha!): 'lunes'}', style: TextStyle(fontSize: 12)), //DIA DE LA SEMANA
                    Text('${widget.fecha != null ? formatoDia.format(widget.fecha!): 1}', style: TextStyle(fontSize: 30)), //DIA DEL MES
                    Text('${widget.fecha != null ? formatoMesYear.format(widget.fecha!): 'Mes Año'}', style: TextStyle(fontSize: 12)), //MES Y YEAR
                    //FIN TEXTO FECHA

                  ],
                ),
              ),
              //Expanded del centro del widget
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 3),

                        //TEXTO NOMBRE DEL EVENTO - ARTISTA
                        child: Text(
                          this.widget.nombre, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                        )
                        //FIN TEXTO NOMBRE EVENTO

                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 3),
                        child: Row(
                          children: [
                            Icon(MdiIcons.mapMarkerOutline, size: 20),
                            //TEXTO DE LA UBICACION DEL EVENTOS
                            Text(this.widget.lugar),
                          ],
                        )
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  //TEXTO HORA DEL EVENTO
                                  Icon(MdiIcons.clockOutline, size: 20),
                                  //TEXTO DE LA HORA DEL EVENTO
                                  Text('${widget.fecha != null ? formatoHora.format(widget.fecha!): '00:00'}')
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(this.widget.likes.toString()),
                                InkWell(
                                  child: Icon(MdiIcons.heartOutline),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //Container del boton de detalles
              InkWell(
                child: Container(
                  height: double.infinity,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)
                    ),
                    color:Colors.grey.shade300
                  ),
                  child: Icon(MdiIcons.menuRightOutline),
                ),
                onTap:() {
                  //VARIABLE PARA CAPTURAR EL ID DEL EVENTO
                  String eventoId = widget.eventoId;

                  //REDIRIGE A LA PAGINA DETALLE EVENTO
                  MaterialPageRoute route = MaterialPageRoute(builder: (context) => ClienteDetallesEventoPage(eventoId: eventoId));
                  Navigator.push(context, route);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}