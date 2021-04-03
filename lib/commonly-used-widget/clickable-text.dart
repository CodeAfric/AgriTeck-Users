import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final String text1;
  final String text2;
  final Function press;
  ClickableText({Key key,this.press,this.text1,this.text2}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap:press,
        child: Container(
          width: MediaQuery.of(context).size.width*0.9,
          padding: EdgeInsets.all(10),
          child: Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(
                      text: text1,
                      style: TextStyle(color: primaryLight)
                  ),
                  TextSpan(
                    text: text2,
                    style: TextStyle(fontWeight: FontWeight.bold,color: primaryDark),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
