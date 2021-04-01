import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/investors/investor-details-screen.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
<<<<<<< HEAD
=======

>>>>>>> 00dab3eecd262392338807215af865867b5972e3

class InvestorList extends StatelessWidget {
  final String investorImage;
  final String investorsName;
  final String investorsContact;
  final String investorLocation;

  const InvestorList(
      {Key key,
      this.investorImage,
      this.investorsName,
      this.investorsContact,
      this.investorLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      //height: size.height * 0.70,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: primaryLight.withOpacity(0.3),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 80.0),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      child: ListItems(
                        investorImage: 'assets/diseases/disease1.jpg',
                        investorsName: 'Prince Ampomah',
                        investorsContact: '+233550935558',
                        investorLocation: 'Juaben Municipal',
                      ),
                    ),
                    onTap: () {
                      sendToPage(context, InvestorDetailsScreen());
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  final String investorImage;
  final String investorsName;
  final String investorsContact;
  final String investorLocation;

  const ListItems(
      {Key key,
      this.investorImage,
      this.investorsName,
      this.investorsContact,
      this.investorLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          child: ListTile(
            isThreeLine: true,
            leading: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(investorImage),
            ),
            title: Text(
              investorsName,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: primaryDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.phone, size: 13, color: Colors.black38),
                    SizedBox(width: 4),
                    Text(
                      investorsContact,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.location_pin, size: 13, color: Colors.red[400]),
                    SizedBox(width: 4),
                    Text(
                      investorLocation,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: Icon(
              Icons.chevron_right_outlined,
              color: primaryLight,
              size: 40,
            ),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       alignment: Alignment.centerLeft,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.all(Radius.circular(15)),
          //       ),
          //       child: Container(
          //         padding: EdgeInsets.all(3.0),
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.all(Radius.circular(3)),
          //           child: Image.asset(
          //             investorImage,
          //             fit: BoxFit.cover,
          //             height: 90,
          //             width: 100,
          //           ),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: Container(
          //         alignment: Alignment.centerLeft,
          //         padding: EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.all(
          //             Radius.circular(15),
          //           ),
          //         ),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Container(
          //               padding: EdgeInsets.only(top: 10),
          //               alignment: Alignment.centerLeft,
          //               child: Text(
          //                 investorsName,
          //                 textAlign: TextAlign.left,
          //                 style: TextStyle(
          //                   fontSize: 16,
          //                   color: primaryDark,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //             Container(
          //               padding: EdgeInsets.only(top: 10),
          //               alignment: Alignment.centerLeft,
          //               child: Text(
          //                 investorsContact,
          //                 textAlign: TextAlign.left,
          //                 style: TextStyle(
          //                   fontSize: 16,
          //                   color: primary,
          //                 ),
          //               ),
          //             ),
          //             Container(
          //               padding: EdgeInsets.only(top: 10),
          //               alignment: Alignment.centerLeft,
          //               child: Text(
          //                 investorLocation,
          //                 textAlign: TextAlign.left,
          //                 style: TextStyle(
          //                   fontSize: 16,
          //                   color: primary,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     Container(
          //       alignment: Alignment.centerRight,
          //       child: Icon(
          //         Icons.chevron_right_outlined,
          //         color: primaryLight,
          //         size: 40,
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
