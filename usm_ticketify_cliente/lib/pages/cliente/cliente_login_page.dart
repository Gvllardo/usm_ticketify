import 'package:flutter/material.dart';

class ClienteLoginPage extends StatelessWidget {
  const ClienteLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Iniciar sesion en tu cuenta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text('Correo electrónico:', style: TextStyle(fontSize: 16)),
                          ),
                          Container(
                            child: TextFormField(
                              keyboardType: TextInputType.none,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 45),
                            alignment: Alignment.topLeft,
                            child: Text('Contraseña:', style: TextStyle(fontSize: 16)),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.none,
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 40),
                      child: FilledButton(
                        child: Text('Iniciar sesión', style: TextStyle(fontSize: 16)),
                        onPressed: () {
                          
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/images/google.png'), height: 25),
                            Text(' Iniciar sesión con Google', style: TextStyle(fontSize: 16))
                          ],
                        ),
                        onPressed: () {
                          
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/images/facebook.png'), height: 25),
                            Text(' Iniciar sesión con Facebook', style: TextStyle(fontSize: 16))
                          ],
                        ),
                        onPressed: () {
                          
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300)
                ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('¿No tienes cuenta? ', style: TextStyle(fontSize: 18)),
                    Text('Regístrate aquí.' , style: TextStyle(fontSize: 18, color: Colors.blueAccent))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}