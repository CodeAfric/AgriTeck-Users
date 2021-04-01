import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/Diseases/diseases-list.dart';


class DiseasesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryLight,
        title: Text(
          'Diseases',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 61,
            color: primaryLight.withOpacity(0.1),
            child: Column(
              children: [
                DiseasesList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
