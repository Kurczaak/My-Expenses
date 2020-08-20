import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;

  TransactionTile(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          _Price(transaction.ammount),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Title(transaction.title),
              _Date(transaction.date),
            ],
          )
        ],
      ),
    );
  }
}

class _Price extends StatelessWidget {
  final double ammount;

  _Price(this.ammount);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(8),
      child: Text(
        ammount.toStringAsFixed(2) + ' zł',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;

  _Title(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title, style: Theme.of(context).textTheme.headline6),
    );
  }
}

class _Date extends StatelessWidget {
  final DateTime date;

  _Date(this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(date),
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class TransactionListTile extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTransaction;

  TransactionListTile(this.transaction, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(transaction.ammount.toStringAsFixed(2) + ' zł'),
            ),
          ),
        ),
        title: Text(transaction.title,
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(
          DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
              .format(transaction.date),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: _screenWidth > 460
            ? FlatButton.icon(
                onPressed: () => deleteTransaction(transaction),
                textColor: Theme.of(context).errorColor,
                icon: Icon(Icons.delete),
                label: Text('Delete'),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTransaction(transaction),
              ),
      ),
    );
  }
}
