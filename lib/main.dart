import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: Uuid(), title: 'New shoes', amount: 35.00, date: DateTime.now()),
    Transaction(
        id: Uuid(), title: 'Shirt', amount: 40.00, date: DateTime.now()),
    Transaction(
        id: Uuid(), title: 'Pants', amount: 80.00, date: DateTime.now()),
    Transaction(id: Uuid(), title: 'Beer', amount: 14.99, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Expense Planner')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            Column(
                children: transactions.map((transaction) {
              return Card(
                color: Colors.grey[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2) 
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        transaction.amount.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          transaction.title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          transaction.date.toString(),
                          textAlign: TextAlign.left,
                        )
                      ],
                    )
                  ],
                ),
                elevation: 5,
              );
            }).toList())
          ],
        ));
  }
}
