import 'package:flutter/material.dart';
import 'package:piggyvestinterestcalculator/util/calculation.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  String matureValue = '';
  String interest = '';
  Calculation calculation = new Calculation();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  double _amount = 0.0;
  int _day = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.blue[900],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 6.0,
                    bottom: 20.0,
                    child: Text(
                      'SAFELOCK FAQ',
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                  ),
                ],
              ),
            ),
            ExpansionTile(
              title: Text('What is SafeLock'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("SafeLock is a fixed savings option that allows you to earn up to 15.5% per annum, usually paid up front. \n\n" +
                      "Your Safelock acts as your sub-account so that you can transfer and lock funds from your Piggybank wallet or your debit card for at least 10 days, without access to these funds until maturity. \n\n" +
                      "The SafeLock feature is one step further towards curbing the temptation to touch money that you have put aside as your savings."),
                )
              ],
            ),
            ExpansionTile(
              title: Text('What is SafeLock'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("SafeLock interests are prorated and paid for the duration you set. \n\n" +
                      "On funds locked for: \n\n" +
                      "10-30 days, the interest is calculated at 6% per annum and prorated for the duration you set. \n\n" +
                      "31-60 days, the interest is calculated at 8% per annum and prorated accordingly \n\n" +
                      "61-90 days, the interest is calculated at 10% per annum and prorated accordingly \n\n" +
                      "91 days- 2 years, the interest is calculated at 13% per annum and prorated accordingly.\n\n" +
                      "2 years and above, the interest is calculated at 15.5% per annum and prorated accordingly. \n\n" +
                      "The minimum amount that may be kept in SafeLock is N1000."),
                )
              ],
            ),
          ],
        ),
      ),
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
        height: MediaQuery.of(context).size.height * 0.7,
        margin: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20.0),
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
                  if (value.isEmpty) return 'Empty Amount Not Allowed';
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
                  if (value.isEmpty) return 'Empty Day Not Allowed';
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
                      double calculateM =
                          calculation.findMatureValue(_amount, _day);
                      setState(() {
                        matureValue = calculateM.toStringAsFixed(2);
                        interest = calculation
                            .findInterest(calculateM, _amount)
                            .toStringAsFixed(2);
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text('Calculate',
                        style: TextStyle(color: Colors.white)),
                  ),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Interest Of: $interest',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    'Total Returns: $matureValue',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
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
