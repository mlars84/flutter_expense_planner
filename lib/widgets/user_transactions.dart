import 'package:flutter/material.dart';
import '../widgets/transaction_list.dart';
import '../widgets/new_transaction.dart';
import 'package:expense_planner/models/transaction.dart';
import 'package:uuid/uuid.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  UserTransactions({Key key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: Uuid(), title: 'New shoes', amount: 35.15, date: DateTime.now()),
    Transaction(
        id: Uuid(), title: 'Shirt', amount: 40.63, date: DateTime.now()),
    Transaction(
        id: Uuid(), title: 'Pants', amount: 80.86, date: DateTime.now()),
    Transaction(id: Uuid(), title: 'Beer', amount: 14.99, date: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = new Transaction(
      id: DateTime.now().toString(), 
      title: title, 
      amount: amount, 
      date: DateTime.now()
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addNewTransaction: _addNewTransaction),
        TransactionList(transactions: _userTransactions)
      ],
    );
  }
}
