import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  Stream<QuerySnapshot> eventos(){
    //CONSULTA EVENTOS
    return FirebaseFirestore.instance.collection('eventos').orderBy('fecha', descending: false).snapshots();
  }
}