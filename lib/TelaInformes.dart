import 'package:flutter/material.dart';

class TelaInformes extends StatefulWidget {
  @override
  _TelaInformesState createState() => _TelaInformesState();
}

class _TelaInformesState extends State<TelaInformes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Contribua"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Esse aplicativo GRATUITO foi criado com a única intenção de "
                  " facilitar na escolha de números aleatórios, baseado"
                  " numa função matemática específica para cada tipo "
                  " de jogo.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
              ),
          Text("Você pode contribuir para que esse App possa melhorar"
                  " mais. Se deseja permitir que outras funcionalidades"
                  " possam ser adicionadas, como checagem de acertos, "
                  " resultados de jogos em tempo real etc,",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
           Text("FAÇA SUA DOAÇÃO ESPONTÂNEA!" ,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
          ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text("CEF, AG. 0002, C/C 10113-2",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Text("Nilson Eduardo Ferreira",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Text("CPF: 539.569.071-91",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))
            ]
          ),
        )
      ),
    );
  }
}
