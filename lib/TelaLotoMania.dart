import 'package:flutter/material.dart';
import 'dart:math';

class TelaLotoMania extends StatefulWidget {
  @override
  _TelaLotoMania createState() => _TelaLotoMania();
}

class _TelaLotoMania extends State<TelaLotoMania> {

  bool _isButtonDisabled = false;


  var _listaNumeros = [
    "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
    "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
    "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
    "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",
    "41", "42", "43", "44", "45", "46", "47", "48", "49", "50",
    "51", "52", "53", "54", "55", "56", "57", "58", "59", "60",
    "61", "62", "63", "64", "65", "66", "67", "68", "69", "70",
    "71", "72", "73", "74", "75", "76", "77", "78", "79", "80",
    "81", "82", "83", "84", "85", "86", "87", "88", "89", "90",
    "91", "92", "93", "94", "95", "96", "97", "98", "99", "00",
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
      if (jogosConsolidado.length == 50){
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
                content: Text("Você deseja sortear mais números? Lembre que o valor do jogo acima do número de 15 dezenas aumenta!"),
                backgroundColor: Colors.white,
                actions: [
                  FlatButton(
                      onPressed: (){
                        _alerta = "O jogo agora tem ${jogosConsolidado.length} numeros";
                        Navigator.pop(context);
                      },
                      child: Text("Sim")
                  ),
                  FlatButton(
                      onPressed: (){
                        //                 print("Selecionado Não");
                        Navigator.pop(context);
                      },
                      child: Text("Não")
                  )
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
        title: Text("Palpite Lotomania"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/lotomania.png",height: 100,),
              Text("Clique no botão para gerar um número!"),
              Text("Número da Sorte:",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),

              Text("$_numeroRam",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               RaisedButton(
                 color: Colors.orange,
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
                 color: Colors.orange,
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
                      color: Colors.orange,
                      fontWeight: FontWeight.bold
                  )),
              Text("Seu jogo da sorte tem ${jogosConsolidado.length} números"),
              Text("${jogosConsolidado}",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold
                  )),
            ],
          ),
        ),
      ),
    );
  }
}