import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function handleNewTransaction;

  NewTransaction(this.handleNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final ammountController = TextEditingController();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmmount = double.parse(ammountController.text);
    if (enteredTitle.isEmpty || enteredAmmount <= 0) return;

    widget.handleNewTransaction(enteredTitle, enteredAmmount);

    Navigator.of(context).pop();
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
