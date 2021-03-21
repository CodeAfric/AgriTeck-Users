import 'package:agriteck_user/CropsPage/crops_home.dart';
import 'package:agriteck_user/DiseasesDetails/diseases_details_Screen.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:agriteck_user/Usable_classes/filter_buttons.dart';
import 'package:agriteck_user/FarmsPage/farmsHome.dart';
import 'package:agriteck_user/Vendors/vendorsHome.dart';


class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
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


class diseases_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      //height: size.height * 0.70,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
          color: primaryLight.withOpacity(0.3),),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text('Plant diseases'.toUpperCase(), style: TextStyle(color: primaryDark,
                  fontWeight: FontWeight.w600,fontSize: 16),), ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  InkWell(
                    child: Container(
                      child: listItems(disease_image: 'assets/diseases/disease1.jpg',
                        disease_name: 'Curly flew Shoot',
                        plant_type: 'general grass',),
                    ),
                    onTap: (){
                      NavigateToDiseasesDetails(context);
                    },
                  ),
                  InkWell(
                    child: Container(
                      child: listItems(disease_image: 'assets/diseases/disease1.jpg',
                        disease_name: 'Curly flew Shoot',
                        plant_type: 'general grass',),
                    ),
                    onTap: (){
                      NavigateToDiseasesDetails(context);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class listItems extends StatelessWidget{
  final String disease_image;
  final String disease_name;
  final String plant_type;

  const listItems({Key key, this.disease_image, this.disease_name, this.plant_type}) : super(key: key);

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
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image.asset(disease_image,fit: BoxFit.cover,
                    height: 90,width: 100,),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15),),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(disease_name,textAlign:TextAlign.left, style: TextStyle(fontSize: 16,color: primaryDark,
                          fontWeight: FontWeight.bold,),),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(plant_type,textAlign:TextAlign.left, style: TextStyle(fontSize: 16,
                          color: primary,),),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Icon(Icons.chevron_right_outlined,color: primaryLight, size: 40,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future NavigateToCrops(context)async{
  Navigator.push(context, MaterialPageRoute(builder: (context)
  => cropsHome()));
}

Future NavigateToDiseasesDetails(context)async{
  Navigator.push(context, MaterialPageRoute(builder: (context)
  => diseases_details_Screen()));
}
Future NavigateToFarms(context)async{
  Navigator.push(context, MaterialPageRoute(builder: (context)
  => farms_Home()));
}

Future NavigateToVendors(context)async{
  Navigator.push(context, MaterialPageRoute(builder: (context)
  => vendors_Home()));
}