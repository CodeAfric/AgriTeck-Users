
import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/crops/crop-details.dart';
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
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
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
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: primaryLight.withOpacity(0.23)),
                      ]),
                  //......creating search bar
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Search',
                      contentPadding: EdgeInsets.all(10),
                      hintStyle: TextStyle(
                        color: primaryLight.withOpacity(0.8),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: primaryLight,
                      ),
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

class CropGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 80.0),
          itemCount: 10,
          itemBuilder: (context, index) {
            return CropItems(
              cropName: 'Tomatoes',
              cropImage: 'assets/diseases/tomatoes.jpg',
            );
          },
        ),
      ),
    );
  }
}

class CropItems extends StatelessWidget {
  final String cropImage;
  final String cropName;

  const CropItems({
    Key key,
    this.cropImage,
    this.cropName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          sendToPage(context, CropDetailsScreen());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                child: Image.asset(
                  cropImage,
                  width: 100,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cropName,
                      style: TextStyle(
                        fontSize: 20,
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.chevron_right_outlined,
                color: primaryLight,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
    // return Card(
    //   elevation: 10,
    //   child: Column(
    //     children: [
    //       Container(
    //         margin: EdgeInsets.only(top: 10),
    //         width: 145,
    //         height: 100,
    //         decoration: BoxDecoration(
    //             border: Border.all(color: primaryDark),
    //             borderRadius: BorderRadius.circular(10)),
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.all(
    //             Radius.circular(10),
    //           ),
    //           child: Image.asset(
    //             cropImage,
    //             width: 145,
    //             height: 100,
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         alignment: Alignment.center,
    //         padding: EdgeInsets.all(10),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Container(
    //               child: Text(
    //                 cropName,
    //                 style: TextStyle(
    //                   fontSize: 16,
    //                   color: primary,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //                 maxLines: 1,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
