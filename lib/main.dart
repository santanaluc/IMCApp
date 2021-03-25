import 'package:flutter/material.dart';
import 'calc_imc.dart' as calc;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Página Inicial",
      theme: new ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.cyan,
          primaryColor: const Color(0xFF212121),
          accentColor: const Color(0xFF64ffda),
          canvasColor: const Color(0xFF303030),
          fontFamily: 'Roboto'),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Cálculo IMC'),
        centerTitle: true,
      ),
      body: Calculo(),
    );
  }
}

class Calculo extends StatefulWidget {
  @override
  _CalculoState createState() => _CalculoState();
}

class _CalculoState extends State<Calculo> {
  TextEditingController _controllerPeso = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();
  String msg = "Calcule o seu IMC";

  void calcM() {
    double _peso = double.tryParse(_controllerPeso.text);
    double _altura = double.tryParse(_controllerAltura.text);

    if (_peso == null || _altura == null) {
      setState(() {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Digite um valor para o cálculo")));
      });
    } else {
      var imc = _peso / _altura * _altura;
      if (imc <= 20.0) {
        setState(() {
          msg = "Com base no seu IMC ($imc) você está abaixo do peso";
        });
      } else if (imc >= 20.1 && imc <= 24.9) {
        setState(() {
          msg = "Com base no seu IMC ($imc) você está no seu peso normal";
        });
      } else if (imc >= 25.0 && imc <= 29.9) {
        setState(() {
          msg = "Com base no seu IMC ($imc) você está com sobrepeso";
        });
      } else if (imc >= 30.0 && imc <= 39.9) {
        setState(() {
          msg = "Com base no seu IMC ($imc) você está com obesidade grau I";
        });
      } else if (imc >= 40.0 && imc <= 42.9) {
        setState(() {
          msg =
              "Com base no seu IMC ($imc) você está com obesidade severa grau II";
        });
      } else if (imc >= 43.0) {
        setState(() {
          msg =
              "Com base no seu IMC ($imc) você está com obesidade mórbida grau III";
        });
      }
    }

    void calcW() {
      if (_peso == null || _altura == null) {
        setState(() {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Digite um valor para o cálculo")));
        });
      } else {
        var imc = _peso / _altura * _altura;
        if (imc <= 19.0) {
          setState(() {
            msg = "Com base no seu IMC ($imc) você está abaixo do peso";
          });
        } else if (imc >= 19.1 && imc <= 23.9) {
          setState(() {
            msg = "Com base no seu IMC ($imc) você está no seu peso normal";
          });
        } else if (imc >= 24.0 && imc <= 28.9) {
          setState(() {
            msg = "Com base no seu IMC ($imc) você está com sobrepeso";
          });
        } else if (imc >= 29.0 && imc <= 38.9) {
          setState(() {
            msg = "Com base no seu IMC ($imc) você está com obesidade grau I";
          });
        } else if (imc >= 39.0) {
          setState(() {
            msg =
                "Com base no seu IMC ($imc) você está com obesidade mórbida grau III";
          });
        }
      }

      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Cálculo realizado com sucesso!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            msg,
            style: new TextStyle(
              fontSize: 30.0,
              color: const Color(0xFF64ffda),
              fontWeight: FontWeight.w400,
              fontFamily: "Roboto"
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            controller: _controllerPeso,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Digite o peso:"),
            style: TextStyle(
              fontSize: 15.0,
              color: const Color(0xFF64ffda),
              fontWeight: FontWeight.w300,
              fontFamily: "Roboto"
            ),
          ),
          TextField(
            controller: _controllerAltura,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Digite a altura:"),
            style: TextStyle(
              fontSize: 15.0,
              color: const Color(0xFF64ffda),
              fontWeight: FontWeight.w300,
              fontFamily: "Roboto"
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RaisedButton(
                onPressed: () {
                  calcM();
                },
                color: const Color(0xFF212121),
                child: new Text("Calcular", style: new TextStyle(
                  fontSize: 20.0,
                  color: const Color(0xFF64ffda),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto"
                ),
                )
              )
            ]
          )
        ],
      )
    );
  }
}