import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final value;
  final List<String> itemsList;
  final Color dropdownColor;
  final Function(dynamic value) onChanged;
  final String hint;
  const CustomDropDown({
    @required this.value,
    @required this.itemsList,
    this.dropdownColor,
    @required this.hint,
    @required this.onChanged,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(.98),
              blurRadius: 2,
              offset: Offset(0, 2),
            )
          ]),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 2),
          child: Row(
            children: [
              Icon(Icons.category,color: primary,),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 14),
                    child: DropdownButton(
                      isExpanded: true,
                      hint:Text(hint,style: TextStyle(fontWeight: FontWeight.w800),) ,
                      dropdownColor: dropdownColor,
                      value: value,
                      items: itemsList
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item,style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black87),),
                      ))
                          .toList(),
                      onChanged: (value) => onChanged(value),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}