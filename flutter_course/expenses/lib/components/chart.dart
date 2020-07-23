import 'package:expenses/components/chart_bar.dart';
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

      var totalSum = 0.0;

      recentTransaction
          .where((t) => t.date.day == weekDay.day)
          .where((t) => t.date.month == weekDay.month)
          .where((t) => t.date.year == weekDay.year)
          .map((e) => e.value)
          .forEach((element) => totalSum += element);

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions.forEach((tr) {
      print(tr);
    });

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((e) {
          return ChartBar(
            label: e['day'],
            value: e['value'],
            percentage: 0,
          );
        }).toList(),
      ),
    );
  }
}
