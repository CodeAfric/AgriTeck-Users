import 'package:agriteck_user/CommunityPage/PostDetails.dart';
import 'package:agriteck_user/model-data/DataModels.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Expanded(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            InkWell(
              onTap: () {
                navigateToPostDetails(context);
              },
              child: CommunityItems(),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityItems extends StatelessWidget {
  final CommunityData data = new CommunityData();

  @override
  Widget build(BuildContext context) {
    var comm = GenerateData().community()[0];
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 8),
                blurRadius: 15,
                color: primaryLight.withOpacity(0.5)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: size.width,
            child: Image.asset(
              comm.postImage,
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: size.width * 0.65,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      comm.userImage,
                      height: 45,
                      width: 45,
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text(
                    comm.userName,
                    style: TextStyle(
                        fontSize: 16,
                        color: primary,
                        fontWeight: FontWeight.w400),
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    comm.postTime,
                    style: TextStyle(
                        fontSize: 14,
                        color: primaryLight,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Container(
                height: 70,
                width: size.width * 0.35,
                child: ListTile(
                  title: Text(
                    comm.userLocation,
                    style: TextStyle(
                        fontSize: 16,
                        color: primary,
                        fontWeight: FontWeight.w400),
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    comm.cropName,
                    style: TextStyle(
                        fontSize: 14,
                        color: primaryLight,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: ListTile(
                title: Text(
                  comm.postTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: primaryDark,
                      fontSize: 18,
                      height: 1.5),
                ),
                subtitle: Text(
                  comm.postDescription,
                  style: TextStyle(
                      fontSize: 15,
                      color: primaryLight,
                      fontWeight: FontWeight.w400,
                      height: 1.5),
                  maxLines: 2,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                'Translate',
                style: TextStyle(
                    color: primary, fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future navigateToPostDetails(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => PostDetailScreen()));
}
