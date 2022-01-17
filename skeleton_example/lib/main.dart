import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonTheme(
        themeMode: ThemeMode.dark,
        darkShimmerGradient: const LinearGradient(
          colors: [
            Color(0xFF222222),
            Color(0xFF242424),
            Color(0xFF2B2B2B),
            Color(0xFF242424),
            Color(0xFF222222),
          ],
          stops: [
            0.0,
            0.2,
            0.5,
            0.8,
            1,
          ],
          begin: Alignment(-2.4, -0.2),
          end: Alignment(2.4, 0.2),
          tileMode: TileMode.clamp,
        ),
        child:  MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { 
  bool isLoading = true;
  
  @override
  void initState() {
    super.initState();
    startTime();
  }


  startTime() async {
    var _duration = const Duration(seconds: 10);
    return Timer(_duration, removerSkeleton);
  }
  removerSkeleton(){
    setState(() {
      isLoading = false;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: isLoading ? ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: SkeletonItem(
                  child: Column(
                children: [
                  //Avatar e nome
                  Row(
                    children: [
                      const SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            shape: BoxShape.circle, width: 50, height: 50),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SkeletonParagraph(
                          style: SkeletonParagraphStyle(
                              lines: 1,
                              lineStyle: SkeletonLineStyle(
                                randomLength: true,
                                height: 20,
                                borderRadius: BorderRadius.circular(8),
                                minLength:
                                    MediaQuery.of(context).size.width / 6,
                                maxLength:
                                    MediaQuery.of(context).size.width / 3,
                              )),
                        ),
                      )
                    ],
                  ),
                  
                  //Foto publicada
                  const SizedBox(height: 12),
                  SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: MediaQuery.of(context).size.width * .9,
                      height: 350,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  const SizedBox(height: 8),

                  //Privacidade, curtidas e local
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 40, height: 20)),
                            SizedBox(width: 8),
                            SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 40, height: 20)),
                            SizedBox(width: 8),
                            SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 40, height: 20)),
                          ],
                        ),
                        const SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 16,
                              width: 64,),
                        )
                      ],
                    ),
                  )
                ],
              )),
            ),
          ),
        ) : 
        const Center(child: Text("Dados carregados", style: TextStyle(color: Colors.white),),),);
  }
}
