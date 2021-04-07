import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/community-page/post-details.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'community-post-card.dart';

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 61,
      color: primaryLight.withOpacity(0.1),
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 80.0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              child: CommunityItems(),
            ),
            onTap: () {
              sendToPage(context, PostDetailScreen());
            },
          );
        },
      ),
    );
  }
}
