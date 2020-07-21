import 'package:expenses/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = recentTransaction
          .where((t) => t.date.day == weekDay.day)
          .where((t) => t.date.month == weekDay.month)
          .where((t) => t.date.year == weekDay.year)
          .map((e) => e.value)
          .reduce((a, b) => a + b);

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'values': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    throw Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
