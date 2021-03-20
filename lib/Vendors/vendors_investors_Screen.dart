import 'package:agriteck_user/Home_Page/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:agriteck_user/Usable_classes/filter_buttons.dart';
import 'package:agriteck_user/Vendors/vendors_investors.dart';
import 'package:agriteck_user/CropsPage/crops_home.dart';
import 'package:agriteck_user/FarmsPage/farmsHome.dart';
import 'package:agriteck_user/Diseases/diseases.dart';

class Vendors_Investors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: PageView(
        scrollDirection: Axis.vertical,
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(),
            body: SafeArea(
              child: Column(
                children: [
                  filter(),
                  vondors_list(),
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }
  AppBar buildAppBar(){
    return AppBar(
      elevation: 0,
      backgroundColor: primaryDark,
      title: Text('Vendors/Investors', style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 22,color: Colors.white)),
    );
  }
}

class filter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10),
      height:115,
          child: Expanded(
            child: Container(
              //margin: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                children: [
                  InkWell(
                    child: filter_Buttons(btnText: 'CROPS',btnIcon: 'assets/diseases/tomatoes.jpg',),
                    onTap: (){
                      NavigateToCrops(context);
                    },
                  ),
                  InkWell(
                    onTap: (){
                      NavigateToFarms(context);
                    },
                    child: filter_Buttons(btnText: 'FARMMS',btnIcon: 'assets/diseases/farm2.jpg',),
                  ),
                  InkWell(
                    onTap: (){
                    },
                    child: filter_Buttons(btnText: 'VENDORS',btnIcon: 'assets/diseases/disease1.jpg',),
                  ),
                  InkWell(
                    onTap: (){},
                    child: filter_Buttons(btnText: 'MARKET',btnIcon: 'assets/diseases/disease1.jpg',),),
                ],
              ),
            ),
          )
    );
  }

}

Future NavigateToCrops(context)async{
  Navigator.push(context, MaterialPageRoute(builder: (context)
  => cropsHome()));
}

Future NavigateToDiseases(context)async{
  Navigator.push(context, MaterialPageRoute(builder: (context)
  => diseases_HomeScreen()));
}
Future NavigateToFarms(context)async{
  Navigator.push(context, MaterialPageRoute(builder: (context)
  => farms_Home()));
}