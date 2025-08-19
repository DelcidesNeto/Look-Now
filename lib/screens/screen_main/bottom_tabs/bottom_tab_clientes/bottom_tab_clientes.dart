import 'package:flutter/material.dart';
import 'package:look_now/screens/utils.dart';

class BottomTabClientes extends StatefulWidget {
  const BottomTabClientes({super.key});
  @override
  createState() => _BottomTabClientes();
}
class _BottomTabClientes extends State<BottomTabClientes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              labelText: 'Buscar',
              prefixIcon: Icon(Icons.search),
              fillColor: Color(0xFFF7F2EF),
              hoverColor: Color.fromARGB(255, 236, 232, 229),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              InkWell(
                onTap: () => print('clicou'),
                child: Container(
                  padding: EdgeInsets.only(top: 7),
                  height: 55,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 185, 152, 190),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(child: Text('A', style: TextStyle(fontFamily: 'MontSerratSemiBold', fontSize: 20))),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(left: 60),
                        child: Center(child: Text('Ana', style: TextStyle(fontFamily: 'MontSerratSemiBold'),)),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(left: 65),
                          child: Divider(height: 1,)
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ]
    );
  }
}