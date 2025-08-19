import 'package:flutter/material.dart';
import 'package:look_now/screens/theme/theme.dart';

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
    'nome': 'Murillo',
    'dia': '02/06/2025 - Seg',
    'valor': 'R\$30,00',
    'horario': '13:00Hrs'
  },
  {
    'nome': 'Murillo',
    'dia': '02/06/2025 - Seg',
    'valor': 'R\$30,00',
    'horario': '13:00Hrs'
  }
];

class Servico extends StatelessWidget{
  final Map cliente;
  final VoidCallback? atualizarClientes;
  const Servico(
    {
      super.key,
      required this.cliente,
      this.atualizarClientes
    }
  );

  @override Widget build(BuildContext context){
    return InkWell(
      splashFactory: InkSplash.splashFactory,
      splashColor: const Color.fromARGB(113, 255, 255, 255),
      onTap: (){atualizarClientes!();},
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



class TabTodos extends StatefulWidget{
  const TabTodos({super.key});
  @override State<TabTodos> createState() => _TabTodos();
}

class _TabTodos extends State<TabTodos>{
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _dia = TextEditingController();
  final TextEditingController _horario = TextEditingController();
  final TextEditingController _preco = TextEditingController();

  @override void initState() {
    super.initState();
  }

  Future<void> atualizarClientes() async{
    setState(() {});
  }

  @override Widget build(BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1));
            atualizarClientes();
          },
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: todosOsClientes.length+1,
            itemBuilder: (context, index){
              if (index == 0){
                return SizedBox(height: 5); // Isso funciona porque aumenta o index em 1, ou seja agora teria o tamanho "5", quando ele inicia em 0, ele chama o primeiro if, que adiciona o sizedbox, ou seja, no proximo loop o index é 1, assim ele ignora o if, a vai adicionar o widget da posição, porém o widget 1, é diferente do 0, por isso o -1, pq assim ele diminui um do tamanho total, fazendo tudo funcionar perfeitamente
              }
              return Servico(cliente: todosOsClientes[index-1], atualizarClientes: atualizarClientes);
            },
          ),
        ),
        // Column(
        //   children: [E
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