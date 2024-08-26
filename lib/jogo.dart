import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});
  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imageApp =  const AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch(escolhaApp){
      case "pedra" :
        setState(() {
           _imageApp =  const AssetImage("imagens/pedra.png");
         });
        break;
       case "papel" :
         setState(() {
           _imageApp =  const AssetImage("imagens/papel.png");
         });
         break;
       case "tesoura" :
         setState(() {
           _imageApp =  const AssetImage("imagens/tesoura.png");
         });
         break;
     }
    if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra")
     ){
      setState(() {
        _mensagem = "Parabens!!! Voce ganhou :)";
      });
    }else if(
      (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
      (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
      (escolhaApp == "papel" && escolhaUsuario == "pedra")
     ){
      setState(() {
        _mensagem = "Voce perdeu :(";
      });
    }else{
      setState(() {
        _mensagem = "Empatou :|";
      });
  }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text("Escolha da CPU",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: _imageApp,),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 100) ,
              ),GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("imagens/papel.png", height: 100) ,
              ),GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("imagens/tesoura.png",height: 100) ,
              )
              /*Image.asset("imagens/pedra.png", height: 100),
              Image.asset("imagens/papel.png", height: 100,),
              Image.asset("imagens/tesoura.png", height: 100,),*/
            ],
          )
        ],
      ),
    );
  }
}
