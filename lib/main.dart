import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quadra Enquation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Quadra Enquation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //
  double a = 0,
      b = 0,
      c = 0,
      delta = 0,
      x1 = 0,
      x2 = 0,
      float1 = 0,
      float2 = 0,
      result = 0;
  String zero = "";
  String x1_ = "";
  String x2_ = "";
  String x0_ = "";
  final formKey = GlobalKey<FormState>();
  TextEditingController text1 = TextEditingController(text: '');
  TextEditingController text2 = TextEditingController(text: '');
  TextEditingController text3 = TextEditingController(text: '');

  doQuadraticEnquation() {
    setState(() {
      a = double.parse(text1.text);
      b = double.parse(text2.text);
      c = double.parse(text3.text);
      delta = b * b - 4 * a * c;
      float1 = -b / (2 * a);
      float2 = sqrt(-delta) / (2 * a);

      if (delta > 0) {
        x1 = ((-1 * b) + sqrt(delta)) / (2 * a);
        x2 = ((-1 * b) - sqrt(delta)) / (2 * a);
        x1_ = x1.toString();
        x2_ = x2.toString();
      }
      if (delta == 0) {
        x1 = -b / (2 * a);
        x1_ = x1.toString();
        x2_ = "";
      } else {
        x1 = float1;
        x2 = float2;
      }
    });
  }
//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 30, 10.0, 60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Wynik:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '$x1_',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '$x2_',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '$zero',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '           a: ',
                  style: TextStyle(fontSize: 25, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    controller: text1,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '           b: ',
                  style: TextStyle(fontSize: 25, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    controller: text2,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '           c: ',
                  style: TextStyle(fontSize: 25, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    controller: text3,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          doQuadraticEnquation();
        },
        child: Icon(Icons.where_to_vote_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
