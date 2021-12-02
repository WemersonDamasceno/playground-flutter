import 'package:flutter/material.dart';

class BolinhasLinhas extends StatelessWidget {
  final int paginaEmDestaque;
  final int tamanhoDaLista;
  const BolinhasLinhas(
      {Key? key, required this.paginaEmDestaque, required this.tamanhoDaLista})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          tamanhoDaLista,
          (index) {
            return GestureDetector(
              onTap: () {},
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                margin: const EdgeInsets.only(left: 15, right: 15),
                width: paginaEmDestaque == index ? 15 : 10,
                height: 10,
                decoration: BoxDecoration(
                  color: paginaEmDestaque == index ? Colors.red : Colors.grey,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ],
    );
  }
}
