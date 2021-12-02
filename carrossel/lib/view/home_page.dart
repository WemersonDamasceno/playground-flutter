import 'package:carrossel/model/slide_list.dart';
import 'package:flutter/material.dart';

import 'bolinhas_row.dart';
import 'slide_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SlideList slideList = SlideList();

  PageController pageController = PageController(viewportFraction: 0.8);

  int currentPage = 0;
  @override
  void initState() {
    pageController.addListener(() {
      int next = pageController.page!.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Carousel"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: SlideCarousel(
              listaImagens: slideList.carouselImages,
              pageController: pageController,
              paginaEscolhida: currentPage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: BolinhasLinhas(
              paginaEmDestaque: currentPage,
              tamanhoDaLista: slideList.carouselImages.length,
            ),
          ),
        ],
      ),
    );
  }
}
