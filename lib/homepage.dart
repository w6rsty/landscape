import 'package:flutter/material.dart';
import 'package:landscape2/config.dart';
import 'drag/draggable.dart';
import 'plate.dart';
import 'widgets.dart';
import 'card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// The amount of cards
  int cardCount = 0 ;
  /// Store the basic data of cards
  List<CardData> cards = <CardData>[

  ];

  /// Increase the amount
  /// Used in the to left button.
  void cardCountIncrement(){
    setState(() {
      cardCount++;
      CardData basecard  = CardData(
        name: cardCount.toString(),
        time: getDateTime(),
        weekday: num2Week(),
      );
      cards.add(basecard);
    });
  }

  ScrollController _controller = ScrollController();
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 8.0,),
          /// The selecting plate
          topPlate(),
          ///The lower part
          Row(
            children: [SizedBox(width: 15,),subline()],
          ),
          /// CardView
          Container(
            height: 420,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: cardCount,
              itemBuilder: (_,index)=>CardView(cardData: cards[index]),
            ),
          ),
          /// To left Button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                toLeftButton(),
                SizedBox(width: 20,),
                addCardButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  /// A to top button
  Widget toLeftButton(){
    ///Using private object _controller,so it must be in this file
    return Button(
      onTap: ()=>_controller.animateTo(
        -10.0,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      ),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.teal,
            shape: BoxShape.circle
        ),
        child: Icon(Icons.arrow_circle_left_outlined,size: 40,color: Colors.white,),
      ),
    );
  }
  /// Add new card button
  Widget addCardButton(){
    return Button(
      onTap: cardCountIncrement,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.teal,
          shape: BoxShape.circle
        ),
        child: Icon(Icons.add,size: 40,color: Colors.white,),
      ),
    );
  }
  /// Top rail
  Widget topPlate(){
    /// The Plate will have a list to store its member and their type.
    /// It supports scrolling horizontally.
    /// It can hold different widget.
    /// The basic scale of its widget should be 50 (height) * 50n (width).
    return Plate(
      child: Center(
        child: SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: [
              TextCube(name: 'Text'),
              DoneCube(name: "Done"),
              ColorCube(name: "Color_red", color: Colors.red),
              ColorCube(name: "Color_blue", color: Colors.blue),
              ColorCube(name: "Color_green", color: Colors.green),
              TextCube(name: 'Text'),
            ],
          ),
        ),
      ),
    );
  }
  /// Words tip
  Widget subline(){
    String s = cardCount<=1
        ? "  ${cardCount} card now"
        : "  ${cardCount} cards now";
    return Text(s,style: UI_config.detailTextStyle,);
  }
}

