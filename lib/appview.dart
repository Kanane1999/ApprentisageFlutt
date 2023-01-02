// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:prmier_app/Widget/Transaction_List.dart';

import 'Models/Transaction.dart';
import 'Widget/Chart.dart';
import 'Widget/New_transaction.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  final List<Transaction> _transactions = [
    // Transaction(
    // //   id: "t1",
    // //   title: "New Shoes",
    // //   amount: 99.99,
    // //   date: DateTime.now(),
    // // ),
    // // Transaction(
    // //   id: "t2",
    // //   title: "New Tchirt",
    // //   amount: 16.99,
    // //   date: DateTime.now(),
    // )
  ];
  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  List<Transaction> get _recentTransanctions {
    return _transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark.withOpacity(0.5),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Personal Expenses",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _startAddNewTransaction(context),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Chart(_recentTransanctions),
                    TransactionList(_transactions)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
