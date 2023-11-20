import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirestoreService{
  Stream<QuerySnapshot> eventos(){
    //CONSULTA EVENTOS
    return FirebaseFirestore.instance.collection('eventos').orderBy('fecha', descending: false).snapshots();
  }

  Future<DocumentSnapshot> evento(String eventoId){
    //CONSULTA SOLO EL EVENTO PARA DETALLES DEL EVENTO
    return FirebaseFirestore.instance.collection('eventos').doc(eventoId).get();
  }

  Future<UserCredential> iniciarSesionGoogle() async {
  //INICIA AUTENTICACION DE GOOGLE
  final GoogleSignInAccount? usuarioGoogle = await GoogleSignIn().signIn();

  //OBTIENE LOS DETALLES DE LA AUTENTICACION
  final GoogleSignInAuthentication? googleAuth = await usuarioGoogle?.authentication;

  //CREA LAS NUEVAS CREDENCIALES
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // INICIA SESION RETORNANDO LAS CREDENCIALES DE LA CUENTA
  return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> cerrarSesionGoogle() async {
    await GoogleSignIn().signOut();
  }
}