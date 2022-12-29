import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function dtx;
  NewTransaction(this.dtx, {super.key});

  final transacController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: transacController,
              decoration: const InputDecoration(labelText: "Transaction"),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: "Price"),
            ),
            InkWell(
              onTap: (() {
                dtx(
                  transacController.text,
                  double.parse(amountController.text),
                );
              }),
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color: const Color.fromARGB(255, 24, 24, 24)
                          .withOpacity(0.7)),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: const Text(
                  "Add Transaction",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
