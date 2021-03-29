import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/CropsPage/crops_Grid.dart';

class CropScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          SearchBar(),
          CropGrid(),
        ],
      ),
    );
  }
}
