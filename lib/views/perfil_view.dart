import 'package:flutter/material.dart';

class PerfilView extends StatefulWidget {
  final String name;
  final String email;

  const PerfilView({super.key, required this.name, required this.email});

  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: const Color.fromARGB(255, 23, 100, 163),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nome: ${widget.name}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('Email: ${widget.email}', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
