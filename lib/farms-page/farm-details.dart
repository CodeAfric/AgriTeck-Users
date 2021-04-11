import 'package:agriteck_user/commonly-used-widget/dailog-box.dart';
import 'package:agriteck_user/commonly-used-widget/floating-buttton.dart';
import 'package:agriteck_user/commonly-used-widget/image-carousel.dart';
import 'package:agriteck_user/pojo-classes/farms-data.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class FarmDetailsScreen extends StatelessWidget {
  final Farm farm;
  const FarmDetailsScreen({Key key, this.farm}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageCarousel([
                'assets/diseases/disease1.jpg',
                'assets/diseases/disease1.jpg',
                'assets/diseases/disease1.jpg',
              ]),
              Container(
                height: size.height * 0.70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                      color: Colors.white,
                    ),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          child: FarmContent(
                            farmId: farm.farmId,
                            location: farm.location,
                            description: farm.description,
                            farmCrops: farm.cropType,
                            farmSize: farm.farmSize.toString(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButton(
          label: 'Request Investment',
          icon: Icons.person,
          onPressHandler: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialogBox(
                    title: 'Investment Request',
                    descriptions: 'Your request has been submitted.',
                    btn1Text: '',
                    btn2Text: 'okay',
                    img: 'assets/images/person.png',
                    btn1Press: () {
                      Navigator.pop(context);
                    },
                  );
                });
          }),
    );
  }
}

class FarmContent extends StatelessWidget {
  final String farmId;
  final String location;
  final String description;
  final String farmSize;
  final List farmState;
  final String farmCrops;
  final Map farmer;
  final TextStyle titleFontStyle = TextStyle(color: primaryDark, fontSize: 22);
  final TextStyle textFontStyle = TextStyle(fontSize: 16, height: 1.5);
  FarmContent({
    Key key,
    this.farmId = '',
    this.location = '',
    this.description = '',
    this.farmSize = '',
    this.farmState = const [],
    this.farmer = const {},
    this.farmCrops = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _farmCrops = farmCrops.split(', ');
    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...ListTile.divideTiles(
              color: primary,
              tiles: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  title: Text(
                    'Farm ID',
                    style: titleFontStyle,
                  ),
                  subtitle: Text(
                    farmId,
                    style: textFontStyle,
                  ),
                ),
                ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 4,
                    ),
                    title: Text(
                      'Farm Size',
                      style: titleFontStyle,
                    ),
                    subtitle: Text(farmSize)),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  title: Text(
                    'Crop Type',
                    style: titleFontStyle,
                  ),
                  subtitle: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...List.generate(
                                _farmCrops.length,
                                (index) => Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 3,
                                          backgroundColor: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          _farmCrops[index],
                                          style: textFontStyle,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  title: Text(
                    'Location',
                    style: titleFontStyle,
                  ),
                  subtitle: Text(
                    location,
                    style: textFontStyle,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  title: Text(
                    'Description',
                    style: titleFontStyle,
                  ),
                  subtitle: Text(
                    description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: textFontStyle,
                  ),
                ),
                ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 4,
                    ),
                    title: Text(
                      'Farm State',
                      style: titleFontStyle,
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'stamp: 20/02/21',
                              style: textFontStyle,
                            ),
                            SizedBox(height: 4),
                            Text('state: Land Clearing', style: textFontStyle),
                            SizedBox(height: 4),
                            Text('input: Cutlass, herbicide',
                                style: textFontStyle),
                          ],
                        ),
                        Divider(
                          color: Colors.red,
                        ),
                        SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'stamp: 03/03/21',
                              style: textFontStyle,
                            ),
                            SizedBox(height: 4),
                            Text('state: Planting', style: textFontStyle),
                          ],
                        ),
                        Divider(
                          color: Colors.red,
                        ),
                        SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'stamp: 14/04/21',
                              style: textFontStyle,
                            ),
                            SizedBox(height: 4),
                            Text('state: First Fertilizer',
                                style: textFontStyle),
                            SizedBox(height: 4),
                            Text('input: N:P:K 15, 15, 15',
                                style: textFontStyle),
                          ],
                        ),
                        Divider(
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'stamp: 20/05/21',
                              style: textFontStyle,
                            ),
                            SizedBox(height: 4),
                            Text('state: First Fertilizer',
                                style: textFontStyle),
                            SizedBox(height: 4),
                            Text('input: Asaasewura Fertilizer',
                                style: textFontStyle),
                          ],
                        ),
                        Divider(
                          color: Colors.red,
                        ),
                        SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'stamp: 20/05/21',
                              style: textFontStyle,
                            ),
                            SizedBox(height: 4),
                            Text('state: Harvesting', style: textFontStyle),
                            SizedBox(height: 4),
                            Text('input: Combine Harvester',
                                style: textFontStyle),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
