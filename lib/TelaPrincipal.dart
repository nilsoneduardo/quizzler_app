import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotopalpite_app/TelaLotoMania.dart';
import 'package:lotopalpite_app/TelaLotofacil.dart';
import 'package:lotopalpite_app/TelaMegaSena.dart';
import 'package:lotopalpite_app/TelaQuina.dart';

import 'TelaInformes.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  void _abrirInforme(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> TelaInformes() ));
  }

  void _abrirLotofacil(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> TelaLotofacil() ));
  }

  void _abrirQuina(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> TelaQuina() ));
  }

  void _abrirMega(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> TelaMegaSena() ));
  }

  void _abrirLotomania(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> TelaLotoMania() ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Palpite de Loterias"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: (
                ) {
             _abrirInforme();
            },
          )
        ],

      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/loterias.png",width: 120, height: 120),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _abrirLotofacil,
                    child: Image.asset("images/lotologo.png",width: 120,height: 120),
                  ),
                  GestureDetector(
                    onTap: _abrirLotomania,
                    child: Image.asset("images/lotomania.png", width: 120, height: 120),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _abrirMega,
                    child: Image.asset("images/megasenalogo.png",width: 120,height: 120),
                  ),
                  GestureDetector(
                    onTap: _abrirQuina,
                    child: Image.asset("images/quinalogo.png",width: 120,height: 120),
                  )
                ],
              ),
            ),
            Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: (_abrirInforme),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child:
                      const Text('Contribua com o App', style: TextStyle(fontSize: 25)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}
