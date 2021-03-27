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
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text('Farms'.toUpperCase(), style: TextStyle(color: primaryDark,
                  fontWeight: FontWeight.w600,fontSize: 16),), ),
            Expanded(
              child: Container(
               // padding: EdgeInsets.only(top: 10,bottom: 20),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: listItems(farm_Image: 'assets/diseases/farm1.jpeg', farm_Name: "Attah Boakye's farm",
                      farm_Location: 'Kwadaso Municipal',),
                    ),

                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: listItems(farm_Image: 'assets/diseases/farm2.jpg', farm_Name: "Attah Boakye's farm",
                        farm_Location: 'Kwadaso Municipal',),
                    ),

                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: listItems(farm_Image: 'assets/diseases/farm1.jpeg', farm_Name: "Attah Boakye's farm",
                        farm_Location: 'Kwadaso Municipal',),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class listItems extends StatelessWidget{
  final String farm_Image;
  final String farm_Name;
  final String farm_Location;

  const listItems({Key key, this.farm_Image, this.farm_Name, this.farm_Location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white,
              boxShadow: [BoxShadow(color: primaryLight.withOpacity(0.5), offset: Offset(0.0, 4.0),blurRadius: 10.0)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 100,
                      width: 110,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage(farm_Image,), fit: BoxFit.cover,),),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(farm_Name, style: TextStyle(fontSize: 16, color: primaryDark, fontWeight: FontWeight.w400),),
                            SizedBox(
                              height: 5,
                            ),
                            Text(farm_Location, style: TextStyle(fontSize: 14, color: primaryDark, fontWeight: FontWeight.w400),),
                          ],
                        )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)), color: primaryDark),
                        child: Text('Details', style: TextStyle(fontSize: 12, color: Colors.white,letterSpacing: .1),),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
