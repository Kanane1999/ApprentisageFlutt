import 'package:flutter/material.dart';
import '../Models/Transaction.dart';
import 'New_transaction.dart';
import 'Transaction_List.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 99.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "New Tchirt",
      amount: 16.99,
      date: DateTime.now(),
    )
  ];
  void _addNewTransaction(String title, double amount) {
    final Newtx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      transactions.add(Newtx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
