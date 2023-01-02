import 'package:flutter/material.dart';
import '../Models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList(this.transactions, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemBuilder: ((context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Text('\$${transactions[index].amount}'),
              ),
              title: Text(
                transactions[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(DateFormat.yMMMd()
                  .format(transactions[index].date)
                  .toString()),
            ),
          );
        }),
        itemCount: transactions.length,
      ),
    );
  }
}
