import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function dtx;
  const NewTransaction(this.dtx, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final transacController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    if (amountController.text == '') {
      return;
    }
    final vTransac = transacController.text;
    final vAmount = double.parse(amountController.text);
    if (vTransac.isEmpty || vAmount <= 0) {
      return;
    }
    widget.dtx(vTransac, vAmount);
  }

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
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 50),
                    child: Text('No date shoosen'),
                  ),
                  Expanded(
                    child: customButton(
                      rename: 'Shoosen Date',
                    ),
                  ),
                ],
              ),
            ),
            customButton(
              onTap: submitData,
              rename: 'AddTransaction',
              taille: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }

  Widget customButton({Function()? onTap, String? rename, double? taille}) {
    return InkWell(
      // onTap: (() {
      //   widget.dtx(
      //     transacController.text,
      //     double.parse(amountController.text),
      //   );
      // }),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        width: taille,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Theme.of(context).primaryColorDark.withOpacity(0.5),
          ),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 1,
            ),
          ],
        ),
        child: Text(
          rename!,
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
