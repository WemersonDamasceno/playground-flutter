import 'package:flutter/material.dart';

class SlideCarousel extends StatelessWidget {
  final int paginaEscolhida;
  final PageController pageController;
  final List<String> listaImagens;

  const SlideCarousel(
      {Key? key,
      required this.paginaEscolhida,
      required this.pageController,
      required this.listaImagens})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: listaImagens.length,
      itemBuilder: (_, index) {
        return PageSlide(
          paginaEmDestaque: paginaEscolhida == index,
          imagem: listaImagens[index],
        );
      },
    );
  }
}

class PageSlide extends StatefulWidget {
  final String imagem;
  final bool paginaEmDestaque;

  const PageSlide(
      {Key? key, required this.imagem, required this.paginaEmDestaque})
      : super(key: key);

  @override
  _PageSlideState createState() => _PageSlideState();
}

class _PageSlideState extends State<PageSlide> {
  @override
  Widget build(BuildContext context) {
    final double top = widget.paginaEmDestaque ? 30 : 100;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.fromLTRB(10, top, 10, 30),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 7,
          )
        ],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(widget.imagem),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
