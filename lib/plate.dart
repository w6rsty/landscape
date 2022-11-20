import 'package:flutter/material.dart';

class Plate extends StatelessWidget {
  /// A scrollable rail to hold widget.
  /// ?
  const Plate({Key? key,required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      //padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.grey[500],
      ),
      child: child,
    );
  }
}
