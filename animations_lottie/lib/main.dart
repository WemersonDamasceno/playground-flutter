import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//TickerProviderStateMixin o mixim para fazer que ocorra a animacao apenas quando a tela estiver exibida
class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final AnimationController _controllerCheckbox;
  //late final AnimationController _controllerCheckAnimation;
  bool check = false;

  @override
  void initState() {
    super.initState();
    //Animação do correto
    // _controllerCheckAnimation = AnimationController(vsync: this);
    // _controllerCheckAnimation.duration = const Duration(milliseconds: 2000);
    // _controllerCheckAnimation.forward();

    //Animacao do checkbox
    _controllerCheckbox = AnimationController(vsync: this);
    _controllerCheckbox.duration = const Duration(milliseconds: 1500);
  }

  @override
  void dispose() {
    _controllerCheckbox.dispose();
    //_controllerCheckAnimation.dispose();
    super.dispose();
  }

  togle() {
    if (!check) {
      _controllerCheckbox.forward();
    } else {
      _controllerCheckbox.reverse();
    }
    setState(() {
      check = !check;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            check
                ? SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        LottieBuilder.asset(
                          "assets/check_animation.json",
                          controller: _controllerCheckbox,

                          //controller: _controllerCheckAnimation,
                        ),
                        const Text(
                          "Parabens!",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: 300,
                  ),
            GestureDetector(
              onTap: togle,
              child: SizedBox(
                width: 200,
                child: LottieBuilder.asset(
                  "assets/checkbox_animation.json",
                  controller: _controllerCheckbox,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
