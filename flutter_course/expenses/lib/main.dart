import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transactions.dart';
import 'package:expenses/model/model.dart';
import 'package:expenses/components/transactions_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            TransactionUser()
          ],
        ),
      ),
    );
  }
}
