import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transactions.dart';
import 'package:expenses/model/model.dart';
import 'package:flutter/cupertino.dart';

class TransactionUser extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _TransactionUserState();
  }

}

class _TransactionUserState extends State<TransactionUser>{

  final _transactions = [
    Transaction(id: '1', title: 'Beer', value: 8.5, date: DateTime.now()),
    Transaction(id: '2', title: 'Sofa', value: 2.0, date: DateTime.now()),
  ];


  _addTransaction(String title, double value){
    setState(() {
      _transactions.add(Transaction(
        id: Random(DateTime.now().millisecondsSinceEpoch).nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now()
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction),
        Transactions(_transactions)
      ],
    );
  }

}