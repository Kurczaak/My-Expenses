import 'package:flutter/material.dart';
import 'transaction_tile.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? Container(
            height: 300,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('No transactions added yet!',
                      style: Theme.of(context).textTheme.headline6),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    height: 500,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          )
        : ListView.builder(
            itemCount: userTransactions.length,
            itemBuilder: (ctx, index) {
              return TransactionListTile(
                  userTransactions[index], deleteTransaction);
            },
          );
  }
}
