import 'package:flutter/material.dart';
import 'package:primeiro_trabalho/Orcamento.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main(){
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding : widgetsBinding);
  
  runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    FlutterNativeSplash.remove();
    return MaterialApp(
      home: AppImplement()
    );
  }
}
class AppImplement extends StatefulWidget{
  AppImplement({Key? key}) : super(key: key);
  @override 
  _AppImplementState createState() => _AppImplementState();
}

class _AppImplementState extends State<AppImplement>{

  Orcamento orcamentotijolo = new Orcamento();
  Orcamento orcamentoferragem = new Orcamento();
  Orcamento orcamentomadeira = new Orcamento();
  final TextEditingController _controllerMassaTijolo = TextEditingController();
  final TextEditingController _controllerValorTijolo = TextEditingController();
  final TextEditingController _controllerMassaFerragem = TextEditingController();
  final TextEditingController _controllerValorFerragem = TextEditingController();
  final TextEditingController _controllerMassaMadeira = TextEditingController();
  final TextEditingController _controllerValorMadeira = TextEditingController();
  @override
  Widget build(BuildContext context){ 
  return MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
    ),
    home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.construction)),
            Tab(icon: Icon(Icons.money)),
            Tab(icon: Icon(Icons.info),),
            ]
          )
        ),
        body: TabBarView
          (children: <Widget>[ 
          SizedBox(
          child: Scrollbar(
          child: Column(children: [
            Text(
              "TIJOLOS",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.redAccent),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: _controllerMassaTijolo, 
                  decoration: InputDecoration(hintText: "Informe a massa do material", 
                  border: OutlineInputBorder(),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: _controllerValorTijolo, 
                  decoration: InputDecoration(hintText: "Informe o valor do material", 
                  border: OutlineInputBorder(),
                  ),
                ),
              ),
              Text(
              "FERRAGEM",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.redAccent),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: _controllerMassaFerragem,
                  decoration: InputDecoration(hintText: "Informe a massa do material", 
                  border: OutlineInputBorder(),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: _controllerValorFerragem, 
                  decoration: InputDecoration(hintText: "Informe o valor do material", 
                  border: OutlineInputBorder(),
                  ),
                ),
              ),
              Text(
              "MADEIRA",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.redAccent),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: _controllerMassaMadeira,
                  decoration: InputDecoration(hintText: "Informe a massa do material", 
                  border: OutlineInputBorder(),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: _controllerValorMadeira, 
                  decoration: InputDecoration(hintText: "Informe o valor do material", 
                  border: OutlineInputBorder(),
                  ),
                ),
              ),  
              ElevatedButton(
                child: Text('ENVIAR',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 17),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 40),
                  primary: Colors.blueGrey,
                  onPrimary: Colors.white,
                ),  
                onPressed: (){
                  setState(() {
                    final double? massatijolo = double.tryParse(_controllerMassaTijolo.text);
                    final double? valortijolo = double.tryParse(_controllerValorTijolo.text);
                    final double? massaferragem = double.tryParse(_controllerMassaFerragem.text);
                    final double? valorferragem = double.tryParse(_controllerValorFerragem.text);
                    final double? massamadeira = double.tryParse(_controllerMassaMadeira.text);
                    final double? valormadeira = double.tryParse(_controllerValorMadeira.text);

                    _controllerMassaTijolo.clear();
                    _controllerValorTijolo.clear();
                    _controllerMassaFerragem.clear();
                    _controllerValorFerragem.clear();
                    _controllerMassaMadeira.clear();
                    _controllerValorMadeira.clear();

                    orcamentotijolo.setMassa(massatijolo!);
                    orcamentotijolo.setValor(valortijolo!);
                    orcamentoferragem.setMassa(massaferragem!);
                    orcamentoferragem.setValor(valorferragem!);
                    orcamentomadeira.setMassa(massamadeira!);
                    orcamentomadeira.setValor(valormadeira!);
                  }
                );
              },
            ),
          ],
        ),
      ),
    ),
  
                      Column(children: [
                        Text(""),
                        Row(children:[
                        Text("     "),
                        Image.asset("assets/images/tijolo.png"),
                        Column(children: [
                          Text("TIJOLOS",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.redAccent),
                          ),
                          Text(orcamentotijolo.calculaOrcamento() + " reais",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(""),
                    Row(children:[
                      Column(children: [
                      Text("          FERRAGEM  ",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.redAccent),
                      ),
                      Text("          " + orcamentoferragem.calculaOrcamento() + " reais",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300, color: Colors.black),
                      ),
                    ],
                  ),
                      Image.asset("assets/images/ferragem.png"),
                    ]
                  ),
                  Text(""),
                  Text(""),
                    Row(children: [
                      Text(" "),
                      Image.asset("assets/images/madeira.png"),
                      Column(children: [
                          Text("  MADEIRA",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.redAccent),
                          ),
                          Text("  " + orcamentomadeira.calculaOrcamento() + " reais",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(""),
                    Row(children: [
                       Column(children: [
                          Text(""),
                          Text(""),
                          Text(""),
                          Text("                    TOTAL",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.redAccent),
                          ),
                          Text("                        " + orcamentotijolo.somaOrcamento(orcamentotijolo.calculaOrcamentoDouble(), orcamentoferragem.calculaOrcamentoDouble(), orcamentomadeira.calculaOrcamentoDouble()) + " reais",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
                Column(children: [
                  Text(""),
                  Row(children: [
                  Text("          PLANEJAMENTO",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.blueGrey),
                  ),
                ],
              ),

                Text(""),
                Text(""),
                  Row(children: [
                      Icon(Icons.arrow_circle_right_outlined, color: Colors.redAccent,),
                      Text(" Escolha o terreno ideal para construir",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300, color: Colors.black)
                      ),
                    ],
                  ),
                  Text(""),
                  Row(children: [
                      Icon(Icons.arrow_circle_right_outlined, color: Colors.redAccent,),
                      Text(" Faça o orçamento da obra",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300, color: Colors.black)
                      ),
                    ],
                  ),
                  Text(""),
                  Row(children: [
                      Icon(Icons.arrow_circle_right_outlined, color: Colors.redAccent,),
                      Text(" Contrate um engenheiro ou arquiteto",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300, color: Colors.black)
                      ),
                    ],
                  ),
                  Text(""),
                  Row(children: [
                      Icon(Icons.arrow_circle_right_outlined, color: Colors.redAccent,),
                      Text(" Escolha ótimos profissionais",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300, color: Colors.black)
                      ),
                    ],
                  ),  
                  Text(""),
                  Row(children: [
                      Icon(Icons.arrow_circle_right_outlined, color: Colors.redAccent,),
                      Text(" Evite o desperdício de materiais",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300, color: Colors.black)
                      ),
                    ],
                  ),
                  Text(""),
                  Row(children: [
                      Icon(Icons.arrow_circle_right_outlined, color: Colors.redAccent,),
                      Text(" Faça um projeto detalhado",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300, color: Colors.black)
                      ),
                    ],
                  ),  
                  Text(""),
                  Row(children: [
                      Icon(Icons.arrow_circle_right_outlined, color: Colors.redAccent,),
                      Text(" Mantenha o projeto inicial",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300, color: Colors.black)
                      ),
                    ],
                  ),
                  Text(""),
                  Row(children: [
                      Icon(Icons.arrow_circle_right_outlined, color: Colors.redAccent,),
                      Text(" Escolha bons materiais",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300, color: Colors.black)
                      ),
                    ],
                  ),
                  Text(""),
                  Row(children: [
                      Icon(Icons.arrow_circle_right_outlined, color: Colors.redAccent,),
                      Text(" Siga um cronograma",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300, color: Colors.black)
                      ),
                    ],
                  ),      
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}