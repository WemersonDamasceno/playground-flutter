import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';
import 'core/pages/splash_page.dart';

class AppModule extends Module {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
    Bind((i) => Connectivity()),
  ];

  @override
  // TODO: implement routers
  List<ModularRoute> get routes => [
    ChildRoute("/", child: (_,__) => SplashPage()),
    ChildRoute("/logged", child: (_,__) => Container(color: Colors.red,)),
  ];

}