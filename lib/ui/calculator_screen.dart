import 'package:flutter/material.dart';
import 'package:piggyvestinterestcalculator/util/calculation.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  String value = '';
  Calculation calculation = new Calculation();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  double _amount = 0.0;
  int _day = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'SafeLock Interest Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        margin: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Text(
                'Amount',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[700]),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(value.isEmpty) return 'Empty Amount Not Allowed';
                  double amount = double.tryParse(value);
                  if (amount == null && !calculation.checkAmount(amount)) {
                    return 'Invalid value, you are to supply a number';
                  }
                  return null;
                },
                onSaved: (value) => _amount = double.tryParse(value),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.green)),
                    contentPadding: EdgeInsets.all(10.0)),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'Duration(In Days)',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[700]),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(value.isEmpty) return 'Empty Day Not Allowed';
                  int day = int.tryParse(value);
                  if (day == null && !calculation.checkDuration(day)) {
                    return 'Invalid value, you are to supply a day between 10 - 1000';
                  }
                  return null;
                },
                onSaved: (value) => _day = int.tryParse(value),
                controller: textEditingController2,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.green)),
                    contentPadding: EdgeInsets.all(10.0)),
              ),
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      double calculate =
                          calculation.performCalculation(_amount, _day);
                      setState(() {
                        value = calculate.toStringAsFixed(2);
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child:
                        Text('Calculate', style: TextStyle(color: Colors.white)),
                  ),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  'Total Returns: $value',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
