import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'transparent-page.dart';


showToast(BuildContext context, FToast fToast, IconData iconData,
    Color color, String message) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: color,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: Colors.white,
        ),
        SizedBox(
          width: 12.0,
        ),
        Text(message, style: TextStyle(color: Colors.white)),
      ],
    ),
  );
  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: 3),
  );
}

void sendToPage(BuildContext context, Widget newPage) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (BuildContext context) => newPage),
  );
}

void noReturnSendToPage(BuildContext context, Widget newPage) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => newPage),
          (route) => false);
}

void sendToPageTransparent(BuildContext context, Widget newPage) {
  Navigator.of(context)
      .push(TransparentRoute(builder: (BuildContext context) => newPage));
}

Future<void> showSnackBar(
    String message,
    ScaffoldState state,
    ) async {
  final _snackBar = SnackBar(
    content: Text(
      message.toString(),
      textAlign: TextAlign.center,
    ),
    duration: Duration(milliseconds: 4000),
  );
  state.showSnackBar(_snackBar);
  await Future.delayed(Duration(seconds: 1));
}
