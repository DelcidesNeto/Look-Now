import 'package:flutter/material.dart';
import 'package:look_now/screens/utils.dart';

class BottomTabHome extends StatefulWidget {
  const BottomTabHome({super.key});
  @override
  createState() => _BottomTabHome();
}


class ItemAgenda extends StatelessWidget{
  const ItemAgenda({super.key});
  @override Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      height: 50,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 5, left: 5),
              child: Text('09:00', style: TextStyle(fontFamily: 'MontSerratSemiBold'))
            )
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 50),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, left: 5),
                    child: Text('Ana1', style: TextStyle(fontFamily: 'MontSerratSemiBold')),
                  )
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 18, left: 5),
                    child: Text('Carrete', style: TextStyle(fontFamily: 'MontSerratRegular')),
                  )
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    style: ButtonStyle(minimumSize: WidgetStateProperty.all(Size(1, 1))),
                    icon: Icon(Icons.navigate_next),
                    onPressed: () {},
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}


class ProximoAgendamento extends StatelessWidget{
  const ProximoAgendamento({super.key});
  @override Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 8,right: 8),
      child: Container(
        height: 50,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            splashColor: const Color.fromARGB(255, 223, 182, 195),
            splashFactory: InkRipple.splashFactory,
            onTap: () => print('Clicou'),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: '#ffd9d9'.toColor(),
                      borderRadius: BorderRadiusGeometry.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
                    ),
                    padding: EdgeInsets.only(left: 7, top: 5, right: 3),
                    height: 50,
                    child: Text('09:00', style: TextStyle(fontFamily: 'MontSerratRegular', fontWeight: FontWeight.w600)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 51),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: '#fef4f4'.toColor(),
                      borderRadius: BorderRadiusGeometry.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8))
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, top: 5),
                            child: Text('Ana', style: TextStyle(fontFamily: 'MontSerratRegular', fontWeight: FontWeight.w600)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, top: 20),
                            child: Text('Bàrcarato', style: TextStyle(fontFamily: 'MontSerratRegular', fontWeight: FontWeight.w300)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: EdgeInsets.only(top: 5, right: 15),
                            child: Text('Carrerto', style: TextStyle(fontFamily: 'MontSerratRegular', fontWeight: FontWeight.w400)),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _BottomTabHome extends State<BottomTabHome> {
  int diaSelecionado = 0;
  List diasDaSemana = [];

  
  @override
  void initState() {
    getTamanhoAgendamentos();
    getDiasDaSemana();
    super.initState();
  }
  double heightAgendamentos = 0.0;
  void getTamanhoAgendamentos(){
    int tamanho = 3;
    switch (tamanho){
      case 1:
        setState (() => heightAgendamentos = 93.0);
        break;
      case 2:
        setState (() => heightAgendamentos = 147.0);
        break;
      case 3:
        setState (() => heightAgendamentos = 200.0);
        break;
      default:
        setState (() => heightAgendamentos = 0.0);
        break;
    }
  }
  
  getDiasDaSemana() {
    diasDaSemana.clear();
    DateTime diaAtual = DateTime.now();
    int diaDaSemanaAtual = diaAtual.weekday; // 1 = Segunda, 7 = Domingo
    diaSelecionado = diaDaSemanaAtual-1;
    DateTime inicioDaSemana = diaAtual.subtract(Duration(days: diaDaSemanaAtual - 1));
    for (int i = 0; i < 7; i++){
      DateTime dia = inicioDaSemana.add(Duration(days: i));
      diasDaSemana.add(dia.day);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '#fefaf8'.toColor(),
      body: Container(
        padding: EdgeInsets.all(7),
        child: ListView(
          children: [
            Container( // Próximos agendamentos
              width: double.infinity,
              height: heightAgendamentos, // 3-200, 2-147, 1-93
              decoration: BoxDecoration(
                color: '#feecec'.toColor(), //'#ffeded'.toColor()
                borderRadius: BorderRadiusGeometry.all(Radius.circular(13))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Text(
                      'Próximos agendamentos',
                      style: TextStyle(fontFamily: 'MontSerratRegular', fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ProximoAgendamento(),
                        ProximoAgendamento(),
                        ProximoAgendamento()
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: '#f0e4f4'.toColor(),
                    ),
                    margin: EdgeInsets.only(top: 10),
                    height: 75,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Ganhos', style: TextStyle(fontFamily: 'MontSerratRegular', fontSize: 16, fontWeight: FontWeight.w600),)
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('R\$ 350,00', style: TextStyle(fontFamily: 'MontSerratSemiBold', fontSize: 20, fontWeight: FontWeight.normal),),
                        )
                      ],
                    ),
                    
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: '#ddf1ed'.toColor(),
                    ),
                    height: 75,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Alertas', style: TextStyle(fontFamily: 'MontSerratSemiBold')),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.only(top: 27),
                            child: Icon(Icons.notifications, size: 20)
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 25, top: MediaQuery.of(context).size.width < 400? 19: 0),
                            child: Text('Você tem um agendamento sem confirmação', style: TextStyle(fontFamily: 'MontSerratRegular', fontSize: 10, fontWeight: FontWeight.w500), textAlign: TextAlign.left,),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Text(
                      'Agenda',
                      style: TextStyle(fontFamily: 'MontSerratRegular', fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Tooltip(
                                  message: 'Segunda',
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Text('S',
                                      style: TextStyle(
                                        color: Colors.black, fontFamily: 'MontSerratRegular',
                                        fontSize: 13
                                      )
                                    )
                                  )
                                ),
                                SizedBox(height: 5),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: diaSelecionado == 0 ? '#f0e4f4'.toColor() : null,
                                    padding: EdgeInsets.zero, minimumSize: Size(35, 35),
                                    foregroundColor: Colors.black
                                  ),
                                  child: Text(diasDaSemana[0].toString()), onPressed: () => setState(() => diaSelecionado = 0)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Tooltip(
                                  message: 'Terça',
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Text('T',
                                      style: TextStyle(
                                        color: Colors.black, fontFamily: 'MontSerratRegular',
                                        fontSize: 13
                                      )
                                    ),
                                  )
                                ),
                                SizedBox(height: 5),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: diaSelecionado == 1 ? '#f0e4f4'.toColor() : null,
                                    padding: EdgeInsets.zero, minimumSize: Size(35, 35),
                                    foregroundColor: Colors.black
                                  ),
                                  child: Text(diasDaSemana[1].toString()), onPressed: () => setState(() => diaSelecionado = 1)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Tooltip(
                                  message: 'Quarta',
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Text('Q',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'MontSerratRegular',
                                        fontSize: 13
                                      )
                                    ),
                                  )
                                ),
                                SizedBox(height: 5),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: diaSelecionado == 2 ? '#f0e4f4'.toColor() : null,
                                    padding: EdgeInsets.zero, minimumSize: Size(35, 35),
                                    foregroundColor: Colors.black
                                  ),
                                  child: Text(diasDaSemana[2].toString()), onPressed: () => setState(() => diaSelecionado = 2)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Tooltip(
                                  message: 'Quinta',
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Text('Q',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'MontSerratRegular',
                                        fontSize: 13
                                      )
                                    ),
                                  )
                                ),
                                SizedBox(height: 5),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: diaSelecionado == 3 ? '#f0e4f4'.toColor() : null,
                                    padding: EdgeInsets.zero, minimumSize: Size(35, 35),
                                    foregroundColor: Colors.black
                                  ),
                                  child: Text(diasDaSemana[3].toString()), onPressed: () => setState(() => diaSelecionado = 3)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Tooltip(
                                  message: 'Sexta',
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Text('S',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'MontSerratRegular',
                                        fontSize: 13
                                      )
                                    ),
                                  )
                                ),
                                SizedBox(height: 5),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: diaSelecionado == 4 ? '#f0e4f4'.toColor() : null,
                                    padding: EdgeInsets.zero, minimumSize: Size(35, 35),
                                    foregroundColor: Colors.black
                                  ),
                                  child: Text(diasDaSemana[4].toString()), onPressed: () => setState(() => diaSelecionado = 4)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Tooltip(
                                  message: 'Sábado',
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Text('S',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'MontSerratRegular',
                                        fontSize: 13
                                      )
                                    ),
                                  )
                                ),
                                SizedBox(height: 5),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: diaSelecionado == 5 ? '#f0e4f4'.toColor() : null,
                                    padding: EdgeInsets.zero, minimumSize: Size(35, 35),
                                    foregroundColor: Colors.black
                                  ),
                                  child: Text(diasDaSemana[5].toString()), onPressed: () => setState(() => diaSelecionado = 5)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Tooltip(
                                  message: 'Domingo',
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Text('D',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'MontSerratRegular',
                                        fontSize: 13
                                      )
                                    ),
                                  )
                                ),
                                SizedBox(height: 5),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: diaSelecionado == 6 ? '#f0e4f4'.toColor() : null,
                                    padding: EdgeInsets.zero, minimumSize: Size(35, 35),
                                    foregroundColor: Colors.black
                                  ),
                                  child: Text(diasDaSemana[6].toString()), onPressed: () => setState(() => diaSelecionado = 6)
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.red,
                    height: MediaQuery.of(context).size.height >= 583? MediaQuery.of(context).size.height-528 : 62,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ItemAgenda(),
                        ItemAgenda(),
                        ItemAgenda(),
                        ItemAgenda()
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
