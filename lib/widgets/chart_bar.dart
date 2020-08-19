import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double spending;
  final String label;
  final double pctSpending;

  ChartBar({this.spending, this.label, this.pctSpending});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text(spending.toStringAsFixed(0) + ' zł'),
          ),
        ),
        Container(
          width: 10,
          height: 60,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                  heightFactor: pctSpending,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )),
            ],
          ),
        ),
        Text(label),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
