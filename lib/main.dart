import 'package:flutter/material.dart';

void main() => runApp(MyApp());

String valDisplay = '0';
double a = 0.0;
double b = 0.0;
int intA, intB;
bool emptyB = true;
String _operator = '';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _displayNum(String button) {
    setState(() {
      if (button == 'AC') {
        valDisplay = '0';
        a = 0.0;
        b = 0.0;
        _operator = '';
        emptyB = true;
      } else if (button == '+/-') {
        if (valDisplay != '0') {
          a = double.parse(valDisplay);
          if (a % (a.toInt()) == 0) {
            a = a * -1.0;
            intA = a.toInt();
            valDisplay = intA.toString();
          } else {
            a = a * -1.0;
            valDisplay = a.toString();
          }
        }
      } else if (button == '%') {
        a = double.parse(valDisplay);
        a /= 100;
        valDisplay = a.toString();
      } else if (button == '+' ||
          button == '÷' ||
          button == '×' ||
          button == '-') {
        if (_operator == '') {
          _operator = button;
          emptyB = true;
        } else {
          if (emptyB == false) {
            if (_operator == '+') {
              a = a + b;
              if (a % (a.toInt()) == 0) {
                intA = a.toInt();
                valDisplay = intA.toString();
              } else {
                valDisplay = a.toString();
              }
              emptyB = true;
            } else if (_operator == '-') {
              a = a - b;
              if (a % (a.toInt()) == 0) {
                intA = a.toInt();
                valDisplay = intA.toString();
              } else {
                valDisplay = a.toString();
              }
              emptyB = true;
            } else if (_operator == '÷') {
              a = a / b;
              if (a % (a.toInt()) == 0) {
                intA = a.toInt();
                valDisplay = intA.toString();
              } else {
                valDisplay = a.toString();
              }
              emptyB = true;
            } else if (_operator == '×') {
              a = a * b;
              if (a % (a.toInt()) == 0) {
                intA = a.toInt();
                valDisplay = intA.toString();
              } else {
                valDisplay = a.toString();
              }
              emptyB = true;
            }
          } else {
            a = double.parse(valDisplay);
          }
          _operator = button;
        }
      } else if (button == '=') {
        if (emptyB == true) {
          if (a % (a.toInt()) == 0) {
            intA = a.toInt();
            valDisplay = intA.toString();
          } else {
            valDisplay = a.toString();
          }
        } else {
          if (_operator == '+') {
            a = a + b;
            if (a % (a.toInt()) == 0) {
              intA = a.toInt();
              valDisplay = intA.toString();
            } else {
              valDisplay = a.toString();
            }
          } else if (_operator == '-') {
            a = a - b;
            if (a % (a.toInt()) == 0) {
              intA = a.toInt();
              valDisplay = intA.toString();
            } else {
              valDisplay = a.toString();
            }
          } else if (_operator == '÷') {
            a = a / b;
            if (a % (a.toInt()) == 0) {
              intA = a.toInt();
              valDisplay = intA.toString();
            } else {
              valDisplay = a.toString();
            }
          } else if (_operator == '×') {
            a = a * b;
            if (a % (a.toInt()) == 0) {
              intA = a.toInt();
              valDisplay = intA.toString();
            } else {
              valDisplay = a.toString();
            }
          }
          emptyB = true;
        }
      } else {
        if (_operator != '') {
          if (emptyB == true) {
            valDisplay = button;
            b = double.parse(valDisplay);
            emptyB = false;
          } else {
            valDisplay += button;
            b = double.parse(valDisplay);
            emptyB = false;
          }
        } else {
          if (valDisplay == '0') {
            if (button == '.') {
              valDisplay += button;
            } else {
              valDisplay = button;
              a = double.parse(valDisplay);
            }
          } else {
            valDisplay += button;
            a = double.parse(valDisplay);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget btnGrey(String name) {
      return new Expanded(
          child: Material(
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[900], width: 0.5),
              color: Colors.grey[200].withOpacity(0.85),
            ),
            padding: EdgeInsets.only(top: 33.0, bottom: 33.0),
            child: InkWell(
                highlightColor: Colors.grey[700],
                onTap: () {
                  _displayNum(name);
                },
                child: Text(
                  '$name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'CaviarDreams',
                      fontWeight: FontWeight.bold),
                ))),
      ));
    }

    Widget btnOrange(String name) {
      return new Expanded(
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[900], width: 0.5),
                color: Colors.orange[400].withOpacity(0.85),
                borderRadius: BorderRadius.circular(1.0),
              ),
              height: 102.0,
              alignment: Alignment.center,
              child: InkWell(
                  highlightColor: Colors.grey[700],
                  onTap: () {
                    _displayNum(name);
                  },
                  child: Text(
                    '$name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 60.0,
                      fontFamily: 'CaviarDreams',
                      color: Colors.white,
                    ),
                  ))));
    }

    return Scaffold(
      appBar: AppBar(
          title: Text('My Calculator',
              style: TextStyle(fontFamily: '', fontSize: 22.0))),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment(0.95, 0.3),
                width: double.infinity,
                color: Colors.black87,
                child: Text(
                  '$valDisplay',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 58.0,
                    fontFamily: 'CaviarDreams',
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                btnGrey('AC'),
                btnGrey('+/-'),
                btnGrey('%'),
                btnOrange('÷'),
              ],
            ),
            Row(
              children: <Widget>[
                btnGrey('7'),
                btnGrey('8'),
                btnGrey('9'),
                btnOrange('×'),
              ],
            ),
            Row(
              children: <Widget>[
                btnGrey('4'),
                btnGrey('5'),
                btnGrey('6'),
                btnOrange('-'),
              ],
            ),
            Row(
              children: <Widget>[
                btnGrey('1'),
                btnGrey('2'),
                btnGrey('3'),
                btnOrange('+'),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey[900], width: 0.5),
                          color: Colors.grey[200].withOpacity(0.85),
                        ),
                        padding: EdgeInsets.only(top: 33.0, bottom: 33.0),
                        child: InkWell(
                            highlightColor: Colors.grey[700],
                            onTap: () {
                              _displayNum('0');
                            },
                            child: Text(
                              '0',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'CaviarDreams',
                                  fontWeight: FontWeight.bold),
                            ))),
                    flex: 2),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey[900], width: 0.5),
                          color: Colors.grey[200].withOpacity(0.85),
                        ),
                        padding: EdgeInsets.only(top: 33.0, bottom: 33.0),
                        child: InkWell(
                            highlightColor: Colors.grey[700],
                            onTap: () {
                              _displayNum('.');
                            },
                            child: Text(
                              '.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'CaviarDreams',
                                  fontWeight: FontWeight.bold),
                            ))),
                    flex: 1),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey[900], width: 0.5),
                          color: Colors.orange[400].withOpacity(0.85),
                          borderRadius: BorderRadius.circular(1.0),
                        ),
                        height: 102.0,
                        alignment: Alignment.center,
                        child: InkWell(
                            highlightColor: Colors.grey[700],
                            onTap: () {
                              _displayNum('=');
                            },
                            child: Text(
                              '=',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 60.0,
                                fontFamily: 'CaviarDreams',
                                color: Colors.white,
                              ),
                            ))),
                    flex: 1)
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
