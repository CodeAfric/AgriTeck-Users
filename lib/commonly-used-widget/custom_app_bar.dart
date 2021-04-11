import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final IconData leadingIcon;
  final Function onIconPress;
  final String title;
  CustomAppBar({@required this.leadingIcon,this.onIconPress,this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:primary,
      elevation: 0.0,
      leading: IconButton(
        icon:  Icon(leadingIcon, color: Colors.white,),
        iconSize: 28.0,
        onPressed: onIconPress,
      ),
      title: Text(title!=null?title:''),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
