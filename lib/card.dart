import 'package:flutter/material.dart';
import 'widgets.dart';
import 'config.dart';
import 'drag/draggable_target.dart';

class CardView extends StatelessWidget {
  const CardView({
    Key? key,
    required this.cardData,
  }) : super(key: key);

  final CardData cardData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 420,
      width: 370,
      padding: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          _Bar(),
          _Body()
        ],
      ),
    );
  }
  /// The Bar
  Widget _Bar(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.0),
          topLeft: Radius.circular(8.0)
        ),
        color: Colors.teal,
      ),
      height: 50,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 15,),
          SizedBox(
              child: Text(
                  "${cardData.time} ${cardData.weekday}",
                style: UI_config.dateTextStyle,
              )
          ),
          Expanded(child: SizedBox()),
          SizedBox(width: 30,),
          _dot(),
          SizedBox(width: 15,),
          Text("Card ${cardData.name}",style: UI_config.TitleTextStyle,),
          SizedBox(width: 15,),
          _dot(),
          SizedBox(width: 30,),
          _listButton(),
          SizedBox(width: 10,),
          //_DeleteButton(),
          SizedBox(width: 10,)
        ],
      ),
    );
  }








  /// The body
  Widget _Body(){
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0)
          ),
          color: Colors.grey[500],
        ),
        padding: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
        child: Column(
          children: [
            Container(
              height: 350,
              child: ListTarget(cardData: cardData,),
            )
          ],
        )
      ),
    );
  }

  /// Delete Button
  Widget _DeleteButton(){
    return Button(
      onTap: (){print("Hi");},
      child: Icon(Icons.delete_outline_outlined,color: Colors.white,size: 24,),
    );
  }
  /// Dot
  Widget _dot(){
    return SizedBox(
      width: 10,
      child: Icon(Icons.circle,color: Colors.black54,size: 10,));
  }
  /// Information button
  Widget _listButton(){
    return Button(
      onTap: (){print(cardData.list);},
      child: Icon(Icons.info_outline,size: 24,color: Colors.white,),
    );
  }
}

class CardData
{
  /// A data class to store the data of a single card.
  /// When the ListView rendering, send the data to builder
  CardData({
    required this.name,
    required this.time,
    required this.weekday,
  });
  final String name;
  final String time;
  final String weekday;
  final List<String> list = <String>[];
  final List<String> textList = <String>[];
  final Map<String,String> listValue = {};
  int index = 0;
}