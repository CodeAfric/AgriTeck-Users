
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<bool>(
              groupValue: groupValue,
              value: value,
              activeColor: primaryLight,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
             Flexible(
               child: Text(
                 label,style: TextStyle(
                   fontWeight: FontWeight.bold,color: Colors.black87),),
             ),
          ],
        ),
      ),
    );
  }
}
