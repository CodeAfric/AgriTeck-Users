import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _width=MediaQuery.of(context).size.width;
    var _height=MediaQuery.of(context).size.width;
    return Container(
      width:_width ,
      height: _height-70,

    );
  }
}
