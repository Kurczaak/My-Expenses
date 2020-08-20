import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function handleNewTransaction;

  NewTransaction(this.handleNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _ammountController = TextEditingController();
  DateTime _chosenDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmmount = double.parse(_ammountController.text);
    if (enteredTitle.isEmpty || enteredAmmount <= 0 || _chosenDate == null)
      return;

    widget.handleNewTransaction(enteredTitle, enteredAmmount, _chosenDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1997),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _chosenDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ammount',
              ),
              controller: _ammountController,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_chosenDate == null
                        ? 'No Date Chosen!'
                        : 'Chosen date: ' +
                            DateFormat.yMd().format(_chosenDate)),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
