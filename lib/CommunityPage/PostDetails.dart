import 'package:agriteck_user/model-data/DataModels.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:agriteck_user/CommunityPage/Commuinity.dart';

class PostDetailScreen extends StatefulWidget {
  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryLight,
        title: Text(
          'Post Details',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Details(),
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  final CommunityData data = new CommunityData();
  @override
  Widget build(BuildContext context) {
    var comm = GenerateData().community()[0];
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      color: Colors.white,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
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
                    child: ImageCarousel(),
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
                            color: primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Divider(
                    color: primaryLight,
                  ),
                  SingleChildScrollView(
                    child: Container(
                        height: size.height * 1.0,
                        child: ListView(
                          //physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Coments(),
                            Coments(),
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.30,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/diseases/disease1.jpg'),
          AssetImage('assets/diseases/disease2.jpg'),
          AssetImage('assets/diseases/disease3.jpg'),
        ],
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 2000),
      ),
    );
  }
}

class Coments extends StatelessWidget {
  ComunityComent data = new ComunityComent();
  @override
  Widget build(BuildContext context) {
    var comm = GetComent().posts()[0];
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          comm.comenterImage,
                          height: 45,
                          width: 45,
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Text(
                        comm.comenterName,
                        style: TextStyle(
                            fontSize: 16,
                            color: primary,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                      ),
                      subtitle: Text(
                        comm.comenterTime,
                        style: TextStyle(
                            fontSize: 14,
                            color: primaryLight,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 2),
                      leading: Icon(
                        Icons.place,
                        color: primary,
                      ),
                      title: Text(
                        comm.comenterLocation,
                        style: TextStyle(
                            fontSize: 15,
                            color: primary,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: ListTile(
                contentPadding:
                    EdgeInsets.only(bottom: 10, left: 10, right: 10),
                minVerticalPadding: 5,
                title: Text(
                  comm.comenterName + "'s" + ' ' + 'response',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black45,
                      fontStyle: FontStyle.italic),
                ),
                subtitle: Text(comm.coment,
                    style: TextStyle(
                        fontSize: 16,
                        color: primary,
                        fontWeight: FontWeight.w400,
                        height: 1.5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
