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
        fontFamily: 'Quicksand',
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
  final List<Transaction> transactions = [
    // Transaction(id: 't1', title: 'Shoes', ammount: 19.99, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'T-shirt', ammount: 3499.51, date: DateTime.now()),
    // Transaction(
    //     id: 't3', title: 'Sweatshirt', ammount: 73.22, date: DateTime.now()),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("My Expenses"),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: Column(children: [
        Chart(recentTransactions),
        Container(
          height: 400,
          child: TransactionList(transactions),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
