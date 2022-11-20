import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DraggableSquare extends StatelessWidget {
  /// A basic draggable widget
  const DraggableSquare({
    Key? key,
    required this.child,
    required this.feedback,
    required this.childWhenDragging,
    required this.name,
}) : super(key: key);

  final Widget child;
  final Widget feedback;
  final Widget childWhenDragging;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: feedback,
      child: child,
      childWhenDragging: childWhenDragging,
      data: name,
    );
  }
}

class TestCube extends StatelessWidget {
  TestCube({
    Key? key,
    required this.color,
    required this.width,
    required this.name,
    required this.child,
    required this.feedback,
    required this.childWhenDragging
  }) : super(key: key);

  final Color color;
  final double width;
  final String name;
  Widget child;
  Widget feedback;
  Widget childWhenDragging;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DraggableSquare(
        name: name,
        child: Container(
          height: 50,
          width: width ?? 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [BoxShadow(
              blurRadius: 1,
              offset: Offset(0.5,0.2),
              color: Colors.black38,
            )]
           ),
          child: child,
        ),
        feedback: feedback,
        childWhenDragging: childWhenDragging,
      ),
    );
  }
}

/// To create a draggable cube in the Plate widget
/// required child,feedback,childWhenDragging,name,color,width
/// data given to the DragTarget is name<String>
///
/// To add a cube in the plate,
/// Create it in homepage.dart/widget topPlate
///
///
/// To create a TextField
class TextCube extends StatelessWidget {
  const TextCube({Key? key,required this.name}) : super(key: key);

  final String name;
  @override
  Widget build(BuildContext context) {
    return TestCube(
      color: Colors.white,
      width: 100,
      name: name,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10,),
            Icon(Icons.text_fields_outlined,color: Colors.grey,),
            SizedBox(width: 10,),
            Text("Text",style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14
            ),)
          ],
        ),
      ),
      feedback: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(child: Icon(Icons.text_fields_outlined,color: Colors.grey,),),
      ),
      childWhenDragging: SizedBox(height: 50,width:100,),
    );
  }
}
/// To complete a to-do TextField
/// plan.1  Attach a icon to it
/// plan.2 When dragging is finished ,change the color of TextField(Complicated)
class DoneCube extends StatelessWidget {
  const DoneCube({Key? key,required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return TestCube(
        color: Colors.amberAccent,
        width: 50,
        name: name,
        child: Center(child: Icon(CupertinoIcons.check_mark_circled,color: Colors.green,size: 28,)),
        feedback: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.amberAccent.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(CupertinoIcons.check_mark_circled_solid,color: Colors.green,size: 30,),
        ),
        childWhenDragging: SizedBox(height: 50,width: 50,)
    );
  }
}
/// A vertical at the left side of the TextField.
class ColorCube extends StatelessWidget {
  const ColorCube({
    Key? key,
    required this.name,
    required this.color,
  }) : super(key: key);

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TestCube(
        color: color,
        width: 50,
        name: name,
        child: Center(child: Icon(CupertinoIcons.sidebar_left,size: 24,color: Colors.grey[300],),),
        feedback: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: color.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8.0)
          ),
          child: Center(child: Icon(CupertinoIcons.square_righthalf_fill,size: 26,color: Colors.grey,),),
        ),
        childWhenDragging: SizedBox(height: 50,width: 50,)
    );
  }
}


