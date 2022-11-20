import 'package:flutter/material.dart';
/// Public Widgets and Functions

class Button extends StatelessWidget {
  Button({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  Widget child;
  GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: child,
    );
  }
}

/// Get the month-day hour-minute
String getDateTime(){
  String time = "${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:"
      "${DateTime.now().minute}";
  return time;
}

/// Convert number to weekday
String num2Week(){
  int t = DateTime.now().weekday;
  if(t == 1){
    return "Mon";
  } else if (t == 2){
    return "Tue";
  } else if (t == 3){
    return "Wed";
  } else if (t == 4){
    return "Tur";
  } else if (t == 5){
    return "Fri";
  } else if (t == 6){
    return "Sat";
  } else {
    return "Sun";
  }
}