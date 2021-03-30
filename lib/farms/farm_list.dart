import 'package:agriteck_user/Toast/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';

class FarmScreen extends StatefulWidget {
  @override
  _FarmScreenState createState() => _FarmScreenState();
}

class _FarmScreenState extends State<FarmScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: ListView.builder(
          padding: EdgeInsets.only(bottom: 80),
          itemCount: 8,
          itemBuilder: (context, index) {
            return ListItems(
              farmImage: 'assets/diseases/farm1.jpeg',
              farmName: "Attah Boakye's farm",
              farmLocation: 'Kwadaso Municipal',
            );
          }),
      // child: ListView(
      //   scrollDirection: Axis.vertical,
      //   children: [
      //     Container(
      //       padding: EdgeInsets.only(bottom: 10),
      //       child: ListItems(
      //         farmImage: 'assets/diseases/farm1.jpeg',
      //         farmName: "Attah Boakye's farm",
      //         farmLocation: 'Kwadaso Municipal',
      //       ),
      //     ),
      //     Container(
      //       padding: EdgeInsets.only(bottom: 10),
      //       child: ListItems(
      //         farmImage: 'assets/diseases/farm2.jpg',
      //         farmName: "Attah Boakye's farm",
      //         farmLocation: 'Kwadaso Municipal',
      //       ),
      //     ),
      //     Container(
      //       padding: EdgeInsets.only(bottom: 10),
      //       child: ListItems(
      //         farmImage: 'assets/diseases/farm1.jpeg',
      //         farmName: "Attah Boakye's farm",
      //         farmLocation: 'Kwadaso Municipal',
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class ListItems extends StatelessWidget {
  final String farmImage;
  final String farmName;
  final String farmLocation;

  const ListItems({Key key, this.farmImage, this.farmName, this.farmLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          showToast(content: 'view farms in details');
        },
        child: Container(
          padding: EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  child: Image.asset(
                    farmImage,
                    width: 125,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        farmName,
                        style: TextStyle(
                          fontSize: 18,
                          color: primary,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        farmLocation,
                        style: TextStyle(
                            fontSize: 14,
                            color: primary,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.chevron_right_outlined,
                  color: primaryLight,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return Container(
    //   child: Container(
    //     height: 100,
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10.0),
    //         color: Colors.white,
    //         boxShadow: [
    //           BoxShadow(
    //               color: primaryLight.withOpacity(0.5),
    //               offset: Offset(0.0, 4.0),
    //               blurRadius: 10.0)
    //         ]),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Expanded(
    //           flex: 2,
    //           child: Container(
    //             height: 100,
    //             width: 110,
    //             margin: EdgeInsets.all(5),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(10),
    //               image: DecorationImage(
    //                 image: AssetImage(
    //                   farmImage,
    //                 ),
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           ),
    //         ),
    //         Expanded(
    //           flex: 3,
    //           child: Container(
    //               padding: EdgeInsets.only(top: 20),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     farmName,
    //                     style: TextStyle(
    //                         fontSize: 16,
    //                         color: primaryDark,
    //                         fontWeight: FontWeight.w400),
    //                   ),
    //                   SizedBox(
    //                     height: 5,
    //                   ),
    //                   Text(
    //                     farmLocation,
    //                     style: TextStyle(
    //                         fontSize: 14,
    //                         color: primaryDark,
    //                         fontWeight: FontWeight.w400),
    //                   ),
    //                 ],
    //               )),
    //         ),
    //         Expanded(
    //           flex: 1,
    //           child: Center(
    //             child: Container(
    //               padding: EdgeInsets.only(left: 5),
    //               alignment: Alignment.centerLeft,
    //               height: 40,
    //               width: 50,
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.only(
    //                       bottomLeft: Radius.circular(10.0),
    //                       topLeft: Radius.circular(10.0)),
    //                   color: primaryDark),
    //               child: Text(
    //                 'Details',
    //                 style: TextStyle(
    //                     fontSize: 12, color: Colors.white, letterSpacing: .1),
    //               ),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
