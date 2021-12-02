import 'package:flutter/material.dart';

import 'widgets/resonsive_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  _generateCards() {
    return List.generate(
      30,
      (index) => Card(
        color: Colors.primaries[index % Colors.primaries.length],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(
                size: 100,
              ),
              Text(
                'Card $index',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsividade"),
        centerTitle: true,
      ),
      body: ResponsiveWidget(
        mobile: GridView.count(
          crossAxisCount: 2,
          children: _generateCards(),
        ),
        tablet: GridView.count(
          crossAxisCount: 4,
          children: _generateCards(),
        ),
        desktop: GridView.count(
          crossAxisCount: 6,
          children: _generateCards(),
        ),
      ),
    );
  }
}
