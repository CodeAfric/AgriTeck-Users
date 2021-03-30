
import 'package:agriteck_user/common%20UI/round_button.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum CustomDialogBoxType { INFORMATION,WARNING,QUESTION}
class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, btn1Text,btn2Text;
  final Function btn1Press,btn2Press;
  final CustomDialogBoxType alertType;
  const CustomDialogBox({Key key,@required this.btn1Press,this.btn2Press, this.title, this.descriptions, @required this.btn1Text,this.btn2Text,this.alertType=CustomDialogBoxType.INFORMATION}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        elevation: 4,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width*.5,
          padding: EdgeInsets.only(left: Constants.padding,top: Constants.avatarRadius
              + Constants.padding, right: Constants.padding,bottom: Constants.padding
          ),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 10,),
              Center(child: Text(widget.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),)),
              SizedBox(height: 15,),
              Text(widget.descriptions,style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundedButton(
                        text:widget.btn1Text ,
                        color: primary,
                        horizontalPadding: 15,
                        fontSize: 16,
                        verticalPadding: 3,
                        press:widget.btn1Press ,
                        textColor: Colors.white,
                      ),

                      SizedBox(width: 30,),
                      widget.btn2Text!=null?
                      RoundedButton(
                        verticalPadding: 3,
                        text:widget.btn2Text ,
                        color: Colors.redAccent,
                        horizontalPadding: 15,
                        fontSize: 16,
                        press:widget.btn2Press ,
                        textColor: Colors.white,

                      ):Container(),
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
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
               
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: Constants.avatarRadius,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                  child:widget.alertType==CustomDialogBoxType.INFORMATION?
                  Image.asset("assets/images/info.png"):
                  widget.alertType==CustomDialogBoxType.WARNING?
                  Image.asset("assets/images/warning.png"):
                  widget.alertType==CustomDialogBoxType.QUESTION?
                  Image.asset("assets/images/question.png"):
                  Image.asset("assets/images/info.png")
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Constants{
  Constants._();
  static const double padding =15;
  static const double avatarRadius =45;
}