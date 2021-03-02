import 'package:agriteck_user/FarmsPage/farm_list.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/Diseases/diseases.dart';
import 'package:agriteck_user/Usable_classes/filter_buttons.dart';

class Farms extends StatelessWidget {
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
                  farmList()
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
      title: Text('Farms', style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 22,color: Colors.white)),
    );
  }
}

class filter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: primaryLight,
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
                  },
                  child: filter_Buttons(btnText: 'FARMMS',btnIcon: 'assets/diseases/farm2.jpg',),
                ),
                InkWell(
                  onTap: (){
                    NavigateToVendors(context);
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