import 'package:flutter/material.dart';
import '../widgets/transaction_list.dart';
import '../widgets/new_transaction.dart';
import 'package:expense_planner/models/transaction.dart';
import 'package:uuid/uuid.dart';

class UserTransactions extends StatefulWidget {
  UserTransactions({Key key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(
        id: Uuid(), title: 'New shoes', amount: 35.15, date: DateTime.now()),
    Transaction(
        id: Uuid(), title: 'Shirt', amount: 40.63, date: DateTime.now()),
    Transaction(
        id: Uuid(), title: 'Pants', amount: 80.86, date: DateTime.now()),
    Transaction(id: Uuid(), title: 'Beer', amount: 14.99, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList(transactions: transactions)
      ],
    );
  }
}
