import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      var sum = 0.0;
      DateTime weekday = DateTime.now().subtract(Duration(days: index));

      for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].date.day == weekday.day &&
            transactions[i].date.month == weekday.month &&
            transactions[i].date.year == weekday.year) {
          sum += transactions[i].ammount;
        }
      }
      return {
        'day': DateFormat.E().format(weekday).substring(0, 2),
        'ammount': sum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return transactions.fold(0.0, (sum, tx) => sum + tx.ammount);
  }

  double calculatePctSpendings(double spendings, double total) {
    if (total <= double.minPositive) return 0;
    return spendings / total;
  }

  Chart(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...groupedTransactionValues.map((tx) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: tx['day'],
                  spending: tx['ammount'],
                  pctSpending:
                      calculatePctSpendings(tx['ammount'], totalSpending),
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
