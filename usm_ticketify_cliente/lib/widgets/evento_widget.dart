import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EventoTile extends StatelessWidget {
  // const EventoTile({super.key,});

  final String nombre;
  final DateTime? fecha;
  final String lugar;

  //CONSTRUCTOR
  EventoTile({
    this.nombre = 'Sin nombre',
    this.fecha,
    this.lugar = 'Sin ubicacion',
  });

  final formatoDiaSemana = DateFormat('EEEE'); //FORMATO DIA DE LA SEMANA
  final formatoDia = DateFormat('d');  //FORMATO DIA (NUMERO)
  final formatoMesYear = DateFormat('MMMM y'); //FORMATO MES Y YEAR
  final formatoHora = DateFormat('H:mm'); //FORMATO HORA

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(top: 5),
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(5),
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
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //TEXTO DE FECHA
                  Text('${fecha != null ? formatoDiaSemana.format(fecha!): 'lunes'}', style: TextStyle(fontSize: 12)), //DIA DE LA SEMANA
                  Text('${fecha != null ? formatoDia.format(fecha!): 1}', style: TextStyle(fontSize: 28)), //DIA DEL MES
                  Text('${fecha != null ? formatoMesYear.format(fecha!): 'Mes Año'}', style: TextStyle(fontSize: 12)), //MES Y YEAR
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
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 3),

                      //TEXTO NOMBRE DEL EVENTO - ARTISTA
                      child: Text(
                        this.nombre, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                      )
                      //FIN TEXTO NOMBRE EVENTO

                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: Row(
                        children: [
                          Icon(MdiIcons.mapMarkerOutline, size: 20),
                          //TEXTO DE LA UBICACION DEL EVENTOS
                          Text(this.lugar),
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
                                Text('${fecha != null ? formatoHora.format(fecha!): '00:00'}')
                              ],
                            ),
                          ),
                          InkWell(
                            child: Icon(MdiIcons.heartOutline),
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
                  color: Color(0xFF6360ff)
                ),
                child: Icon(MdiIcons.menuRightOutline),
              ),
              onTap: () {
                
              },
            )
          ],
        ),
      ),
    );
  }
}