import 'package:flutter/material.dart';
import 'package:look_now/screens/theme/theme.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';

var todosOsClientes =[
  {
    'nome': 'Murillo',
    'dia': '02/06/2025 - Seg',
    'valor': 'R\$30,00',
    'horario': '13:00Hrs'
  },
  {
    'nome': 'Neto',
    'dia': '02/06/2025 - Seg',
    'valor': 'R\$30,00',
    'horario': '14:00Hrs'
  },
  {
    'nome': 'Neto',
    'dia': '02/06/2025 - Seg',
    'valor': 'R\$30,00',
    'horario': '14:00Hrs'
  },
  {
    'nome': 'Neto',
    'dia': '02/06/2025 - Seg',
    'valor': 'R\$30,00',
    'horario': '14:00Hrs'
  },
  {
    'nome': 'Neto',
    'dia': '02/06/2025 - Seg',
    'valor': 'R\$30,00',
    'horario': '14:00Hrs'
  },
  

];

class Servico extends StatelessWidget{
  final Map cliente;
  const Servico(
    {
      super.key,
      required this.cliente
    }
  );

  @override Widget build(BuildContext context){
    return InkWell(
      splashFactory: InkSplash.splashFactory,
      splashColor: const Color.fromARGB(113, 255, 255, 255),
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Container(
          decoration: BoxDecoration(
            color: temaAplicativo.screens.screenTelaPrincipal.tabHoje.boxDecoration.color,
            border: Border(bottom: BorderSide(color: temaAplicativo.screens.screenTelaPrincipal.tabHoje.boxDecoration.border.color, width: 0.5))
          ),
          width: double.infinity,
          height: 50,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Icon(Icons.schedule, size: 30)
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 38),
                  width: 200,
                  child: Text(cliente['dia'], style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600))
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 38, bottom: 5),
                  child: Text(cliente['valor'], style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(cliente['nome']),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.only(right: 5),
                  child: Text(cliente['horario'])
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}



class TabSemana extends StatefulWidget{
  const TabSemana({super.key});
  @override State<TabSemana> createState() => _TabSemana();
}

class _TabSemana extends State<TabSemana>{
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _dia = TextEditingController();
  final TextEditingController _horario = TextEditingController();
  final TextEditingController _preco = TextEditingController();
  int botaoSelecionado = 0;
  double? tamanhoTela;

  @override void initState() {
    super.initState();
    atualizarDiasDaSemana();
    atualizarClientes();
  }


  void atualizarDiasDaSemana(){
    itensRow.clear();

    int index = 0;
    int _diaSemana = DateTime.now().weekday;
    Map diasSemana = {
      8: 'Todos',
      1: 'Seg',
      2: 'Ter',
      3: 'Qua',
      4: 'Qui',
      5: 'Sex',
      6: 'Sab',
      7: 'Dom'
    };


    // itensRow.add(
    //   ElevatedButton(
    //     child: Text('Todos'),
    //     onPressed: () => (),
    //     style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
    //   )
    // );

    for (var diaDaSemana in diasSemana.keys){
      if (diaDaSemana > _diaSemana){
        final _index =  index;
        itensRow.add(
          ElevatedButton(
            child: Text(diasSemana[diaDaSemana], style: TextStyle(color: botaoSelecionado == _index? const Color.fromARGB(255, 212, 212, 212) : Colors.grey)),
            onPressed: () {
              setState((){
                botaoSelecionado = _index;
                atualizarDiasDaSemana();
                atualizarClientes();
              });
              
            },
            style: ElevatedButton.styleFrom(padding: EdgeInsets.zero, backgroundColor: botaoSelecionado == _index? const Color(0xA7427723): Colors.transparent, side: BorderSide(color: const Color.fromARGB(255, 199, 235, 205), width: 0.4)),
          )
        );
      index++;
      }
    }

    
    for (var diaDaSemana in diasSemana.keys){
      if (diaDaSemana <= _diaSemana){
        final _index = index;
        itensRow.add(
          ElevatedButton(
            child: Text(diasSemana[diaDaSemana], style: TextStyle(color: botaoSelecionado == _index? const Color.fromARGB(255, 212, 212, 212) : Colors.grey)),
            onPressed: () {
              setState((){
                botaoSelecionado = _index;
                atualizarDiasDaSemana();
                atualizarClientes();
              });
            },
            style: ElevatedButton.styleFrom(padding: EdgeInsets.zero, backgroundColor: botaoSelecionado == _index? const Color(0xA7427723): Colors.transparent, side: BorderSide(color: const Color.fromARGB(255, 199, 235, 205), width: 0.4)),
          )
        );
      index++;
      }
    }
  }

  void atualizarClientes(){
    setState(() {});
  }

  //List<Widget> layout = [];
  List<Widget> itensRow = [];

  @override Widget build(BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async{
            await Future.delayed(Duration(seconds: 1));
            atualizarDiasDaSemana();
            atualizarClientes();
          },
          child: Column(
            children: [
              SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 20,
                  children: itensRow,
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                child: ListView.builder(
                  itemCount: todosOsClientes.length+1,
                  itemBuilder: (context, index){
                    if (index == 0){
                      return SizedBox(height: 5);
                    }
                    return Servico(cliente: todosOsClientes[index-1]);
                  }
                )
              )
            ],
          ),
        ),
        // Column(
        //   children: [
        //     TextField(
        //       controller: _nome,
        //       decoration: InputDecoration(
        //         hintText: 'Nome',
        //       ),
        //     ),
        //     TextField(
        //       controller: _dia,
        //       decoration: InputDecoration(
        //         hintText: 'Dia',
        //       ),
        //     ),
        //     TextField(
        //       controller: _horario,
        //       decoration: InputDecoration(
        //         hintText: 'Horário',
        //       ),
        //     ),
        //     TextField(
        //       controller: _preco,
        //       decoration: InputDecoration(
        //         hintText: 'Valor',
        //       ),
        //     ),
        //     ElevatedButton(
        //       onPressed: (){
        //         setState(() {
        //           todosOsClientes.add({
        //             'nome': _nome.text,
        //             'dia': _dia.text,
        //             'valor': _preco.text,
        //             'horario': _horario.text
        //           });
        //           atualizarClientes();
        //         });
        //       },
        //       child: Text('Adicionar')
        //     )
        //   ]
        // )
      ],
    );
  }
}