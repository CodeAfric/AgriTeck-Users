import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';

class vondors_list extends StatefulWidget {
  @override
  _vondors_listState createState() => _vondors_listState();
}

class _vondors_listState extends State<vondors_list> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Divider(color: primaryDark,thickness: 2,),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Text('Vendors and Investors'.toUpperCase(), style: TextStyle(color: primaryDark,
                  fontWeight: FontWeight.w600,fontSize: 16),),
            ),
            Expanded(
              child: Container(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: listItems(user_Image: 'assets/diseases/farmer1.jpg', user_Name: "Benson Bentum Bruz",
                        user_type: 'Vendor', user_location: 'Tmamale',),
                    ),

                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: listItems(user_Image: 'assets/diseases/farmer2.jpg', user_Name: "Kwamena Adusei Asong",
                        user_type: 'Investor', user_location: 'Kumasi',),
                    ),

                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: listItems(user_Image: 'assets/diseases/farmer1.jpg', user_Name: "Benson Bentum Bruz",
                        user_type: 'Vendor', user_location: 'Sunyani',),
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
  final String user_Image;
  final String user_Name;
  final String user_type;
  final String user_location;

  const listItems({Key key, this.user_Image, this.user_Name, this.user_type, this.user_location}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: primaryLight.withOpacity(0.3),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 120,
              height: 110,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(color: primaryLight, borderRadius: BorderRadius.circular(10),),
                    height: double.infinity,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                  ),
                  Container(
                    decoration: BoxDecoration(color: primaryDark, borderRadius: BorderRadius.circular(10),),
                    height: double.infinity,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 110,
                    //height: double.infinity,
                    //width: double.infinity,
                    margin:  const EdgeInsets.only(bottom: 16, top: 10,),
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(user_Image),fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user_Name, style: TextStyle(fontSize: 16, color: primaryDark, fontWeight: FontWeight.w400),),
                  SizedBox(
                    height: 5,
                  ),
                  Text(user_type, style: TextStyle(fontSize: 14, color: primaryDark, fontWeight: FontWeight.w400),),
                  SizedBox(
                    height: 5,
                  ),
                  Text(user_location, style: TextStyle(fontSize: 14, color: primaryDark, fontWeight: FontWeight.w400),),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerRight,
              child: Icon(Icons.chevron_right_outlined,color: Colors.white, size: 40,),
            ),
          ),
        ],
      ),
    );
  }
}