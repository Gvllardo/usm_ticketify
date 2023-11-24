import 'package:flutter/material.dart';
import 'package:usm_ticketify_cliente/services/firestore_service.dart';

class AdminEditarEventoPage extends StatefulWidget {
  const AdminEditarEventoPage({super.key, required this.eventoId});

  final String eventoId;

  @override
  State<AdminEditarEventoPage> createState() => _AdminEditarEventoPageState();
}

class _AdminEditarEventoPageState extends State<AdminEditarEventoPage> {

  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController lugarCtrl = TextEditingController();
  String estadoActual = '';
  String? selectedOption = ''; //VARIABLE PARA ALMACENAR LA OPCION

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffc456),
        title: Text('Editar evento (Admin)'),
      ),
      body: FutureBuilder(
        future: FirestoreService().evento(widget.eventoId),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var evento = snapshot.data?.data() as Map<String, dynamic>;

            String nombre = evento['nombre'];
            String lugar = evento['lugar'];
            String estado = evento['estado'];

            if (selectedOption == null) {
              selectedOption = estado;
            }

            return Column(
              children: [
                Expanded(
                  child: Form(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: ListView(
                        children: [
                          Container(
                            child: Text('Nombre del evento:'),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: TextFormField(
                              controller: nombreCtrl,
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: nombre
                              ),
                            ),
                          ),
                          Container(
                            child: Text('Ubicación del evento:'),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: TextFormField(
                              controller: lugarCtrl,
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: lugar
                              ),
                            ),
                          ),
                          Container(
                            child: Text('Estado del evento:'),
                          ),
                          Container(
                            child: Column(
                              children: [
                                RadioListTile(
                                  title: Text('Próximamente'),
                                  value: 'Próximamente',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value as String;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: Text('Finalizado'),
                                  value: 'Finalizado',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value as String;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}