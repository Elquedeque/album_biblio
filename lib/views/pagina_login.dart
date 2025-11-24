import 'package:album_biblio/views/album_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'perfil_usuario.dart';

class PaginaLogin extends StatelessWidget {
  const PaginaLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            footerBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Container(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  child: Center(
                    child: Text(
                      "Gracias por su preferencia\nElaborado por Profesores y Estudiantes del TecNM.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                ),
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  action == AuthAction.signIn
                      ? "Bienvenido a la aplicación album_biblio. Inicie sesión para continuar."
                      : "Si aún no tiene una cuenta, por favor regístrese para continuar.",
                ),
              );
            },
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset('assets/images/logo.png'),
              );
            },
          );
        }
        return AlbumLista();
      },
    );
  }
}
