import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key key,
    @required this.transactions,
  }) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map((transaction) {
      return Card(
        color: Colors.grey[100],
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.redAccent, width: 2)),
              padding: EdgeInsets.all(10),
              child: Text(
                '\$${transaction.amount.toString()}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.redAccent),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  transaction.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  new DateFormat.yMMMd().format(transaction.date),
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      );
    }).toList());
  }
}
