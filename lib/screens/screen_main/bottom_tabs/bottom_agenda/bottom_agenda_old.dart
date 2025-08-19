import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class BottomAgenda extends StatefulWidget {
  const BottomAgenda({super.key});
  @override
  createState() => _BottomAgenda();
}

class _BottomAgenda extends State<BottomAgenda> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            ButtonsTabBar(
              backgroundColor: Colors.blue,
              unselectedBackgroundColor: Colors.grey[300],
              unselectedLabelStyle: TextStyle(color: Colors.black),
              labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              width: MediaQuery.of(context).size.width/2,
              contentCenter: true,
              tabs: [
                Tab(text: 'Semana'),
                Tab(text: 'Meses'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Conteúdo Semana')),
                  Center(child: Text('Conteúdo Todos')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
