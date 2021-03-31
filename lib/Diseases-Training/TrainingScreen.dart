import 'package:agriteck_user/common%20UI/Open_Camera.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

 class Training extends StatefulWidget {
   @override
   _TrainingState createState() => _TrainingState();
 }

 class _TrainingState extends State<Training> {
   @override
   Widget build(BuildContext context) {
     return Container(
       color: Colors.white,
       child: Column(
         children: [
           Container(
             //color: primaryLight,
             margin: EdgeInsets.all(8),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Expanded(
                   flex: 1,
                   child: Container(
                     padding: EdgeInsets.only(left: 5),
                       child: Buttonts(btnText: 'Pest and Diseases', btnIcon: 'assets/icons/pest.png' ,)),
                 ),
                 Expanded(
                   flex: 1,
                   child: Container(
                       padding: EdgeInsets.only(left: 5),
                       child: Buttonts(btnText: 'Weather Update', btnIcon: 'assets/icons/cloud.png' ,)),
                 ),
                 Expanded(
                   flex: 1,
                   child: Container(
                       padding: EdgeInsets.only(left: 5),
                       child: Buttonts(btnText: 'Good Farming Tips', btnIcon: 'assets/icons/tips.png' ,)),
                 ),
               ],
             ),
           ),
           Container(
             child: DiseaseCapture(),
           ),
           Container(
             padding: EdgeInsets.only(top: 10),
             child: Weather(
               temperature: '23.2°',
               location: 'Kumasi, Tanoso',
               date: '27/04/2021',
               weatherStatus: 'Partly cloudy throughout the day',
             ),
           )
         ],
       ),
     );
   }
 }

 class Buttonts extends StatelessWidget{
   final String btnText;
   final String btnIcon;

  const Buttonts({Key key, this.btnText, this.btnIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 90,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: primaryLight ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              height: 30,
              width: 30,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white,
              image: DecorationImage(image: AssetImage(btnIcon,),fit: BoxFit.fill)),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(btnText, style: TextStyle(fontSize: 16, color: Colors.white),),
          )
        ],
      ),

    );
  }
 }

 class DiseaseCapture extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text('Detect Disease'.toUpperCase(), style: TextStyle(fontSize: 20, color: primary,
            fontWeight: FontWeight.w400),),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 120,
                      child: OutlineButton(
                        borderSide: BorderSide(color: primary.withOpacity(0.8), width: 2.0),
                        onPressed: (){},
                        child: ListTile(
                          title: Icon(Icons.camera_alt_outlined, size: 45, color: primaryDark,),
                          subtitle: Text('Open Camera', style: TextStyle(fontSize: 12, color: primaryLight),),
                        )
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 120,
                      child: OutlineButton(
                          borderSide: BorderSide(color: primary.withOpacity(0.8), width: 2.0),
                          onPressed: (){},
                          child: ListTile(
                            title: Image.asset('assets/icons/farm.png',height: 40,width: 40,color: primaryDark,),
                            subtitle: Text('Point to Disease', style: TextStyle(fontSize: 12, color: primaryLight),),
                          )
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 100,
                      width: 120,
                      child: OutlineButton(
                          borderSide: BorderSide(color: primary.withOpacity(0.8), width: 2.0),
                          onPressed: (){},
                          child: ListTile(
                            title: Icon(Icons.center_focus_strong, size: 45, color: primaryDark,),
                            subtitle: Text('Focus and Capture', style: TextStyle(fontSize: 12, color: primaryLight),),
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.center,
              width: size.width * 0.80,
              height: 40,
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: primary,) ,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(Icons.camera_alt, color: Colors.white,),
                    ),
                    InkWell(
                      onTap: () async{
                        await showCameraDialog(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Point and Capture', style: TextStyle(color: Colors.white),)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

 }

 class Weather extends StatelessWidget{
   final String location;
   final String temperature;
   final String date;
   final String weatherStatus;

  const Weather({Key key, this.location, this.temperature, this.date, this.weatherStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 10,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(temperature, style: TextStyle(fontSize: 25, color: Colors.black54,
                        fontWeight: FontWeight.w400),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(location, style: TextStyle(fontSize: 16, color: Colors.black45,
                            fontWeight: FontWeight.w400),),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(date, style: TextStyle(fontSize: 14, color: Colors.black38,
                            fontWeight: FontWeight.w400),),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 110,
                  width: 150,
                  padding: EdgeInsets.all(5),
                  child: Image.asset('assets/icons/weather.jpg', fit: BoxFit.fill,),
                ),
              )
            ],
          ),
          Divider(color: primaryLight,),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text(weatherStatus, style: TextStyle(fontSize: 16, color: Colors.black45),),
          )
        ],
      ),
    );
  }

 }


 