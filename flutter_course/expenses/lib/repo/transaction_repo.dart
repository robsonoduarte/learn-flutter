import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transactions.dart';
import 'package:expenses/model/model.dart';
import 'package:flutter/cupertino.dart';

class TransactionRepo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _TransactionRepoState();
  }

}

class _TransactionRepoState extends State<TransactionRepo>{

  final _transactions = [
    Transaction(id: '1', title: 'Beer', value: 8.5, date: DateTime.now()),
    Transaction(id: '2', title: 'Sofa', value: 2.0, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Transactions(_transactions),
        TransactionForm()
      ],
    );
  }

}