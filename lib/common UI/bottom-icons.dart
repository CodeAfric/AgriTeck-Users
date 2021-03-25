import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomIcons extends StatefulWidget {
  Function onPressed;
  bool bottomIcons;
  String text;
  String icons;
  Color activeIconColor;
  Color textColor;
  Color iconColor;
  Color activeColor;
  
  BottomIcons(
      {@required this.onPressed,
      @required this.bottomIcons,
      @required this.icons,
      @required this.text,
        @required this.iconColor,
        @required this.activeIconColor,
        @required this.textColor,
        @required this.activeColor,
        
      });
  @override
  _BottomIconsState createState() => _BottomIconsState();
}

class _BottomIconsState extends State<BottomIcons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onPressed,
        child: widget.bottomIcons == true
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: widget.activeColor
                ),
                padding:
                    EdgeInsets.only(left: 18, right: 18, top: 7, bottom: 7),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      widget.icons,
                      color: widget.activeIconColor,
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.text,
                      style: TextStyle(
                          color: widget.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              )
            : Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      widget.icons,
                      color: widget.iconColor,
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ));
  }
}
