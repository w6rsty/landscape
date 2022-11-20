import 'package:flutter/material.dart';
import 'package:landscape2/card.dart';
import 'package:landscape2/config.dart';

class TargetObject extends StatelessWidget {
  TargetObject({
    Key? key,
    required this.cardData,
    required this.onWillAccept,
    required this.onAccept,
    required this.builder,
  }) : super(key: key);

  final CardData cardData;
  bool Function(String?)? onWillAccept;
  void Function(String)? onAccept;
  Widget Function(BuildContext, List<String?>, List<dynamic>) builder;

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onWillAccept: onWillAccept,
      onAccept: onAccept,
      builder: builder,
    );
  }
}

/// To create a TargetObject
/// required cardData,onWillAccept,onAccept,builder,
/// receive data<String> from TestCube



/// receive draggable cube and generate a TextField
/// About builder:
///   get the cardData.list
///   and create object for each member
/// Unfinished:
///   Keep the data,store it in cardData
class ListTarget extends StatefulWidget {
  const ListTarget({Key? key, required this.cardData}) : super(key: key);

  final CardData cardData;

  @override
  State<ListTarget> createState() => _ListTargetState(this.cardData);
}

class _ListTargetState extends State<ListTarget>
    with AutomaticKeepAliveClientMixin{
  _ListTargetState(this.cardData);
  CardData cardData;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TargetObject(
        cardData: widget.cardData,
        onWillAccept: (String? value) {
          return value != null && value == "Text";
        },
        onAccept: (String value) {
          widget.cardData.list.add(value);
        },
        builder: (context, List candidateData, List rejectedData) {
          return _buildList();
        });
  }

  /// The ListView builder
  Widget _buildList() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        for (int i = 0; i < widget.cardData.list.length; i++)
          if (widget.cardData.list[i] == "Text")
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: _TextCube(),
            )
      ],
    );
  }

  /// The Text Container
  Widget _TextCube() {
    return Column(
      children: [
        _StateBar(),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0))),
          child: TextField(
            cursorWidth: 5,
            cursorRadius: Radius.circular(10),
            style: UI_config.inputTextStyle,
            minLines: 2,
            maxLines: 10,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            onSubmitted: (value) => print(value),
          ),
        ),
      ],
    );
  }

  /// The top bar state bar of TextField
  /// And it is a DragTarget which receive ColorCube
  Widget _StateBar() {
    return Container(
      height: 10,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          )),
      /// Add TextField Target here
      //child: ,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// class TextFieldTarget extends StatelessWidget {
//   const TextFieldTarget({Key? key,required this.cardData}) : super(key: key);
//
//   final CardData cardData;
//
//   @override
//   Widget build(BuildContext context) {
//     return TargetObject(
//         cardData: cardData,
//         onWillAccept: onWillAccept,
//         onAccept: onAccept,
//         builder: builder);
//   }
// }

