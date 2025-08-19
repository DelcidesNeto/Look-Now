import 'package:flutter/material.dart';
import '../../main.dart';

class ScreenTelaLogin extends StatefulWidget {
  const ScreenTelaLogin({super.key});

  @override
  State<StatefulWidget> createState() => _ScreenTelaLogin();
}



class _ScreenTelaLogin extends State<ScreenTelaLogin> {
  bool _escondersenha = true;
  Focus focusInput({required String label, required Color colorUnfocus, required Color colorFocus, String? hint=''}){
    return Focus(
      child: Builder(
        builder: (context){
          final hasFocus = Focus.of(context).hasFocus;
          return TextField(
            obscureText: label == 'Senha' ? _escondersenha : false,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              labelText: label,
              fillColor: hasFocus ? colorFocus : colorUnfocus,

              suffixIcon: label == 'Senha' ? IconButton(
                icon: Icon(Icons.visibility),
                onPressed: () => setState(() {_escondersenha = !_escondersenha;})
              ) : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
          );
        }
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 96, 96, 104),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(75, 255, 255, 255),
          ),
          width: 300,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize:  MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Bem-Vindo', style: TextStyle(fontSize: 20)),
              SizedBox(height: 15),
              focusInput(label: 'Usuario', colorUnfocus: Colors.transparent, colorFocus: const Color(0x57FFFFFF), hint: 'email@gmail.com'),
              SizedBox(height: 30),
              focusInput(label: 'Senha', colorUnfocus: Colors.transparent, colorFocus: Color(0x57FFFFFF), hint: '********'),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black
                ),
                child: Text('Login'),
                onPressed: () => appKey.currentState?.chamarTela('/ScreenPrincipal'),
              ),
              SizedBox(height: 30),
            ],
          ), 
        ),
        // child: Column(
        //   children: [
        //     Text('Tela Login'),
        //     ElevatedButton(
        //       child: Icon(Icons.navigate_next),
        //       onPressed: () => appKey.currentState?.chamarTela('/ScreenPrincipal'),
        //     ),
        //     TextField(
        //       decoration: InputDecoration(
        //         labelText: 'Login'
        //       ),
        //     )
        //   ],
        // )
      )
    );
  }
}
