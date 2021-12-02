import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: const Text("AppBar com guias"),
              bottom: TabBar(
                indicator: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)), //Cria borda
                    color: Colors.grey.shade700),
                tabs: const [
                  Tab(icon: Icon(Icons.android)),
                  Tab(icon: Icon(Icons.cloud_download))
                ],
              )),
          body: const TabBarView(
            children: <Widget>[
              Text("Primeira guia selecionada"),
              Text("Segunda guia selecionada")
            ],
          ),
        ),
      ),
    );
  }
}
