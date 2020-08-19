import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      double sum = 0.0;
      DateTime weekday = DateTime.now().subtract(Duration(days: index));

      for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].date.day == weekday.day &&
            transactions[i].date.month == weekday.month &&
            transactions[i].date.year == weekday.year) {
          sum += transactions[i].ammount;
        }
      }
      return {'day': DateFormat.E().format(weekday), 'ammount': sum};
    });
  }

  Chart(this.transactions);

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...groupedTransactionValues.map((tx) {
            return Column(
              children: [
                Text(tx['day']),
                Text(tx['ammount'].toString()),
              ],
            );
          }).toList()
        ],
      ),
    );
  }
}
