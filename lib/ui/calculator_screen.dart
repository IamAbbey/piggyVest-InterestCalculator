import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  var _focusNode = FocusNode();
  double value = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.blue[900],
    appBar: AppBar(
      backgroundColor: Colors.blue[900],
      title: Center(
        child: Text(
          'SafeLock Interest Calculator',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
    body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Calculate your SafeLock Interest',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                          fontSize: 14.0),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white70,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Amount',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide:
                                      BorderSide(color: Colors.green)),
                              contentPadding: EdgeInsets.all(10.0)),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          'Duration(In months)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: textEditingController2,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide:
                                      BorderSide(color: Colors.green)),
                              contentPadding: EdgeInsets.all(10.0)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              var calculated = calculateInterest(
                                  int.parse(textEditingController.text),
                                  int.parse(textEditingController2.text));
                              setState(() {
                                value = calculated;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
                              child: Text(
                                'Calculate',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent[700]),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Center(
                            child: Text(
                              'Balance: $value',
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    ));
  }

  double calculateInterest(int amount, int month) {
    var rate = 0.1 * month;
    var intrest = rate * amount;
    return amount + intrest;
  }
}
