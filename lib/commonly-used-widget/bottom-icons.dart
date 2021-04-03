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
                ),
                padding: EdgeInsets.only(left: 2, right: 2, top: 3, bottom: 1),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      widget.icons,
                      color: widget.activeIconColor,
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.text,
                      style: TextStyle(
                          color: widget.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              )
            : Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          padding:
          EdgeInsets.only(left: 2, right: 2, top: 3, bottom: 1),
          child: Column(
            children: <Widget>[
              Image.asset(
                widget.icons,
                color: widget.iconColor,
                width: 20,
                height: 20,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                widget.text,
                style: TextStyle(
                    color: Colors.black26,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ],
          ),
        ));
  }
}
