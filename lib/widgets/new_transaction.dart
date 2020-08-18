import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final ammountController = TextEditingController();
  final Function handleNewTransaction;

  NewTransaction(this.handleNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Text("Chart"),
          color: Colors.blue,
        ),
        Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  controller: titleController,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Ammount',
                  ),
                  controller: ammountController,
                ),
                FlatButton(
                  child: Text("Add Transaction"),
                  textColor: Colors.purple,
                  onPressed: () {
                    handleNewTransaction(
                      titleController.text,
                      double.parse(ammountController.text),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
