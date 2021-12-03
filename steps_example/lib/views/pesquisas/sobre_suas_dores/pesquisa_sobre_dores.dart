import 'package:flutter/material.dart';
import 'package:steps_example/components/input.dart';

class PesquisaSuasDores extends StatelessWidget {
  final entradaController = TextEditingController();

  PesquisaSuasDores({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: InputTextoWidget(
            labelInput: "Data de nascimento",
            entradaController: entradaController,
            entradaTipo: TextInputType.name,
            mostrarSenha: false,
            prefixIcon: Icons.calendar_today_rounded,
          ),
        ),
        InputTextoWidget(
          labelInput: "Em que cidade você mora?",
          entradaController: entradaController,
          entradaTipo: TextInputType.name,
          mostrarSenha: false,
          prefixIcon: Icons.location_on_outlined,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: InputTextoWidget(
            labelInput: "Você estudou por quantos anos?",
            entradaController: entradaController,
            entradaTipo: TextInputType.name,
            mostrarSenha: false,
            prefixIcon: Icons.airline_seat_recline_normal_sharp,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.40,
              child: InputTextoWidget(
                labelInput: "Altura(cm)",
                entradaController: entradaController,
                entradaTipo: TextInputType.name,
                mostrarSenha: false,
                prefixIcon: Icons.info,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                child: InputTextoWidget(
                  labelInput: "Peso(kg)",
                  entradaController: entradaController,
                  entradaTipo: TextInputType.name,
                  mostrarSenha: false,
                  prefixIcon: Icons.info,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
