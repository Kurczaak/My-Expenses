import 'package:flutter/material.dart';
import 'transaction_tile.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userTransactions.length,
      itemBuilder: (ctx, index) {
        return TransactionTile(userTransactions[index]);
      },
    );
  }
}
