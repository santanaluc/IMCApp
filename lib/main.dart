import 'package:IMCApp/teladois.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
      drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.attribution_sharp),
                title: Text("Entenda o IMC"),
                subtitle: Text("Entenda para que serve o IMC"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TelaDois()));
                },
              )
            ],
          ),
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

  void calc(context) {
    double _peso = double.tryParse(_controllerPeso.text);
    double _altura = double.tryParse(_controllerAltura.text);

    if (_peso == null || _altura == null) {
      setState(() {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Digite um valor para calcular")));
      });
    } else {

      double imc = _peso / (_altura * _altura);
      double result = double.parse(imc.toStringAsPrecision(3));

      if (imc <= 16.0) {
        setState(() {
          msg = "Com base no seu IMC ($result) você está com magreza grau III";
        });
      } else if (imc >= 16.10 && imc <= 17.0) {
        setState(() {
          msg = "Com base no seu IMC ($result) você está com magreza grau II";
        });
      } else if (imc >= 17.1 && imc <= 18.4) {
        setState(() {
          msg = "Com base no seu IMC ($result) você está com magreza grau II";
        });
      } else if (imc >= 18.5 && imc <= 24.9) {
        setState(() {
          msg =
          "Com base no seu IMC ($result) você está com eutrofia";
        });
      } else if (imc >= 25.0 && imc <= 29.9) {
        setState(() {
          msg =
          "Com base no seu IMC ($result) você está com sobrepeso";
        });
      } else if (imc >= 30.0 && imc <= 34.9) {
        setState(() {
          msg =
          "Com base no seu IMC ($imc) você está com obesidade grau I";
        });
      }else if (imc >= 35.0 && imc <= 40.0) {
        setState(() {
          msg =
          "Com base no seu IMC ($imc) você está com obesidade grau II";
        });
      } else if (imc >= 40.0) {
        setState(() {
          msg =
          "Com base no seu IMC ($imc) você está com obesidade grau III";
        });
      }
      Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Cálculo realizado com sucesso!")));
      }
    }

    void novo() {
      setState(() {
        _controllerAltura.text = " ";
        _controllerPeso.text = " ";
        SystemChannels.textInput.invokeListMethod("TextInput.hide");
        msg = "Calcule o seu IMC";
        Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Limpo!")));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
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
                        calc(context);
                      },
                      color: const Color(0xFF212121),
                      child: new Text("Calcular", style: new TextStyle(
                          fontSize: 20.0,
                          color: const Color(0xFF64ffda),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto"
                      ),
                      )
                  ),
                  RaisedButton(
                    onPressed: () {
                      novo();
                    },
                    color: const Color(0xFF212121),
                    child: new Text(
                      "Limpar",
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: const Color(0xFF64ffda),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto"),
                    ),
                  ),
                ]
            )
          ],
        )
    );
  }
}