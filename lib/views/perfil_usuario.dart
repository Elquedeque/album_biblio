import 'package:flutter/material.dart';

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({super.key});
  final String name = "Francisco Salazar Figueroa";
  final String puesto = "Estudiante de Ingenieria en Informatica";
  final String email = "Fasf040412@gmail.com";
  final String tel = "+52 637 103 7897";
  final String description =
      "Estudiante de Ingenieria en Informatica cursando el 7mo semestre en el TecNM campues Hermosillo.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Perfil de Usuario",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 400,
            height: 600,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 140,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    border: Border.all(width: 3),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.shadow,
                        spreadRadius: 3,
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/images/profile.jpg'),
                  ),
                ),
                const Divider(),
                Text(
                  textAlign: TextAlign.center,
                  name,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        color: Theme.of(context).colorScheme.shadow,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    border: BoxBorder.fromLTRB(
                      bottom: const BorderSide(
                        width: 3,
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    puesto,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    const Spacer(flex: 1),
                    Expanded(
                      flex: 10,
                      child: Text(
                        textAlign: TextAlign.center,
                        description,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
                const Divider(),
                Text(
                  "Contacto:",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text('Email: $email\nTel: $tel', textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
