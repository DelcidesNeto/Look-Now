import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(App());
}

final GlobalKey<_App> appKey = GlobalKey<_App>();

class App extends StatefulWidget {
  App({Key? key}) : super(key: appKey);
  @override
  State<App> createState() => _App();
}


class _App extends State<App> {
  @override void initState() {
    super.initState();
    List keys = ['master'];

    String email = 'admin';
    String senha = '123';
    String keyActivation = 'master';
    if (email == 'admin' && senha == '123' && keys.contains(keyActivation)){
      chamarTela('/ScreenMain');
    } else {
      chamarTela('/ScreenTelaLogin');
    }
  }

  int screenAtual = 0;

  void chamarTela(String rota){
    Map rotas = {
      '/ScreenTelaLogin'    : 0,
      '/ScreenPrincipal'    : 1,
      '/ScreenMain'         : 2
    };

    setState(() => screenAtual = rotas[rota]);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Taja do debug
      home: IndexedStack(
          index: screenAtual,
          children: [
            screenTelaLogin,
            screentTelaPrincipal,
            screenMain
          ],
        )
    );
  }
}
