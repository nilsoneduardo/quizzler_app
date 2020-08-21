import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:lotopalpite_app/JogosRegistrados.dart';

class TelaLotofacil extends StatefulWidget {
  @override
  _TelaLotofacilState createState() => _TelaLotofacilState();
}

class _TelaLotofacilState extends State<TelaLotofacil> {

  var _listaNumeros = [
    "01", "02", "03", "04", "05",
    "06", "07", "08", "09", "10",
    "11", "12", "13", "14", "15",
    "16", "17", "18", "19", "20",
    "21", "22", "23", "24", "25",
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
     // print(_numeroRam);

      if (jogosConsolidado.contains(_numeroRam)) {
        jogos.remove(_numeroRam);
        _alerta = "Número já sorteado! Gere outro!";
      } else {
        jogos.add(_numeroRam);
        jogosConsolidado.add(_numeroRam);
        _alerta = "Continue sorteando!";
      }
      if (jogosConsolidado.length >= 15) {
        _alerta = "Jogo com 15 números completo!";

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
                      Navigator.pop(context);
                      _gerarNumero();
                      Navigator.pop(context);
                      _alerta = "Já foram escolhidos ${jogosConsolidado.length} números";
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
   //   print(jogosConsolidado.length);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Palpite LotoFácil"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/lotologo.png",height: 100,),
              Text("Clique no botão para gerar um número!"),
              Text("Número da Sorte:",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),

              Text("$_numeroRam",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: Colors.purple,
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
                color: Colors.purple,
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
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold
                  )),
              Text("Seu jogo da sorte tem ${jogosConsolidado.length} números"),
              Text("$jogosConsolidado",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold
                  )),
            ],

          ),
        ),
      ),
    );
  }
}