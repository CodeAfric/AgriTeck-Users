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
                padding:  EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      widget.icons,
                      color: widget.activeIconColor,
                      width: 26,
                      height: 26,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.text,
                      style: TextStyle(
                          color: widget.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ],
                ),
              )
            : Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          padding:
          EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                widget.icons,
                color: widget.iconColor,
                width: 22,
                height: 22,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                widget.text,
                style: TextStyle(
                    color: Colors.black26,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ],
          ),
        ));
  }
}
