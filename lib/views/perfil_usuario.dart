import 'package:album_biblio/views/pagina_edit_perfil.dart';
import 'package:flutter/material.dart';
import 'pagina_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'pagina_edit_perfil.dart';

class PerfilUsuario extends StatelessWidget {
  final User? usuario;
  const PerfilUsuario({super.key, this.usuario});
  final String name = "Francisco Salazar Figueroa";
  final String puesto = "Estudiante de Ingenieria en Informatica";
  final String email = "Fasf040412@gmail.com";
  final String tel = "+52 637 103 7897";
  final String description =
      "Estudiante de Ingenieria en Informatica cursando el 7mo semestre en el TecNM campues Hermosillo.";

  @override
  Widget build(BuildContext context) {
    return (usuario == null)
        ? const PaginaLogin()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Text(
                "Perfil de usuario",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaginaEditPerfil(usuario: usuario),
                  ),
                );
              },
              child: const Icon(Icons.edit),
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
                    borderRadius: BorderRadius.circular(50),
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
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onInverseSurface,
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.shadow,
                              spreadRadius: 1,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child:
                              (usuario!.photoURL != null &&
                                  usuario!.photoURL != "")
                              ? Image.network(usuario!.photoURL ?? "")
                              : Image.asset('assets/images/profile.jpg'),
                        ),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            usuario!.displayName ?? name,
                            style: Theme.of(context).textTheme.headlineMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                  shadows: [
                                    Shadow(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.shadow,
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Container(
                        decoration: BoxDecoration(
                          border: BoxBorder.fromLTRB(
                            bottom: const BorderSide(
                              width: 2,
                              color: Colors.black,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                        child: Text(
                          puesto,
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const Spacer(flex: 1),
                          Expanded(flex: 10, child: Text(description)),
                          const Spacer(flex: 1),
                        ],
                      ),
                      const Divider(),
                      Text(
                        "Contacto:",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Correo electrónico: "),
                          const SizedBox(width: 10),
                          Text(usuario!.email ?? email),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Teléfono: "),
                          const SizedBox(width: 10),
                          Text(usuario!.phoneNumber ?? tel),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("ID de Usuario: "),
                          const SizedBox(width: 10),
                          Text(usuario!.uid),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
