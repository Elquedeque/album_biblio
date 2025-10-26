import 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
      home: Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 231, 213),
      appBar: AppBar(
      title: const Text('Perfil de Usuario'),
      backgroundColor: Color.fromARGB(255, 56, 117, 81),
      centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
            const SizedBox(height: 40),
            // Imagen
            CircleAvatar(
            radius: 64,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            // Nombre
            const Text(
            'Francisco Salazar Figueroa',
            style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            shadows: [
            Shadow(
            offset: Offset(1.2, 1.2),
            blurRadius: 1.5,
            color: Color.fromARGB(255, 43, 53, 46),
            ),
            ],
            ),
            ),
            const SizedBox(height: 40),
            //Descripcion
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
              'Estudiante de Ingenieria en Informatica cursando el 7tmo semestre en el TecNM campus Hermosillo',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
              shadows: [
              Shadow(
              offset: Offset(1, 1),
              blurRadius: 1,
              color: Color.fromARGB(255, 40, 46, 42),
              ),
              ],
              ),
              ),
              ),
              const SizedBox(height: 40),
              //Datos Generales
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 6.0),
              child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green.shade700, width: 1),
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
              Text(
              'Email: l22330883@hermosillo.tecnm.mx',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(height: 6),
              Text(
              'Teléfono: +52 637 103 7897',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(height: 6),
              Text(
              'LinkedIn: www.linkedin.com/in/fasf0412',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
            ) ,
            ),
            ),
          ],
        ),
      ),
    ),
  );
  }
}