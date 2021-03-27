import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.10,
          decoration: BoxDecoration(color: primary,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: size.height * 0.05,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(offset: Offset(0,10),
                            blurRadius: 50, color: primaryLight.withOpacity(0.23)
                        ),
                      ]
                  ),
                  //......creating search bar
                  child: TextField(
                    onChanged: (value){},
                    decoration: InputDecoration(
                      hintText: 'Search',
                      contentPadding: EdgeInsets.all(10),
                      hintStyle: TextStyle(
                        color: primaryLight.withOpacity(0.8),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(Icons.search, color: primaryLight,),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class crop_grid  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.60,
      child: Column(
        children: [
          Container(
           // padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.only(top: 20,bottom: 5,left: 20),
              child: Text('CROPS',style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 18, color: primary),),
            ),
          ),
         Container(
           child: Expanded(
             child: ListView(
               scrollDirection: Axis.vertical,
               children: [
                 Center(
                   child: Wrap(
                     spacing: 5,
                     runSpacing: 5,
                     children: [
                       Container(
                         child: crop_Items(crop_name: 'Tomatoes', crop_image: 'assets/diseases/tomatoes.jpg',),
                       ),
                       Container(
                         child: crop_Items(crop_name: 'Cabbage', crop_image: 'assets/diseases/Cabbage.jpg',),
                       ),
                       Container(
                         child: crop_Items(crop_name: 'Tomatoes', crop_image: 'assets/diseases/tomatoes.jpg',),
                       ),
                       Container(
                         child: crop_Items(crop_name: 'Cabbage', crop_image: 'assets/diseases/Cabbage.jpg',),
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         )
        ],
      ),

    );
  }
}


class crop_Items extends StatelessWidget{
  final String crop_image;
  final String crop_name;

  const crop_Items({Key key, this.crop_image, this.crop_name,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: Expanded(
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 145, height: 100,
                decoration:  BoxDecoration(border: Border.all(color: primaryDark),
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10),),
                  child: Image.asset(crop_image, width: 145, height: 100, fit: BoxFit.cover,),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(crop_name, style: TextStyle(fontSize: 16,color: primary,
                        fontWeight: FontWeight.bold,),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
