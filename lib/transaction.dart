import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction {
  String id;
  String title;
  double ammount;
  DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.ammount,
    @required this.date,
  });
}

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;

  TransactionWidget(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          _Price(transaction.ammount),
          _Expense(
            date: transaction.date,
            title: transaction.title,
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
        '${ammount} zł',
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

class _Expense extends StatelessWidget {
  final String title;
  final DateTime date;
  _Expense({
    @required this.title,
    @required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(date),
            style: TextStyle(
              color: Colors.grey,
            )),
      ],
    );
  }
}
