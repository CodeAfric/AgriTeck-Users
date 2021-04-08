import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

import 'crops-details.dart';

class CropCard extends StatelessWidget {
  final String cropImage;
  final String cropName;

  const CropCard({
    Key key,
    this.cropImage,
    this.cropName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Container(
                  padding: EdgeInsets.all(3.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    child: Image.asset(
                      cropImage,
                      fit: BoxFit.cover,
                      height: 60,
                      width: 100,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          cropName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            color: primaryDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          cropName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: primary,
                          ),
                        ),
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
    // return Card(
    //   elevation: 10,
    //   child: Column(
    //     children: [
    //       Container(
    //         margin: EdgeInsets.only(top: 10),
    //         width: 145,
    //         height: 100,
    //         decoration: BoxDecoration(
    //             border: Border.all(color: primaryDark),
    //             borderRadius: BorderRadius.circular(10)),
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.all(
    //             Radius.circular(10),
    //           ),
    //           child: Image.asset(
    //             cropImage,
    //             width: 145,
    //             height: 100,
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         alignment: Alignment.center,
    //         padding: EdgeInsets.all(10),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Container(
    //               child: Text(
    //                 cropName,
    //                 style: TextStyle(
    //                   fontSize: 16,
    //                   color: primary,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //                 maxLines: 1,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
