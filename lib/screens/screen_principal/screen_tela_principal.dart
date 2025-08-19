// import 'package:flutter/material.dart';
// import 'package:buttons_tabbar/buttons_tabbar.dart';

// class ScreenTelaPrincipal extends StatefulWidget {
//   const ScreenTelaPrincipal({super.key});

//   @override
//   createState() => _ScreenTelaPrincipal();
// }

// class _ScreenTelaPrincipal extends State<ScreenTelaPrincipal> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Stack(
//         children: [
//           Scaffold(
//             appBar: AppBar(
//                 backgroundColor:  Color.fromARGB(100, 255, 0, 234),
//                 leading: IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.menu),
//                 ),
//                 actions: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.more_vert),
//                   )
//                 ],
//                 title: SizedBox.shrink(), // Sem título
//                 centerTitle: true,
//                 bottom: PreferredSize(
//                   preferredSize: Size.fromHeight(50),
//                   child: Container(
//                     transform: Matrix4.translationValues(0.0, -10.0, 0.0),
//                     color: Colors.transparent,
//                     padding: EdgeInsets.symmetric(vertical: 8),
//                     child: ButtonsTabBar(
//                       radius: 50,
//                       backgroundColor: Colors.deepPurple,
//                       unselectedBackgroundColor: Colors.grey[300],
//                       contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                       labelStyle: TextStyle(color: Colors.white),
//                       unselectedLabelStyle: TextStyle(color: Colors.black),
//                       tabs: [
//                         Tab(icon: Icon(Icons.home), text: 'Início'),
//                         Tab(icon: Icon(Icons.settings), text: 'Configurações'),
//                         Tab(icon: Icon(Icons.person), text: 'Perfil'),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             body: TabBarView(
//               children: [
//                 Center(child: Text('opa')),
//                 Center(child: Text('opa2')),
//                 Center(child: Text('opa3')),
//               ],
//             ),
//           ),
//         ],
//       )
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:look_now/screens/theme/theme.dart';
import 'tabs/tab_hoje/tab_hoje.dart';
import 'tabs/tab_semana/tab_semana.dart';
import 'tabs/tab_todos/tab_todos.dart' as lib;





class ScreenTelaPrincipal extends StatefulWidget {
  const ScreenTelaPrincipal({super.key});
  @override
  createState() => _ScreenTelaPrincipal();
}

class _ScreenTelaPrincipal extends State<ScreenTelaPrincipal> with WidgetsBindingObserver {
  double? tamanhoTela;
  int _indiceAtual = 0;
  PageController _pageController = PageController();

  final List<Widget> _screenBotomNavigation = [
    TabHoje(),
    TabSemana(),
    lib.TabTodos()
  ];

  @override void initState() {
    super.initState();
    //print(WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() => tamanhoTela = MediaQuery.of(context).size.width/3),
    );
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pageController.dispose();
    super.dispose();
  }


  @override void didChangeMetrics() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final _tamanhoTela = MediaQuery.of(context).size.width/3;
      setState (() => tamanhoTela = _tamanhoTela);
    });
    // if (_tamanhoTela < 434.0){
    //   setState(() {
    //     tamanhoTela = null;
    //   });
    // } else{
    //   setState(() {
    //     tamanhoTela = _tamanhoTela;
    //   });
    // }
    super.didChangeMetrics();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              temaAplicativo.screens.screenTelaPrincipal.gradient.color1,
              temaAplicativo.screens.screenTelaPrincipal.gradient.color2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            //backgroundColor:  Color.fromARGB(174, 0, 0, 0),
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            actions: [IconButton(onPressed: () {
              lib.todosOsClientes.add({
                  'nome': 'abu',
                  'dia': '02/06/2025 - Seg',
                  'valor': 'R\$30,00',
                  'horario': '13:00Hrs'
                });
            }, icon: Icon(Icons.more_vert))],
            title: Text('Agendamentos', style: TextStyle(fontWeight: FontWeight.bold),),//SizedBox.shrink(), // remove o espaço do título
            centerTitle: true,
            // bottom: ButtonsTabBar(
            //   radius: 50,
            //   contentPadding: EdgeInsets.symmetric(horizontal: 12),
            //   backgroundColor: Colors.deepPurple,
            //   unselectedBackgroundColor: Colors.grey[300],
            //   labelStyle: TextStyle(color: Colors.white),
            //   unselectedLabelStyle: TextStyle(color: Colors.black),
            //   width: MediaQuery.of(context).size.width/3,
            //   tabs: [
            //     Tab(icon: Icon(Icons.home), text: 'Início'),
            //     Tab(icon: Icon(Icons.settings), text: 'Configurações'),
            //     Tab(icon: Icon(Icons.person), text: 'Perfil'),
            //   ],
            // ),
          ),
          //body: _screenBotomNavigation[_indiceAtual]
          body: PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() => _indiceAtual = value);
            },
            children: _screenBotomNavigation,
          ),
          //Column(
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     //ButtonsTabBar //logo abaixo do AppBar
              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   width: double.infinity,
              //   alignment: Alignment.center,
              //   //color: Color(0x9D000000),
              //   child: ButtonsTabBar(
              //     splashColor: temaAplicativo.screens.screenTelaPrincipal.buttonsTabBar.splashColor,
              //     radius: 50,
              //     contentPadding: EdgeInsets.symmetric(horizontal: 12),
              //     backgroundColor: temaAplicativo.screens.screenTelaPrincipal.buttonsTabBar.backgroundColor,
              //     unselectedBackgroundColor: temaAplicativo.screens.screenTelaPrincipal.buttonsTabBar.unselectedBackgroundColor,
              //     labelStyle: TextStyle(color: temaAplicativo.screens.screenTelaPrincipal.buttonsTabBar.labelStyle),
              //     unselectedLabelStyle: TextStyle(color: temaAplicativo.screens.screenTelaPrincipal.buttonsTabBar.unselectedLabelStyle),
              //     width: tamanhoTela,
              //     contentCenter: true,
              //     tabs: [
              //       Tab(icon: Tooltip(message: 'Hoje',    waitDuration: Duration(milliseconds: 500), child: Icon(MaterialSymbols.today_filled))),
              //       Tab(icon: Tooltip(message: 'Semana',  waitDuration: Duration(milliseconds: 500), child: Icon(MaterialSymbols.calendar_today_filled))),
              //       Tab(icon: Tooltip(message: 'Todos',   waitDuration: Duration(milliseconds: 500), child: Icon(Icons.fact_check))),
              //       //Tab(icon: Expanded(child: Tooltip(message: 'Perfil', child: Icon(Icons.person))))
              //     ],
              //   ),
              // ),
          //     // Conteúdo das abas
          //     Expanded(
          //       child: TabBarView(
          //         children: [
          //           TabHoje(),
          //           TabSemana(),
          //           TabTodos()
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: temaAplicativo.screens.screenTelaPrincipal.bottomNavigationBar.backgroundColor,
            selectedItemColor: temaAplicativo.screens.screenTelaPrincipal.bottomNavigationBar.selectedItemColor,
            unselectedItemColor: temaAplicativo.screens.screenTelaPrincipal.bottomNavigationBar.unselectedItemColor,
            showUnselectedLabels: false,
            currentIndex: _indiceAtual,
            onTap: (index) {
              setState(() {
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut
                );
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(MaterialSymbols.today_filled),
                label: 'Hoje',
              ),
              BottomNavigationBarItem(
                icon: Icon(MaterialSymbols.calendar_today_filled),
                label: 'Semana',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fact_check),
                label: 'Todos',
              ),
            ],
          ),
        ),
      )
    );
  }
}
