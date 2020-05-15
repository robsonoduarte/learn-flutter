import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget{

  final titleController = TextEditingController();
  final valueController = TextEditingController();


  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _onSubmit(){
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <= 0){
      return;
    }

    onSubmit(title,value);
  }

  @override
  Widget build(BuildContext context) {
    return           Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (_) => _onSubmit(),
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              onSubmitted: (_) => _onSubmit(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: valueController,
              decoration: InputDecoration(labelText: "Value"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text("New Transaction"),
                  textColor: Colors.purple,
                  onPressed: _onSubmit,
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