import 'package:agriteck_user/model-data/DataModels.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';

class CommunityItems extends StatelessWidget {
  final CommunityData data = new CommunityData();
  @override
  Widget build(BuildContext context) {
    var comm = GenerateData().community()[0];
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: Image.asset(
                    comm.postImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: size.width * 0.60,
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
                    width: size.width * 0.30,
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
                        color: primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
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

