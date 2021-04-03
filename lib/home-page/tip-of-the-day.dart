import 'package:flutter/material.dart';

class TipsOfTheDayCard extends StatefulWidget {
  @override
  _TipsOfTheDayCardState createState() => _TipsOfTheDayCardState();
}

class _TipsOfTheDayCardState extends State<TipsOfTheDayCard> {
  @override
  Widget build(BuildContext context) {
    var _width=MediaQuery.of(context).size.width;
    var _height=MediaQuery.of(context).size.height;
    return Container(
      width: _width,
    );
  }
}
