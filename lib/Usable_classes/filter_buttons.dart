import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';


class filter_Buttons extends StatelessWidget{
  final String btnText;
  final String btnIcon;

  const filter_Buttons({Key key, this.btnText, this.btnIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 10,
      child: Expanded(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                height: 35,
                width: 35,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(btnIcon,
                    fit: BoxFit.cover,),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 100,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(color: primaryDark, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5))),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(btnText, style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}