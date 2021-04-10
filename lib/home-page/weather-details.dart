import 'package:agriteck_user/commonly-used-widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class WeatherDetails extends StatefulWidget {
  final List data;

  const WeatherDetails({Key key, this.data}) : super(key: key);

  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails>  with SingleTickerProviderStateMixin  {

  void slideSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          var _height=MediaQuery.of(context).size.height;
          return Container(
            color: Color(0xFF737373),
            child: Container(
              height: _height*.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Row1')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Row2')
                    ],
                  )

                ],
              ),
            ),
          );
        });
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      slideSheet();
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: CustomAppBar(
       leadingIcon: Icons.arrow_back_outlined,
       onIconPress: (){
         Navigator.pop(context);
       },
     ),
      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      )
    );
  }
}
