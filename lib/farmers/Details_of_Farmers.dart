import 'package:agriteck_user/model-data/DataModels.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class FarmersDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryLight,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProfileHeader(),
              const SizedBox(height: 10.0),
              UserInfo(),
            ],
          ),
        ));
  }
}

class UserInfo extends StatelessWidget {
  final Farmers data = new Farmers();
  @override
  Widget build(BuildContext context) {
    var details = Farmers_data().farmers_details()[0];
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: Text(
              "Farmer's Information",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ...ListTile.divideTiles(
                        color: primaryLight,
                        tiles: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            leading: Icon(Icons.person),
                            title: Text("ID", style: TextStyle(color: primary,fontSize: 16,fontWeight: FontWeight.w600 ),),
                            subtitle: Text(details.farmerId, style: TextStyle(color: primaryLight.withOpacity(0.5),fontSize: 14  ),),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            leading: Icon(Icons.my_location),
                            title: Text("Location", style: TextStyle(color: primary,fontSize: 16,fontWeight: FontWeight.w600 ),),
                            subtitle: Text(details.farmerLocation, style: TextStyle(color: primaryLight,fontSize: 14  ),),
                          ),
                          ListTile(
                            leading: Icon(Icons.confirmation_num),
                            title: Text("Age", style: TextStyle(color: primary,fontSize: 16,fontWeight: FontWeight.w600 ),),
                            subtitle: Text(details.farmerAge, style: TextStyle(color: primaryLight,fontSize: 14 ),),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("Phone", style: TextStyle(color: primary,fontSize: 16,fontWeight: FontWeight.w600 ),),
                            subtitle: Text(details.farmerContact, style: TextStyle(color: primaryLight,fontSize: 14  ),),
                          ),
                          ListTile(
                            leading: Icon(Icons.library_books_outlined),
                            title: Text("Speciality", style: TextStyle(color: primary,fontSize: 16,fontWeight: FontWeight.w600 ),),
                            subtitle: Text('${details.speciality.join("\n" )}', style: TextStyle(color: primaryLight,fontSize: 14  ),),
                          ),
                          ListTile(
                            leading: Icon(Icons.format_list_numbered),
                            title: Text("No. of Plots", style: TextStyle(color: primary,fontSize: 16,fontWeight: FontWeight.w600 ),),
                            subtitle: Text(details.number_of_Plots, style: TextStyle(color: primaryLight,fontSize: 14  ),),
                          ),
                          ListTile(
                            leading: Icon(Icons.format_list_numbered_rtl),
                            title: Text("Total Farm size", style: TextStyle(color: primary,fontSize: 16,fontWeight: FontWeight.w600 ),),
                            subtitle: Text(details.farmSize, style: TextStyle(color: primaryLight,fontSize: 14  ),),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final Farmers data = new Farmers();

  @override
  Widget build(BuildContext context) {
    var details = Farmers_data().farmers_details()[0];
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/farmers.jpg'),
          fit: BoxFit.cover),color: Colors.white, ),
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: RichText(
              text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Agri',
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50, color: Colors.white70),
                    ),
                    TextSpan(
                      text: 'Teck',
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50, color: Colors.white70),
                    )
                  ]
              ),
            ),
          ),
        ),
        Ink(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black38,
          ),
        ),
        Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(bottom: 0.0, right: 0.0),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.call, color: primaryDark, size: 30,)),
                )
              ],
            ),
          ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 160),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 48,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 45 ,
                  backgroundImage: AssetImage(details.farmerImage),
                  ),
              ),
              Text(
                details.farmerName,
                style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 5.0),
              Text(
                'Farmer',
                style: TextStyle(fontSize: 16, color: Colors.white70,fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ],
    );
  }
}



