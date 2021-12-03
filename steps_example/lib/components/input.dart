import 'package:flutter/material.dart';

class InputTextoWidget extends StatelessWidget {
  final TextEditingController entradaController;
  final TextInputType entradaTipo;
  final bool? mostrarSenha;
  final String labelInput;
  final String? valorSenhaConfirmar;
  final IconData? sufixIcon;
  final IconData prefixIcon;
  final GestureTapCallback? onPressIconSufix;
  final GestureTapCallback? onPressIconPrefix;

  const InputTextoWidget({
    Key? key,
    required this.labelInput,
    required this.entradaController,
    required this.entradaTipo,
    required this.mostrarSenha,
    required this.prefixIcon,
    this.onPressIconSufix,
    this.sufixIcon,
    this.onPressIconPrefix,
    this.valorSenhaConfirmar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      obscureText: mostrarSenha ?? false,
      controller: entradaController,
      style: TextStyle(
        fontSize: size.height * 0.022,
      ),
      keyboardType: entradaTipo,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(right: -size.width * 0.2),
        labelText: labelInput,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: IconButton(
          icon: Icon(sufixIcon),
          onPressed: onPressIconSufix,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Este campo não pode ser vazio!";
        }
        //Se for email, verificar se o formato é valido!
        if (entradaTipo.toString() == TextInputType.emailAddress.toString()) {
          String pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regExp = RegExp(pattern);
          if (!regExp.hasMatch(value)) {
            return "Este formato de email é inválido!";
          } else {
            return null;
          }
        }
        //Se for email, verificar se possui mais de 6 caracteres!
        if (entradaTipo.toString() ==
                TextInputType.visiblePassword.toString() &&
            value.length < 6) {
          return "A senha deve ter no minimo 6 digitos!";
        }

        //Se for o campo de confirmar a senha
        if (labelInput.toString() == "Confirme sua senha") {
          if (value.toString() != valorSenhaConfirmar) {
            return "As senhas não são iguais!";
          }
        }

        return null;
      },
    );
  }
}
