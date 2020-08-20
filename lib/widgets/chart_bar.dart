import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double spending;
  final String label;
  final double pctSpending;

  ChartBar({this.spending, this.label, this.pctSpending});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return _Bar(
          spending: spending,
          pctSpending: pctSpending,
          label: label,
          constraints: constraints,
        );
      },
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({
    Key key,
    @required this.spending,
    @required this.pctSpending,
    @required this.label,
    @required this.constraints,
  }) : super(key: key);

  final double spending;
  final double pctSpending;
  final String label;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          height: constraints.maxHeight * 0.1,
          child: FittedBox(
            child: Text(
              spending.toStringAsFixed(0) + ' zł',
              softWrap: true,
            ),
          ),
        ),
        Container(
          width: constraints.maxWidth * 0.5,
          margin: EdgeInsets.all(constraints.maxHeight * 0.05),
          height: constraints.maxHeight * 0.6,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                  heightFactor: pctSpending,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  )),
            ],
          ),
        ),
        Container(
          height: constraints.maxHeight * 0.1,
          child: FittedBox(
            child: Text(label),
          ),
        ),
      ],
    );
  }
}
