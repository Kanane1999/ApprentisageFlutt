import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
    this.label,
    this.depenseAmount,
    this.depensePcAmount, {
    super.key,
  });
  final String label;
  final double depenseAmount;
  final double depensePcAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('\$${depenseAmount.toStringAsFixed(0)}'),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.1),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: depensePcAmount,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
