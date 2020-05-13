import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget{

  final titleController = TextEditingController();
  final valueController = TextEditingController();


  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);


  @override
  Widget build(BuildContext context) {
    return           Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(labelText: "Value"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text("New Transaction"),
                  textColor: Colors.purple,
                  onPressed: () {
                    onSubmit(
                        titleController.text,
                        double.tryParse(valueController.text) ?? 0.0
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    )
    ;
  }

}