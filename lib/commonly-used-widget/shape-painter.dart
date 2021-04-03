import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paintMain = Paint();

    paintMain.color = primaryLight.withOpacity(0.7);

    paintMain.style = PaintingStyle.fill;

    var pathMain = Path();

    pathMain.moveTo(size.width, 0);

    pathMain.quadraticBezierTo(size.width , 0, size.width * 0.6, 0);

    pathMain.quadraticBezierTo(size.width, size.height * 0.4, size.width , size.height * 0.6);

    pathMain.quadraticBezierTo(size.width*.8, size.height * 0.7, size.width, size.height * 0.8);

    pathMain.lineTo(size.width, size.height);

    canvas.drawPath(pathMain, paintMain);

    var paintShadow = Paint();

    paintShadow.color = primaryLight.withOpacity(0.7);
    paintShadow.style = PaintingStyle.fill;

    var pathShadow = Path();

    pathShadow.moveTo(0, size.height);

    pathShadow.quadraticBezierTo(0 , size.height, size.width * 0.4, size.height);

    pathShadow.quadraticBezierTo(0, size.height * 0.6,  0, size.height * 0.4);

    pathShadow.quadraticBezierTo(size.width*.2, size.height * 0.3, 0, size.height * 0.2);

    pathShadow.lineTo(0, size.height);

    canvas.drawPath(pathShadow, paintShadow);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}