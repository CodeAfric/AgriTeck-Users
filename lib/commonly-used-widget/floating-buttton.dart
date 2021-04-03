import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';

class FloatingButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onPressHandler;

  const FloatingButton({
    this.label,
    this.icon,
    this.onPressHandler,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: this.onPressHandler,
      label: Text(this.label),
      icon: Icon(
        this.icon,
      ),
      backgroundColor: primaryDark,
      elevation: 10.0,
    );
  }
}
