import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:look_now/screens/utils.dart';

class Agendamento extends StatelessWidget{
  Agendamento(
    {super.key,
    required this.horario,
    required this.nome,
    required this.servico}
  );
  String horario; 
  String nome;
  String servico;
  @override Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5, left: 5, top: 5),
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: const Color.fromARGB(255, 189, 189, 189),
          splashFactory: InkRipple.splashFactory,
          onTap: () => print('Clicou'),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
            ),
            height: 65,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.only(top: 12),
                    child: Text(horario, style: TextStyle(fontFamily: 'MontSerratSemiBold')),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 12, left: 55),
                    child: Text(nome, style: TextStyle(fontFamily: 'MontSerratSemiBold'))
                  )
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 55, top: 10),
                    
                    child: Text(servico, style: TextStyle(fontFamily: 'MontSerratRegular'))
                  ),
                )
              ]
            )
          ),
        ),
      ),
    );
  }
}


class BottomAgenda extends StatefulWidget {
  const BottomAgenda({super.key});
  @override
  createState() => _BottomAgenda();
}

class _BottomAgenda extends State<BottomAgenda> {
  OverlayEntry _buildOverlayEntry(){
    return OverlayEntry(
      builder: (context) => Container(
        padding: EdgeInsets.only(right: 100),
        margin: EdgeInsets.only(top: 50),
        alignment: Alignment.topRight,
        child: Material(
          elevation: 4,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            width: MediaQuery.of(context).size.width-115,
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: () {}, child: Text('Opção 1')),
                TextButton(onPressed: () {}, child: Text('Opção 2')),
                TextButton(onPressed: () {}, child: Text('Opção 3')),
              ],
            ),
          ),
        ),
      ),
    );
  }
  String abaAtual = 'Todos';
  bool mostrarOpcoes = false;
  late OverlayEntry overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '#fefaf8'.toColor(),
      body: Column(
        children: [
          // Container(
          //   alignment: Alignment.topRight,
          //   child: TextButton.icon(
          //     icon: Icon(Icons.sort),
          //     label: Text(abaAtual, style: TextStyle(color: Colors.black),),
          //     style: ButtonStyle(iconColor: WidgetStateProperty.all(Colors.black)),
          //     onPressed: () {
          //       if (remover){
          //         overlayEntry.remove();
          //         remover = false;
          //       }
          //       else if (!remover){
          //         overlayEntry = _buildOverlayEntry();
          //         Overlay.of(context).insert(overlayEntry);
          //         remover = true;
          //       }
                
          //     },
          //   ),
          // ),
          Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SingleChildScrollView(
                  scrollDirection: MediaQuery.of(context).size.width < 280 ? Axis.horizontal : Axis.vertical,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: '#feecec'.toColor(),
                          //border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            abaAtual == 'Todos' ? SizedBox.shrink() : AnimatedContainer(
                              padding: EdgeInsets.zero,
                              width: mostrarOpcoes ? 65 : 0,
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                              child: SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  child: Text('Todos', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontFamily: 'MontSerratRegular')),
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      abaAtual = 'Todos';
                                      mostrarOpcoes = false;
                                    });
                                  },
                                ),
                              ),
                            ),
                            abaAtual == 'Semanal' ? SizedBox.shrink() : AnimatedContainer(
                              padding: EdgeInsets.zero,
                              width: mostrarOpcoes ? 65 : 0,
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                              child: SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  child: Text('Semanal', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontFamily: 'MontSerratRegular')),
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      abaAtual = 'Semanal';
                                      mostrarOpcoes = false;
                                    });
                                  },
                                ),
                              ),
                            ),
                            abaAtual == 'Mensal' ? SizedBox.shrink() :  AnimatedContainer(
                              width: mostrarOpcoes ? 65 : 0,
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                              child: SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  child: Text('Mensal', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontFamily: 'MontSerratRegular')),
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      abaAtual = 'Mensal';
                                      mostrarOpcoes = false;
                                    });
                                  },
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              width: mostrarOpcoes ? 65 : 0,
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                              child: SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  child: Text('Período', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontFamily: 'MontSerratRegular')),
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      abaAtual = 'Período';
                                      mostrarOpcoes = false;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          icon: Icon(Icons.sort),
                          label: Text(abaAtual, style: TextStyle(color: Colors.black, fontFamily: 'MontSerratSemiBold'),),
                          style: ButtonStyle(
                            iconColor: WidgetStateProperty.all(Colors.black),
                            padding: WidgetStateProperty.all(EdgeInsets.all(5)),
                          ),
                          onPressed: () {
                            setState(() => mostrarOpcoes = !mostrarOpcoes);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Agendamento(horario: '08:00', nome: 'Julia', servico: 'Maquiagem'),
                Agendamento(horario: '08:00', nome: 'Julia', servico: 'Maquiagem'),
                Agendamento(horario: '08:00', nome: 'Julia', servico: 'Maquiagem'),
                Agendamento(horario: '08:00', nome: 'Julia', servico: 'Maquiagem'),
                Agendamento(horario: '08:00', nome: 'Julia', servico: 'Maquiagem'),
                Agendamento(horario: '08:00', nome: 'Julia', servico: 'Maquiagem'),
                Agendamento(horario: '08:00', nome: 'Julia', servico: 'Maquiagem'),
                Agendamento(horario: '08:00', nome: 'Julia', servico: 'Maquiagem'),
                Agendamento(horario: '08:00', nome: 'Julia', servico: 'Maquiagem')
              ]
            ),
          )
        ],
      ),
    );
  }
}
