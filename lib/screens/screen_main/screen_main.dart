import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:look_now/screens/utils.dart';
import 'bottom_tabs/bottom_agenda/bottom_agenda.dart';
import 'bottom_tabs/bottom_tab_home/bottom_tab_home.dart';
import 'bottom_tabs/bottom_tab_clientes/bottom_tab_clientes.dart';
import 'bottom_tabs/bottom_tab_financeiro/bottom_tab_financeiro.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});
  @override @override
  State<StatefulWidget> createState() => _ScreenMain();
}

class _ScreenMain extends State<ScreenMain>{
  int paginaAtual = 0;
  String tituloAppBar = 'Home';
  PageController _pageController = PageController();

  @override Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(tituloAppBar, style: TextStyle(fontWeight: FontWeight.bold, color: '#423f3d'.toColor())),
          actions: [
            Container(
              padding: EdgeInsetsGeometry.only(right: 15),
              child: IconButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                  backgroundColor: WidgetStateProperty.all('#fad8d9'.toColor())
                ),
                icon: Icon(Icons.add),
                onPressed:() {},
              ),
            )
          ],
        ),
        body: PageView(
          controller: _pageController,
          //physics: NeverScrollableScrollPhysics(), //Desabilita o scroll
          onPageChanged: (value) {
            setState (() {
              paginaAtual = value;
              switch (value) {
                case 0:
                  tituloAppBar = 'Home';
                  break;
                case 1:
                  tituloAppBar = 'Agenda';
                  break;
                case 2:
                  tituloAppBar = 'Clientes';
                  break;
                case 3:
                  tituloAppBar = 'Financeiro';
                  break;
                default:
                  tituloAppBar = 'Mais Opções';
                  break;
              };
            });
          },
          children: [
            BottomTabHome(),
            BottomAgenda(),
            BottomTabClientes(),
            BottomTabFinanceiro(),
            Text('opa5')
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedFontSize: 10,
          selectedFontSize: 10.5,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: '#37474F'.toColor(),
          showUnselectedLabels: true,
          selectedItemColor: '#F8BBD0'.toColor(),
          currentIndex: paginaAtual,
          onTap: (index) {
            setState(() {
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Agenda',
              activeIcon: Icon(Icons.calendar_month)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp),
              label: 'Clientes',
              activeIcon: Icon(Icons.person)
            ),
            BottomNavigationBarItem(
              icon: Icon(MaterialSymbols.payments_outlined),
              label: 'Financeiro',
              activeIcon: Icon(MaterialSymbols.payments_filled)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Mais',
              activeIcon: Icon(Icons.menu_open)
            )
          ],
        ),
      ),
    );
  }
}