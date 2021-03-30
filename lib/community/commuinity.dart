import 'package:agriteck_user/community/community-post-list.dart';
import 'package:agriteck_user/community/post-details.dart';
import 'package:agriteck_user/model-data/DataModels.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 61,
      color: primaryLight.withOpacity(0.1),
      child: CommunityPostList(),
    );
  }
}

Future navigateToPostDetails(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => PostDetailScreen()));
}
