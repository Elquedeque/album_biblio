import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaginaEditPerfil extends StatefulWidget {
  final User? usuario;

  const PaginaEditPerfil({super.key, required this.usuario});

  @override
  State<PaginaEditPerfil> createState() => _PaginaEditPerfilState();
}

class _PaginaEditPerfilState extends State<PaginaEditPerfil> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController ctrPhotoUrl = TextEditingController();
  final TextEditingController ctrNombre = TextEditingController();
  final TextEditingController ctrEmail = TextEditingController();

  @override
  void initState() {
    if (widget.usuario != null) {
      ctrPhotoUrl.text = widget.usuario!.photoURL ?? "";
      ctrNombre.text = widget.usuario!.displayName ?? "";
      ctrEmail.text = widget.usuario!.email ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    ctrPhotoUrl.dispose();
    ctrNombre.dispose();
    ctrEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Editar perfil de Usuario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'URL de la foto de perfil',
                  ),
                  controller: ctrPhotoUrl,
                  validator: (String? valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Proporcione un URL válido para la foto de perfil';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Nombre del usuario',
                  ),
                  controller: ctrNombre,
                  validator: (String? valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Proporcione el nombre del usuario';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Correo electrónico',
                  ),
                  enabled: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: ctrEmail,
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _validar(context),
                      child: const Text("Aceptar"),
                    ),
                    const SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Cancelar"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validar(BuildContext context) {
    final form = _formkey.currentState;
    if (form?.validate() == false) {
      return;
    }
    _actualizar().then((value) {
      Navigator.of(context).pop();
    });
  }

  Future _actualizar() async {
    User? usuario = widget.usuario;
    if (usuario != null) {
      if (ctrPhotoUrl.text != usuario.photoURL) {
        await usuario.updatePhotoURL(ctrPhotoUrl.text);
      }
      if (ctrNombre.text != usuario.displayName) {
        await usuario.updateDisplayName(ctrNombre.text);
      }
    }
  }
}
