import 'package:flutter/material.dart';

class MyThemeDark {
  var screens = (


    screenTelaPrincipal: (
      
      gradient: (
        color1: Color.fromARGB(255, 61, 61, 61),
        color2: Color.fromARGB(255, 46, 46, 46)
      ),

      buttonsTabBar: (
        splashColor:               Color.fromARGB(24, 224, 224, 224),
        backgroundColor:           Color.fromARGB(115, 104, 58, 183), 
        unselectedBackgroundColor: Color.fromARGB(59, 224, 224, 224),
        labelStyle:                Color.fromARGB(255, 0, 140, 255),
        unselectedLabelStyle:      Colors.black
      ),
      bottomNavigationBar: (
        backgroundColor: Color.fromARGB(55, 0, 183, 255),
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.black,

      ),

      tabHoje: (
        boxDecoration: (
          color: Color.fromARGB(123, 0, 255, 234),
          border: (
            color: Color.fromARGB(255, 0, 0, 0)
          )
        ),
        inkWell: (
          splashColor: const Color.fromARGB(113, 255, 255, 255),
        )
      ),
    )
  );
}


class MyThemeLight extends MyThemeDark {
  var screens = (


    screenTelaPrincipal: (

      gradient: (
        color1: Color.fromARGB(255, 61, 61, 61),
        color2: Colors.white
      ),

      buttonsTabBar: (
        splashColor:               Color.fromARGB(24, 224, 224, 224),
        backgroundColor:           Color.fromARGB(115, 104, 58, 183), 
        unselectedBackgroundColor: Color.fromARGB(59, 224, 224, 224),
        labelStyle:                Color.fromARGB(255, 0, 140, 255),
        unselectedLabelStyle:      Colors.black
      ),
      bottomNavigationBar: (
        backgroundColor: Color.fromARGB(55, 0, 183, 255),
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.black,
        
      ),
      tabHoje: (
        boxDecoration: (
          color: Color.fromARGB(123, 0, 255, 234),
          border: (
            color: Color.fromARGB(255, 0, 0, 0)
          )
        ),
        inkWell: (
          splashColor: const Color.fromARGB(113, 255, 255, 255),
        )
      )
      
    )
  );
}

String tema = 'Dark';

var temaAplicativo = tema == 'Dark' ? MyThemeDark() : MyThemeLight();
