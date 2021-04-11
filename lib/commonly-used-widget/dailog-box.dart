import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, btn1Text, btn2Text;
  final String img;
  final Function btn1Press, btn2Press;

  const CustomDialogBox(
      {Key key,
      @required this.btn1Press,
      this.btn2Press,
      this.title,
      this.descriptions,
      @required this.btn1Text,
      this.btn2Text,
      this.img})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                widget.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              )),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  child: Wrap(
                    children: [
                      FlatButton(
                          color: primary,
                          textColor: Colors.white,
                          onPressed: widget.btn1Press,
                          child: Text(
                            widget.btn1Text,
                            style: TextStyle(fontSize: 18),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      widget.btn2Text != null
                          ? FlatButton(
                              color: primaryDark,
                              textColor: Colors.white,
                              onPressed: widget.btn2Press,
                              child: Text(
                                widget.btn2Text,
                                style: TextStyle(fontSize: 18),
                              ))
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: Constants.avatarRadius,
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                  child: Image.asset(widget.img)),
            ),
          ),
        ),
      ],
    );
  }
}

class Constants {
  Constants._();
  static const double padding = 15;
  static const double avatarRadius = 45;
}
