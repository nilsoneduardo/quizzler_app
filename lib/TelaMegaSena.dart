import 'package:flutter/material.dart';
import 'dart:math';

class TelaMegaSena extends StatefulWidget {
  @override
  _TelaMegaSena createState() => _TelaMegaSena();
}

class _TelaMegaSena extends State<TelaMegaSena> {

  var _listaNumeros = [
    "01", "02", "03", "04", "05",
    "06", "07", "08", "09", "10",
    "11", "12", "13", "14", "15",
    "16", "17", "18", "19", "20",
    "21", "22", "23", "24", "25",
    "26", "27", "28", "29", "30",
    "31", "32", "33", "34", "35",
    "36", "37", "38", "39", "40",
    "41", "42", "43", "44", "45",
    "46", "47", "48", "49", "50",
    "51", "52", "53", "54", "55",
    "56", "57", "58", "59", "60",
  ];

  var _numeroRam = "";
  var _alerta = "";

  List<String> jogos = [];
  List<String> jogosConsolidado = [];

  void _limparJogo() {
    setState(() {
      jogosConsolidado.clear();
      _alerta = "Seu jogo está vazio";
    });
  }

  void _gerarNumero() {
    var numeroSorteado = Random().nextInt(_listaNumeros.length);

    setState(() {
      _numeroRam = _listaNumeros[numeroSorteado];

      if (jogosConsolidado.contains(_numeroRam)) {
        jogos.remove(_numeroRam);
        _alerta = "Número já sorteado! Gere outro!";
      } else {
        jogos.add(_numeroRam);
        jogosConsolidado.add(_numeroRam);
        _alerta = "Continue sorteando!";
      }
      if (jogosConsolidado.length == 6 || jogosConsolidado.length == 15){
        _alerta = "Jogo completo!";
        showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text("Jogo padrão de ${jogosConsolidado.length} números completo!"),
                titlePadding: EdgeInsets.all(20),
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                ),
                content: Text("Seu jogo já atingiu ${jogosConsolidado.length} dezenas! Você pode continuar escolhendo até o limite de 15."),
                backgroundColor: Colors.white,
                actions: [
                  FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                        _alerta = "O jogo agora tem ${jogosConsolidado.length} numeros";
                      },
                      child: Text("Sim")
                  ),
                ],
              );
            }
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Palpite Mega-Sena"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/megasenalogo.png",height: 100,),
              Text("Clique no botão para gerar um número!"),
              Text("Número da Sorte:",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),

              Text("$_numeroRam",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               RaisedButton(
                 color: Colors.green,
                 child: Text(
                   "Gerar Número",
                   style: TextStyle(
                       fontSize: 20,
                       color: Colors.white,
                       fontWeight: FontWeight.bold
                   ),
                 ),
                 onPressed: _gerarNumero,
               ),
               RaisedButton(
                 color: Colors.green,
                 child: Text(
                   "Limpar Jogo",
                   style: TextStyle(
                       fontSize: 20,
                       color: Colors.white,
                       fontWeight: FontWeight.bold
                   ),
                 ),
                 onPressed: _limparJogo,
               ),
             ],
           ),
              Text(_alerta,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold
                  )),
              Text("Seu jogo da sorte tem ${jogosConsolidado.length} números"),
              Text("${jogosConsolidado}",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                      fontWeight: FontWeight.bold
                  )),
            ],

          ),
        ),
      ),
    );
  }
}