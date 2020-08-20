import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_expenses/widgets/new_transaction.dart';
import 'package:my_expenses/widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showChart = true;

  static double generatePrice() {
    return 10 + Random().nextInt(30) + Random().nextDouble();
  }

  static DateTime generateDate() {
    return DateTime.now().subtract(
      Duration(
        days: Random().nextInt(7),
      ),
    );
  }

  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Shoes',
      ammount: generatePrice(),
      date: generateDate(),
    ),
    Transaction(
      id: 't2',
      title: 'T-shirt',
      ammount: generatePrice(),
      date: generateDate(),
    ),
    Transaction(
      id: 't3',
      title: 'Sweatshirt',
      ammount: generatePrice(),
      date: generateDate(),
    ),
    Transaction(
      id: 't4',
      title: 'Baseball cap',
      ammount: generatePrice(),
      date: generateDate(),
    ),
    Transaction(
      id: 't5',
      title: 'Sunglasses',
      ammount: generatePrice(),
      date: generateDate(),
    ),
    Transaction(
      id: 't6',
      title: 'Groceries',
      ammount: generatePrice(),
      date: generateDate(),
    ),
  ];

  List<Transaction> get recentTransactions {
    return transactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String txTitle, double txPrice, DateTime txDate) {
    setState(() {
      transactions.add(Transaction(
        ammount: txPrice,
        title: txTitle,
        date: txDate,
        id: txDate.toString(),
      ));
    });
  }

  void _deleteTransaction(Transaction tx) {
    setState(() {
      transactions.removeWhere((transaction) => tx.id == transaction.id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _inLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text("My Expenses"),
      actions: [
        IconButton(
          icon: Icon(Icons.add_circle),
          onPressed: () => _startAddNewTransaction(context),
        )
      ],
    );

    final chartContainer = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.vertical) *
          (_inLandscape ? 0.6 : 0.3),
      child: Chart(recentTransactions),
    );

    final txListContainer = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.vertical) *
          (_inLandscape ? 0.8 : 0.7),
      child: TransactionList(transactions, _deleteTransaction),
    );

    final mySwitch = Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            'Show Chart',
            style: TextStyle(fontFamily: 'OpenSans'),
          ),
        ),
        Switch(
          value: _showChart,
          onChanged: (val) {
            setState(() {
              _showChart = val;
            });
          },
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_inLandscape) mySwitch,
            if (_inLandscape) _showChart ? chartContainer : txListContainer,
            if (!_inLandscape) chartContainer,
            if (!_inLandscape) txListContainer,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
