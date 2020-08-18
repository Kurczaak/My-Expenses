import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final ammountController = TextEditingController();
  final Function handleNewTransaction;

  NewTransaction(this.handleNewTransaction);

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmmount = double.parse(ammountController.text);
    if (enteredTitle.isEmpty || enteredAmmount <= 0) return;

    handleNewTransaction(enteredTitle, enteredAmmount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            controller: titleController,
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Ammount',
            ),
            controller: ammountController,
            onSubmitted: (_) => _submitData(),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            elevation: 2,
            child: FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.purple,
              onPressed: _submitData,
            ),
          ),
        ],
      ),
    );
  }
}
