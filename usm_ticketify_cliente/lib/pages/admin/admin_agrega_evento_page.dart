import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:usm_ticketify_cliente/services/firestore_service.dart';
import 'package:usm_ticketify_cliente/widgets/evento_form.dart';

class AdminAgregarEventoPage extends StatefulWidget {
  const AdminAgregarEventoPage({super.key});

  @override
  State<AdminAgregarEventoPage> createState() => _AdminAgregarEventoPageState();
}

class _AdminAgregarEventoPageState extends State<AdminAgregarEventoPage> {

  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController ubicacionCtrl = TextEditingController();
  TextEditingController descripcionCtrl = TextEditingController();

  String tipoEvento = '';
  String estadoEvento = '';
  int likesEvento = 0;

  final formatoFecha = DateFormat('dd-MM-yyyy H:mm');
  DateTime fecha_evento = DateTime.now();
  File? imagenSeleccionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffc456),
        title: Text('Agregar evento (Admin)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: ListView(
            children: [
              Column(
                children: [
                  EventoForm(
                    controller: nombreCtrl,
                    titulo: 'Nombre del evento',
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Text('Fecha y hora: ', style: TextStyle(fontSize: 16)),
                        Text(formatoFecha.format(fecha_evento), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Spacer(),
                        IconButton(
                          icon: Icon(MdiIcons.calendar),
                          onPressed: () {
                            //MOSTRAR EL CALENDARIO
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2026),
                              locale: Locale('es')
                            ).then((fecha){
                              if (fecha != null){
                                //SI FECHA ES DISTINTO DE NULL MOSTRAR EL PICKER DE LA HORA
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((hora) {
                                  if (hora != null){
                                    DateTime fecha_hora_evento = DateTime(
                                      fecha.year,
                                      fecha.month,
                                      fecha.day,
                                      hora.hour,
                                      hora.minute
                                    );
                                    setState(() {
                                      fecha_evento = fecha_hora_evento;
                                    });
                                  }
                                });
                              }
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: EventoForm(
                      controller: ubicacionCtrl,
                      titulo: 'Ubicación',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 25),
                    child: EventoForm(
                      controller: descripcionCtrl,
                      titulo: 'Descripción',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tipo de evento:', style: TextStyle(fontSize: 16)),
                        DropdownButtonFormField(
                          items: [
                            DropdownMenuItem(child: Text('Concierto'), value: 'Concierto'),
                            DropdownMenuItem(child: Text('Fiesta'), value: 'Fiesta'),
                            DropdownMenuItem(child: Text('Evento deportivo'), value: 'Evento deportivo'),
                          ],
                          onChanged: (tipoEventoSeleccionado) {
                            setState(() {
                              tipoEvento = tipoEventoSeleccionado!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Estado:', style: TextStyle(fontSize: 16)),
                        DropdownButtonFormField(
                          items: [
                            DropdownMenuItem(child: Text('Próximamente'), value: 'Próximamente'),
                            DropdownMenuItem(child: Text('Finalizado'), value: 'Finalizado'),
                          ],
                          onChanged: (estadoSeleccionado) {
                            setState(() {
                              estadoEvento = estadoSeleccionado!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text('Seleccionar imagen'),
                      onPressed: () async {
                        if(nombreCtrl.text.isNotEmpty){
                          final picker = ImagePicker();
                          final imagenSeleccionada = await picker.pickImage(source: ImageSource.gallery);

                          if (imagenSeleccionada != null){
                            print('subir imagen');
                          }
                        } else {
                          print('No se le ha asignado nombre al evento');
                        }
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text('Agregar evento'),
                      onPressed: () {
                        String nombreImagen = '${nombreCtrl.text}.png';
                        FirestoreService().eventosAgregar(
                          nombreCtrl.text.trim(),
                          fecha_evento,
                          ubicacionCtrl.text.trim(),
                          descripcionCtrl.text.trim(),
                          tipoEvento,
                          likesEvento,
                          nombreImagen,
                          estadoEvento,
                        );
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

