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
          color: Colors.purple,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 2),
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
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
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
