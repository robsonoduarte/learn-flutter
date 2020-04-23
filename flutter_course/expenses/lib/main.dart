import 'package:expenses/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final _transactions = [
    Transaction(id: '1', title: 'Beer', value: 8.5, date: DateTime.now()),
    Transaction(id: '2', title: 'Sofa', value: 2.0, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Graphic'),
              color: Colors.blue,
              elevation: 5,
            ),
          ),
          Card(
            child: Text('Transaction List'),
          )
        ],
      ),
    );
  }
}
