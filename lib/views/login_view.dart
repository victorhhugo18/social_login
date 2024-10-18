// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:social_login/views/perfil_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Map<String, dynamic>? _userData;

  Future<void> _loginWithFacebook() async {
  try {
    final LoginResult result = await FacebookAuth.instance.login();
    
    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      print('Login bem-sucedido: $userData');
    } else {
      print('Erro de login: ${result.status}');
    }
  } catch (e) {
    print('Erro de login com Facebook: $e');
  }
}

  Future<void> _logout() async {
    await FacebookAuth.instance.logOut();
    setState(() {
      _userData = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Social'),
        backgroundColor: const Color.fromARGB(255, 23, 100, 163),
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  iconColor: Colors.blue,
                  icon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                  hintText: 'Insira seu e-mail',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(fontSize: 18),
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye),
                  iconColor: Colors.blue,
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                  hintText: 'Insira sua senha',
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {},
              child: Text(
                'Entrar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 35, 107, 167),
                foregroundColor: Colors.white,
                fixedSize: Size(200, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await _loginWithFacebook();
                if (_userData != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PerfilView(
                        name: _userData!['name'],
                        email: _userData!['email'],
                      ),
                    ),
                  );
                } else {
                  print('Login falhou, _userData está nulo');
                }
              },
              child: Text(
                'Login com Facebook',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 35, 107, 167),
                foregroundColor: Colors.white,
                fixedSize: Size(200, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
