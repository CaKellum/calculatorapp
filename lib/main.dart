import 'package:flutter/material.dart';
import 'package:flutter_calculator/logic/operation_parsing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String function = '';
  bool erase = false;

  Expanded calcButton(String text) {
    return Expanded(
      child: FlatButton(
        color: Colors.black45,
        padding: EdgeInsets.all(20),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
        onPressed: () {
          setState(() {
            if(erase){
              this.function ='';
              this.erase = false;
            }
            this.function += text;
          });
        },
      ),
    );
  }

  Expanded eqButton() {
    return Expanded(
      child: FlatButton(
        color: Colors.black45,
        padding: EdgeInsets.all(20),
        child: Text(
          '=',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
        onPressed: () {
          setState(() {
            this.function = OperationParsing.operate(this.function);
          });
          this.erase = true;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Text(this.function),
              width: MediaQuery.of(context).size.width,
              height: 200,
            ),
            Row(
              children: <Widget>[
                calcButton('7'),
                calcButton('8'),
                calcButton('9'),
                calcButton(' / '),
              ],
            ),
            Row(
              children: <Widget>[
                calcButton('4'),
                calcButton('5'),
                calcButton('6'),
                calcButton(' X '),
              ],
            ),
            Row(
              children: <Widget>[
                calcButton('1'),
                calcButton('2'),
                calcButton('3'),
                calcButton(' - '),
              ],
            ),
            Row(
              children: <Widget>[
                calcButton('0'),
                calcButton('.'),
                eqButton(),
                calcButton(' + '),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
