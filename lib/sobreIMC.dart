import 'package:flutter/material.dart';

class TelaDois extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Entenda o IMC"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: const Color(0xFF296fd9),
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,

          child: Text("O  IMC indica  o peso  adequadopara  cada  pessoa,  fazendo  uma  relação  entre  a  massa  corpórea  e  altura.  No entanto,  não  mede  diretamente  a  gordura  corporal,  pois  não  contempla  a  estrutura  óssea, massa  magra,  massa  gorda  e  líquidos.  A  importância  de  estar  dentro  do  peso  ideal  está diretamente ligada ao estado de saúde."),
        ),
      ),
    );
  }
}