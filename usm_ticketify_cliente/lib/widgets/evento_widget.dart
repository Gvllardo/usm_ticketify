import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EventoTile extends StatelessWidget {
  const EventoTile({super.key});


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
                  Text('miercoles', style: TextStyle(fontSize: 12)),
                  Text('16', style: TextStyle(fontSize: 28)),
                  Text('octubre 2023', style: TextStyle(fontSize: 12)),
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
                      child: Text(
                        'The Weeknd', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: Row(
                        children: [
                          Icon(MdiIcons.mapMarkerOutline, size: 20),
                          Text('Estadio Bicentenario La Florida'),
                        ],
                      )
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(MdiIcons.clockOutline, size: 20),
                                Text('16:00')
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